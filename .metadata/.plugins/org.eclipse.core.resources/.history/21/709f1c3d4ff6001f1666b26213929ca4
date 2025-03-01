<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DatabaseUtil"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("ID");
    String pass = request.getParameter("PASS");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        conn = DatabaseUtil.getConnection();
        String sql = "SELECT * FROM user WHERE ID = ? AND PASS = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pass);
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
            session.setAttribute("ID", id);
            session.setAttribute("NAME", rs.getString("NAME"));
            response.sendRedirect("main.jsp");
        } else {
            out.println("<script>");
            out.println("alert('아이디 또는 비밀번호가 잘못되었습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%> 