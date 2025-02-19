<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "select * from emp;";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp table</title>
</head>
<body>
<table border = "1">
<tr><th>EMPNO</th><th>ENAME</th><th>JOB</th><th>MGR</th><th>HIREDATE</th><th>SAL</th><th>COMM</th><th>DEPTNO</th><th>DEL</th></tr>
<%
try(Connection conn = DriverManager.getConnection(URL, "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);){
		while(rs.next()) { 
%>
<tr>
<td><a href="update_form.jsp?empno=<%= rs.getString("empno") %>"><%= rs.getString("empno") %></a></td>
<td><%= rs.getString("ename") %></td>
<td><%= rs.getString("job") %></td><td><%= rs.getString("mgr") %></td>
<td><%= rs.getString("hiredate") %></td><td><%= rs.getString("sal") %></td>
<td><%= rs.getString("comm") %></td><td><%= rs.getString("deptno") %></td>
<td><a href="delete.jsp?empno=<%= rs.getString("empno") %>">삭제</a></td>
</tr>
<% 
	} 
} catch(Exception e){ e.printStackTrace(); }
%>
</table>
<a href="form_insert.jsp">emp 입력</a>
</body>
</html>