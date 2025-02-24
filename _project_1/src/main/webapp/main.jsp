<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션에서 사용자 정보를 가져오기
    String userId = (String) session.getAttribute("id");
    String userPass = (String) session.getAttribute("pass");
    
    // 세션에 값이 있으면 사용자 정보 출력, 없으면 로그인 요청 메시지 출력
    if (userId != null && userPass != null) {
        out.println("로그인 성공! 환영합니다, " + userId + "님.");
        // 추가로 사용자 정보 기반 작업을 할 수 있습니다.
    } else {
        out.println("로그인이 필요합니다.");
        // 로그인 페이지로 리다이렉트하거나, 로그인 버튼을 제공할 수 있습니다.
    }

%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baekjoon Online</title>
    <link rel="stylesheet" href="/bj_css.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <header>
        <div class="container mt-2">
            <a href="#"><img src="https://d2gd6pc034wcta.cloudfront.net/images/logo@2x.png" alt="Baekjoon Logo"></a>
            <ul>
                <% if(userId != null) { %>
                    <li><a href="logout.jsp">로그아웃</a></li>
                <% } else { %>
                    <li><a href="login.jsp">로그인</a></li>
                    <li><a href="account.jsp">회원가입</a></li>
                <% } %>
            </ul>
        </div>
    </header>
    <div>
        <ul class="nav nav-tabs">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">문제풀기</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="problemList.jsp">문제집</a></li>
                    <li><a class="dropdown-item" href="fileUpload.jsp">업로드</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#menu1">채점현황</a>
            </li>
        </ul>
    </div>
</body>

</html>
