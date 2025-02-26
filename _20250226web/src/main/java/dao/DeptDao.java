package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.DeptDto;

public class DeptDao {
	
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
	
	public ArrayList<DeptDto> selectAll() {						// 리턴되는 type을 써야함 (변수명 X) 
		ArrayList<DeptDto> list = new ArrayList<DeptDto>();		// Dept 테이블의 모든 레코드를 저장할 장소 선언
		try {
			connect();
			String sql = "select * from dept";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DeptDto deptDto = new DeptDto(rs.getInt("deptno"), rs.getString("dname"), rs.getString("loc"));
				list.add(deptDto);								// 한 레코드씩 저장
				
//				System.out.print(rs.getString(1));
//				System.out.print(rs.getString(2));
//				System.out.println(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
				
	}
	
}
