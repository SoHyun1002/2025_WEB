package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import dto.MemberDTO;
import util.DBConnection;

public class MemberDAO {
	// 게시글 작성
    public void insert(MemberDTO dto) {
        String sql = "INSERT INTO Member (username, age) VALUES (?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, dto.getUsername());
            pstmt.setInt(2, dto.getAge());
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
 // 게시글 목록 조회
    public List<MemberDTO> getList() {
        List<MemberDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM Member ORDER BY username";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
            	MemberDTO dto = new MemberDTO(rs.getString("username"), rs.getInt("age"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}