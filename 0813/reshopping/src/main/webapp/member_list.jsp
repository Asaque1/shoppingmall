<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 조회/수정</title>

<link rel="stylesheet" href="css\style.css">
<%
String sql = "select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd') as newdate,case grade when 'A' then 'vip' when 'B' then '일반' when 'C' then '직원' end as newgrade,city from member_tbl_02 order by custno";
Connection conn = DBConnect.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

%>
</head>
<body>
<header>
<jsp:include page="Layout\header.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="Layout\nav.jsp"></jsp:include>
</nav>
<section class=section>
<h2>회원목록 조회/수정</h2>
<table class=table_line>
<tr>
<th>custno</th>
<th>custname</th>
<th>phone</th>
<th>address</th>
<th>joindate</th>
<th>grade</th>
<th>city</th>
</tr>
<%
while(rs.next()){
%>
<tr class=center>
<td><%= rs.getInt("custno") %></td>
<td><%= rs.getString("custname") %></td>
<!-- 쿼리의 자리 순서나 자리 이름 상관 없음, 후자가 더 오류 적긴 함 -->
<td><%= rs.getString("phone") %></td>
<td><%= rs.getString("address") %></td>
<td><%= rs.getString("newdate") %></td>
<td><%= rs.getString("newgrade") %></td>
<td><%= rs.getString("city") %></td>
</tr>
<%
}
%>
</table>
</section>
<footer>
<jsp:include page="Layout\footer.jsp"></jsp:include>
</footer>

</body>
</html>