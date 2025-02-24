<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // 세션 객체는 JSP에서 기본적으로 제공되므로 새로 선언할 필요가 없습니다.
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    Connection conn = null;
    PreparedStatement pstmt = null;

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
        String sql = "INSERT INTO user(id, pass) VALUES (?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pass);
        
        // INSERT 쿼리 실행
        int rowsAffected = pstmt.executeUpdate();
        
        if (rowsAffected > 0) {
            // 데이터 삽입이 성공적으로 이루어졌다면 login.jsp로 리디렉션
            response.sendRedirect("login.jsp");
        } else {
            // 삽입이 실패한 경우 에러 메시지를 전달할 수 있음
            out.println("회원가입 실패. 다시 시도해주세요.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        // 예외 처리: 에러 발생 시 에러 메시지를 전달
        out.println("오류 발생: " + e.getMessage());
    } finally {
        // 리소스 해제
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
