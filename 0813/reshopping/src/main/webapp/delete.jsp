<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DB.DBConnect"%>
<!-- db파일 받아오기 -->
<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");

String sql = "delete from member_tbl_02 where custno=?";

Connection conn = DBConnect.getConnection();
PreparedStatement pstmt= conn.prepareStatement(sql);
pstmt.setInt(1,Integer.parseInt(request.getParameter("d_custno")));
pstmt.executeUpdate();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="member_list.jsp"></jsp:forward>
</body>
</html>