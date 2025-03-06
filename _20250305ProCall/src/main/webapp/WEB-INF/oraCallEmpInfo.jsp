<%@ page import="java.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.Types" %>
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
        // JNDI 초기화
        Context ctx = new InitialContext();
        
        // JNDI에서 데이터소스 조회
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
        
        // 데이터베이스 연결 가져오기
        Connection conn = ds.getConnection();
        
        // 저장 프로시저 호출 SQL
        String sql = "{call Emp_Info3(?, ?)}";
        CallableStatement cs = conn.prepareCall(sql);
        
        // 클라이언트로부터 empno 파라미터 받기
        int empno = Integer.parseInt(request.getParameter("empno"));
        System.out.println("empno -> " + empno);
        
        // 출력 파라미터 등록
        cs.registerOutParameter(2, Types.DOUBLE);
        
        // 입력 파라미터 설정
        cs.setInt(1, empno);
        
        // 저장 프로시저 실행
        cs.execute();
        
        // 출력 파라미터 값 출력
        out.println("급여 : " + cs.getDouble(2));
        
        // 리소스 정리
        cs.close();
        conn.close();
%>
</body>
</html>
