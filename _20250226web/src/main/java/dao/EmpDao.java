package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.EmpDto;

public class EmpDao {
	
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/spring5fs?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
	private static final String USER = "root";
	private static final String PASS = "1234";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void connect() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASS);
			
			if (conn != null) {
				System.out.println("DB 연결 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EmpDto> selectAll() {						// 리턴되는 type을 써야함 (변수명 X) 
		ArrayList<EmpDto> list = new ArrayList<EmpDto>();		// Dept 테이블의 모든 레코드를 저장할 장소 선언
		try {
			connect();
			String sql = "select * from emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmpDto empDto = new EmpDto(rs.getInt("empno"), rs.getString("ename"), rs.getInt("sal"));
				list.add(empDto);								// 한 레코드씩 저장
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
				
	}
	
}
