<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp 입력</title>
</head>
<body>
<form action = "insert.jsp">
번호 : <br> <input type = "text" name = "empno" /> <br>
이름 : <br> <input type = "text" name = "ename" /> <br>
직업 : <br> <input type = "text" name = "job" /> <br>
상사번호 : <br> <input type = "text" name = "mgr" /> <br>
입사날짜 : <br> <input type = "text" name = "hiredate" /> <br>
연봉 : <br> <input type = "text" name = "sal" /> <br> 
커미션 : <br> <input type = "text" name = "comm" /> <br>
부서번호 : <br> <input type = "text" name = "deptno" /> <br>
<input type = "submit" />
</form>
</body>
</html>