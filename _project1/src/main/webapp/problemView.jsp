<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DatabaseUtil"%>
<%
    String idStr = request.getParameter("NO");
    
    if(idStr == null || idStr.isEmpty()) {
        response.sendRedirect("problemList.jsp");
        return;
    }
    
    int no = 0;
    try {
        no = Integer.parseInt(idStr);
    } catch (NumberFormatException e) {
        out.println("<script>alert('유효하지 않은 게시글 번호입니다.'); location.href='problemList.jsp';</script>");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DatabaseUtil.getConnection();

        // 게시글 조회
        String sql = "SELECT TITLE, CONTENT, INPUT, OUTPUT FROM problem WHERE NO = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, no);
        rs = pstmt.executeQuery();

        if(rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=rs.getString("TITLE")%></title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="board-container">
        <div class="board-header">
            <h2><%=rs.getString("TITLE")%></h2>
            <div class="board-nav">
                <a href="../main.jsp">홈</a>
            </div>
        </div>
        <div class="board-info">
            <span><%=rs.getString("TITLE")%></span>
        </div>
        <div class="board-content">
        	<h2>문제</h2>
            <%=rs.getString("CONTENT").replace("\n", "<br>")%>
            <h2>입력</h2>
            <%=rs.getString("INPUT").replace("\n", "<br>")%>
            <h2>출력</h2>
            <%=rs.getString("OUTPUT").replace("\n", "<br>")%>
        </div>
        <div class="board-buttons">
            <a href="problemList.jsp" class="btn">목록</a>
        </div>
    </div>
    <script>
        function deletePost(id) {
            if(confirm('정말 삭제하시겠습니까?')) {
                location.href = 'deleteAction.jsp?id=' + id;
            }
        }
    </script>
</body>
</html>
<%
        } else {
            out.println("<script>alert('존재하지 않는 게시글입니다.'); location.href='list.jsp';</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
