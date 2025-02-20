<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" %>
<% 
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String empno = request.getParameter("userid");
String ename = request.getParameter("password"); 

try {
    System.out.println("empno: " + empno + ", ename: " + ename);  // 입력값 확인용
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring5fs", "root", "1234"); 

    String sql = "SELECT * FROM emp WHERE empno = ? AND ename = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, empno);  
    pstmt.setString(2, ename); 

    rs = pstmt.executeQuery(); 
    
    System.out.println("쿼리문 실행 완료");

    if (rs.next()) {
        session.setAttribute("empno", empno);
        session.setAttribute("ename", ename);  
        response.sendRedirect("main.jsp");  
    } else {
        System.out.println("로그인 실패");
        response.sendRedirect("login.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();  
} finally {
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException se) {
        se.printStackTrace();
    }
}
%>
