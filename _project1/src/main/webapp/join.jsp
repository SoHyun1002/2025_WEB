<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/join.css">
    <script>
        function validateForm() {
            var password = document.getElementById("PASS").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            
            if(password !== confirmPassword) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="join-background">
    <div class="login-container join-container">
        <h2>회원가입</h2>
        <form action="joinAction.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <input type="text" name="ID" placeholder="아이디" required>
            </div>
            <div class="form-group">
                <input type="password" name="PASS" id="PASS" placeholder="비밀번호" required>
            </div>
            <div class="form-group">
                <input type="password" id="confirmPassword" placeholder="비밀번호 확인" required>
            </div>
            <div class="form-group">
                <input type="text" name="NAME" placeholder="이름" required>
            </div>
            <button type="submit">가입하기</button>
            <p class="login-link">이미 계정이 있으신가요? <a href="login.jsp">로그인</a></p>
        </form>
    </div>
</body>
</html>
