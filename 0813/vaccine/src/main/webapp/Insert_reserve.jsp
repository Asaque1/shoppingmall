<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@page import="DB.DBConnect" %>
<%
request.setCharacterEncoding("UTF-8");
String sql = "INSERT INTO TBL_VACCRESV_202108 VALUES(?,?,?,?,?,?)";
Connection conn = DBConnect.getConnection();
PreparedStatement ps = conn.prepareStatement(sql);

ps.setInt(1,Integer.parseInt(request.getParameter("rNum")));
ps.setString(2,request.getParameter("jNum"));
ps.setString(3,request.getParameter("hCode"));
ps.setString(4,request.getParameter("rDate"));
ps.setString(5,request.getParameter("rTime"));
ps.setString(6,request.getParameter("vCode"));

ps.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
<jsp:include page="layout/headerr.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="layout/navv.jsp"></jsp:include>
</nav>
<section>
</section>
<footer>
<jsp:include page="layout/footerr.jsp"></jsp:include>
</footer>
</body>
</html>