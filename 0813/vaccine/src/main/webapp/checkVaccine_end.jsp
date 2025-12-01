<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DB.DBConnect" %>

<%
int in_no = Integer.parseInt(request.getParameter("sData"));
String sql="select v.resvno,j.name,substr(j.jumin,8,1) as jumin, case v.hospcode when 'H001' then '가_병원' when 'H002' then '나_병원' when 'H003' then '다_병원' when 'H004' then '라_병원' end as hospcode,to_char(v.resvdate,'yyyy\"년\"mm\"월\"dd\"일\"'),substr(to_char(v.resvtime,'fm0000'),1,2)||':'||substr(to_char(v.resvtime,'fm0000'),3,2),case v.vcode when 'V001' then 'A백신' when 'V002' then 'B백신' when 'V003' then 'C백신' end as vcode,case h.hospaddr when '10' then '서울' when '20' then '대전' when '30' then '대구' when '40' then '광주' end as hospaddr from tbl_jumin_202108 j,tbl_vaccresv_202108 v, tbl_hosp_202108 h where j.jumin = v.jumin and v.hospcode= h.hospcode and v.resvno = "+in_no;
Connection conn = DBConnect.getConnection();
PreparedStatement ps =conn.prepareStatement(sql);
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
<th>예약번호</th>
<th>이름</th>
<th>성별</th>
<th>병원이름</th>
<th>예약 날짜</th>
<th>예약 시간</th>
<th>백신코드</th>
<th>병원지역</th>
</tr>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%
if (Integer.parseInt(rs.getString(3)) % 2 == 1) {%>
	남성
<%}else{%>
여성<%}%>
</td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td><%= rs.getString(7) %></td>
<td><%= rs.getString(8) %></td>
</tr>
<tr>
<td colspan="8" class="center">
</td>
</tr>
</table>
<%
}else{
	%>
<p>해당 번호의 예약이 확인되지 않았습니다.</p>
<%
}
%>
<button onclick="location.href='index.jsp'">메인으로</button>
<button onclick="location.href='checkVaccine.jsp'">다시 조회</button>
</div>
</section>
<footer><jsp:include page="layout/footerr.jsp"></jsp:include></footer>
</body>
</html>