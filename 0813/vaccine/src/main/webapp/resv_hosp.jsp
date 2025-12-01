<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<%@page import="DB.DBConnect" %>
   
<%
String sql = "SELECT hosp.hospcode, city.city_name, "
        + "COUNT(resv.hospcode) AS resv_total "
        + "FROM tbl_hosp_202108 hosp, "
        + "city_code_tbl_02 city, "
        + "tbl_vaccresv_202108 resv "
        + "WHERE city.hospaddr(+) = hosp.hospaddr "
        + "AND resv.hospcode(+) = hosp.hospcode "
        + "GROUP BY hosp.hospcode, city.city_name "
        + "ORDER BY hosp.hospcode";

Connection conn = DBConnect.getConnection();
PreparedStatement ps =conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
int resv_total;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css\style.css">
</head>
<body>
<header><jsp:include page="layout/headerr.jsp"></jsp:include></header>
<nav><jsp:include page="layout/navv.jsp"></jsp:include></nav>
<section>
<h2>예약병원 통계</h2>
<%resv_total=0; %>
<table class="table_line">
<tr>
<td>병원지역코드</td>
<td>병원지역명</td>
<td>예약건수</td>
</tr>
<%while(rs.next()){%>
<tr class="center">
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
</tr>
<%resv_total += Integer.parseInt(rs.getString(3));
} %>
<tr class="center">
<th colspan="2">총합</th>
<td><%=resv_total %></td>
</tr>
</table>
</section>
<footer><jsp:include page="layout/footerr.jsp"></jsp:include></footer>
</body>
</html>