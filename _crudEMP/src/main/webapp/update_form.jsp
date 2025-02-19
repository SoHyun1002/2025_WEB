<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
String empno = request.getParameter("empno");

String ename = "";
String job = "";
String mgr = "";
String hiredate = "";
String sal = "";
String comm = "";
String deptno = "";

String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "SELECT * FROM emp WHERE empno = ?";

try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
     PreparedStatement stmt = conn.prepareStatement(sql)) {
    stmt.setString(1, empno);
    ResultSet rs = stmt.executeQuery();
    
    if (rs.next()) {
        ename = rs.getString("ename");
        job = rs.getString("job");
        mgr = rs.getString("mgr");
        hiredate = rs.getString("hiredate");
        sal = rs.getString("sal");
        comm = rs.getString("comm");
        deptno = rs.getString("deptno");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp 수정</title>
</head>
<body>
<form action="update.jsp" method="post">
    <input type="hidden" name="empno" value="<%= empno %>" />
    번호 : <br> 
    <input type="text" name="empno" value="<%= empno %>" readonly /> <br>
    
    이름 : <br> 
    <input type="text" name="ename" value="<%= ename %>" /> <br>
    
    직업 : <br> 
    <input type="text" name="job" value="<%= job %>" /> <br>
    
    상사번호 : <br> 
    <input type="text" name="mgr" value="<%= mgr %>" /> <br>
    
    입사날짜 : <br> 
    <input type="text" name="hiredate" value="<%= hiredate %>" /> <br>
    
    연봉 : <br> 
    <input type="text" name="sal" value="<%= sal %>" /> <br>
    
    커미션 : <br> 
    <input type="text" name="comm" value="<%= comm %>" /> <br>
    
    부서번호 : <br> 
    <input type="text" name="deptno" value="<%= deptno %>" /> <br>
    
    <input type="submit" value="수정" />
</form>
</body>
</html>
