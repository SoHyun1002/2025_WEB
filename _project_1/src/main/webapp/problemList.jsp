<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page session="true" %> <!-- 세션을 사용할 수 있도록 설정 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업형 웹 페이지</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <script src="https://kit.fontawesome.com/c47106c6a7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/ie.js"></script>
</head>

<body>

    <header>
        <div class="inner">
            <h1><a href="main.jsp">백준</a></h1>

            <ul id="gnb">
                <li><a href="problemList.jsp">문제</a></li>
                <li><a href="#">채점</a></li>
            </ul>

            <ul class="util">
                <% 
                    // 세션에서 userId 가져오기
                    String userId = (String) session.getAttribute("id");
                    if (userId != null) { 
                %>
                    <li><a href="logout.jsp">로그아웃</a></li>
                <% } else { %>
                    <li><a href="login.jsp">로그인</a></li>
                    <li><a href="account.jsp">회원가입</a></li>
                <% } %>
            </ul>
        </div>
    </header>
    
    <div class = "board-container">
    <table class = "board-table">
        <tr class = "board-table">
            <th>NO</th>
            <th>TITLE</th>
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
            
            String sql = "SELECT * FROM problem ORDER BY NO ASC";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("NO")%></td>
                    <td><a href="download.jsp?fileName=<%=rs.getString("TITLE")%>"><%=rs.getString("TITLE")%></a></td>
                </tr>
                <%
            }
        } catch(Exception e) {
            out.println("오류 발생: " + e.getMessage());
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception e) {}
            if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if(conn != null) try { conn.close(); } catch(Exception e) {}
        }
        %>
    </table>
    </div>
    <br>

</body>
</html>
