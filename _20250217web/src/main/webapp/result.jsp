<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입 성공</h2>
<p>당신의 ID : </p>
<%= request.getParameter("id") %>
<p><br>당신의 PASS : </p>
<%= request.getParameter("pass") %>
</body>
</html>