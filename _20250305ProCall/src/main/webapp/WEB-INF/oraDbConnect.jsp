<%@ page import="java.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    try {
        // JNDI 초기화
        Context init = new InitialContext();
        
        // JNDI에서 데이터소스 조회
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
        
        // 데이터베이스 연결 가져오기
        Connection conn = ds.getConnection();
        
        // 연결 성공 여부 확인
        if (conn != null) {
            out.println("연결 성공");
        } else {
            out.println("연결 실패");
        }
        
        // 연결 종료
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("연결 실패: " + e.getMessage());
    }
%>

</body>
</html>
