<%@page import="dao.EmpDao"%>
<%@page import="dto.EmpDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
EmpDao empDao = new EmpDao();
empDao.connect();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
for (EmpDto empDto : empDao.selectAll()){
	out.print(empDto.getEmpno());
	out.print(empDto.getEname());
	out.println(empDto.getSal());
}
%>
</body>
</html>