<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DB.DBConnect" %>

<%
String in_no = request.getParameter("sData");
String sql="select jumin,name,phone,address from tbl_jumin_202108 where jumin = ?";
Connection conn = DBConnect.getConnection();
PreparedStatement ps =conn.prepareStatement(sql);
ps.setString(1,in_no);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약조회</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header><jsp:include page="layout/headerr.jsp"></jsp:include></header>
<nav><jsp:include page="layout/navv.jsp"></jsp:include></nav>
<section>
<h2>백신예약조회</h2>

<div class="center">
<%
if(rs.next()){
%>
<table class="table_line">
<tr>
<th>주민번호</th>
<th>이름</th>
<th>전화번호</th>
<th>주소</th>
</tr>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%=rs.getString(3)%></td>
<td><%= rs.getString(4) %></td>
</tr>
<tr>
<td colspan="8" class="center">

<button onclick="location.href='index.jsp'">메인으로</button>
<button onclick="location.href='check_jumin.jsp'">다시 조회</button>

</td>
</tr>
</table>
<%
}else{
	%>
<p>해당 번호의 회원이 확인되지 않았습니다.</p>
<%
}
%></div>
</section>
<footer><jsp:include page="layout/footerr.jsp"></jsp:include></footer>
</body>
</html>