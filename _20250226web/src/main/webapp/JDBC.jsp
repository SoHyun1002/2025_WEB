<%@page import="dao.DeptDao"%>
<%@page import="dto.DeptDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
DeptDao deptDao = new DeptDao();
deptDao.connect();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border = "1">
<%
for (DeptDto deptDto : deptDao.selectAll()){
%>
<tr>
	<td><%= deptDto.getDeptno() %></td>
	<td><%= deptDto.getDname() %></td>
	<td><%= deptDto.getLoc() %></td>
</tr>
<%
}
%>
</table>
</body>
</html>