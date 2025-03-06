<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
	
    // 세션에서 사용자 정보를 가져오기
    String userId = (String) session.getAttribute("ID");
    String userName = (String) session.getAttribute("NAME");
 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>백준</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <script src="https://kit.fontawesome.com/c47106c6a7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/ie.js"></script>
</head>

<body>

    <header>
        <div class="inner">
            <h1><a href="#">백준</a></h1>
                
            <ul id="gnb">
                <li><a href="problemList.jsp">문제</a></li>
                <li><a href="fileupload/fileList.jsp">채점</a></li>
            </ul>

            <ul class="util">
                <% 
                    if (userId != null) { 
                %>
                    <li><a href="logout.jsp"><%= userName %> | 로그아웃</a></li>
                <% } else { %>
                    <li><a href="login.jsp">로그인</a></li>
                    <li><a href="join.jsp">회원가입</a></li>
                <% } %>
            </ul>
        </div>
    </header>
</body>

</html>
