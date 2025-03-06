<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
// 세션에서 사용자 정보를 가져오기
String userId = (String) session.getAttribute("ID");
String userName = (String) session.getAttribute("NAME");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 목록</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<script src="https://kit.fontawesome.com/c47106c6a7.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/style.css">
<script src="js/ie.js"></script>
</head>
<body>
	<header>
		<div class="inner">
			<h1>
				<a href="../main.jsp">백준</a>
			</h1>

			<ul id="gnb">
				<li><a href="../problemList.jsp">문제</a></li>
				<li><a href="#">채점</a></li>
			</ul>

			<ul class="util">
				<%
				if (userId != null) {
				%>
				<li><a href="logout.jsp"><%=userName%> | 로그아웃</a></li>
				<%
				} else {
				%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</header>
	
	<div class = "board-container">
		<table class = "board-table">
			<tr class = "board-table">
				<th>파일명</th>
				<th>설명</th>
				<th>업로드 날짜</th>
				<th>다운로드</th>
				<th>삭제</th>
			</tr>
			<%
			String jdbcUrl = "jdbc:mysql://localhost:3308/bjccp";
			String dbId = "sh";
			String dbPass = "1002";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

				String sql = "SELECT * FROM uploaded_files ORDER BY upload_date DESC";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("original_file_name")%></td>
				<td><%=rs.getString("description")%></td>
				<td><%=rs.getString("upload_date")%></td>
				<td><a
					href="download.jsp?fileName=<%=rs.getString("file_name")%>">다운로드</a></td>
				<td><a href="#"
					onclick="deleteFile('<%=rs.getString("file_name")%>')">삭제</a></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			out.println("오류 발생: " + e.getMessage());
			} finally {
			if (rs != null)
			try {
				rs.close();
			} catch (Exception e) {
			}
			if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
			}
			if (conn != null)
			try {
				conn.close();
			} catch (Exception e) {
			}
			}
			%>
		</table>
	
	<br>
	<a href="fileUpload.jsp">파일 업로드 페이지로 이동</a>
</div>
	<script>
		function deleteFile(fileName) {
			if (confirm('정말로 이 파일을 삭제하시겠습니까?')) {
				location.href = 'deleteFile.jsp?fileName=' + fileName;
			}
		}
	</script>
</body>
</html>
