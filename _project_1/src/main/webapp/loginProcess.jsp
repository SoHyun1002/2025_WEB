<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // 세션 객체는 JSP에서 기본적으로 제공되므로 새로 선언할 필요가 없습니다.
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    // JDBC 연결 정보
    String jdbcUrl = "jdbc:mysql://localhost:3308/bjccp";
    String username = "sh";
    String password = "1002";
    
    try {
        // MySQL 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // 데이터베이스 연결
        conn = DriverManager.getConnection(jdbcUrl, username, password);
        
        // SQL 쿼리 작성
        String sql = "SELECT * FROM user WHERE ID=? AND PASS=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pass);
        
        // 쿼리 실행
        rs = pstmt.executeQuery();
        
        // 로그인 성공 시 세션에 정보 저장 후 main.jsp로 리디렉션
        if (rs.next()) {
            session.setAttribute("id", id);
            session.setAttribute("pass", pass);
            response.sendRedirect("main.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
        
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        if (rs != null) try { rs.close(); } catch(Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if (conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
