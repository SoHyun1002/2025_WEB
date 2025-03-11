import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

public class MemberDao {
	
	private JdbcTemplate jdbcTemplate;
	
	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public Member selectByEmail(String email) {
		List<Member> results = jdbcTemplate.query("select * from MEMBER where EMAIL = ?",
				new MemberRowMapper(), email);
		return results.isEmpty() ? null : results.get(0);
	}

	public void insert(Member member) {
		jdbcTemplate.update(new PreparedStatementCreator(){
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
				PreparedStatement pstmt = con.prepareStatement("insert into MEMBER (EMAIL, PASSWORD, NAME, REGDATE) values (?, ?, ?, ?)");
				pstmt.setString(1,  member.getEmail());  // EMAIL
				pstmt.setString(2,  member.getPassword()); // PASSWORD
				pstmt.setString(3,  member.getName());  // NAME
				pstmt.setTimestamp(4,  Timestamp.valueOf(member.getRegisterDateTime()));  // REGDATE
				return pstmt;
			}
		});
	}

	public void update(Member member) {
		jdbcTemplate.update(
				"update MEMBER set NAME = ?, PASSWORD = ? where EMAIL = ?",  // fixed typo (NAEM -> NAME)
				member.getName(), member.getPassword(), member.getEmail());
	}

	public List<Member> selectAll() {
		List<Member> results = jdbcTemplate.query("select * from MEMBER", 
				new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException{
				Member member = new Member(
						rs.getString("EMAIL"),
						rs.getString("PASSWORD"),
						rs.getString("NAME"),
						rs.getTimestamp("REGDATE").toLocalDateTime());
				member.setId(rs.getLong("ID"));
				return member;
			}
		});
		return results;
	}
}
