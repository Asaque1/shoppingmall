<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="DB.DBConnect"%>
<!-- db파일 받아오기 -->
<%@page import="java.sql.*"%>
<!-- sql 관련 java의 library 받기 -->
<%
String sql="select max(RESVNO) from TBL_VACCRESV_202108";
Connection conn = DBConnect.getConnection();
PreparedStatement ps =conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
rs.next();
int num = rs.getInt(1)+1;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function remove(){
	alert("초기화합니까?");
	dovument.rData.reset();
	rData.jNum.focus();
}
function checkVal() { //입력 양식 유효성 체크 함수
    if(!document.rData.jNum.value) {
        alert("주민번호가 입력되지 않았습니다.");
        rData.jNum.focus();
        return false;
    } else if(!document.rData.vCode.value) {
        alert("백신코드가 입력되지 않았습니다.");
        rData.vCode.focus();
        return false;
    } else if(!document.rData.hCode.value) {
        alert("병원코드가 입력되지 않았습니다.");
        rData.hCode.focus();
        return false;
    } else if(!document.rData.rDate.value) {
        alert("예약날짜가 입력되지 않았습니다.");
        rData.rDate.focus();
        return false;
    } else if(!document.rData.rTime.value) {
        alert("예약시간가 입력되지 않았습니다.");
        rData.rTime.focus();
        return false;
    } 
    alert("입력완료되었습니다.")
    return true;
}
</script>
</head>
<body>
<header>
<jsp:include page="layout/headerr.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="layout/navv.jsp"></jsp:include>
</nav>
<section>
<h2>백신 예약</h2>
<form name="rData" method="post" action="#" onSubmit="checkVal()">
<table class="table_line">
<tr><th>예약번호</th>
<td><input type="text" name="rNum" readOnly value=<%=num %>> 예)20210011</td>
</tr>
<tr><th>주민번호</th>
<td><input type="text" name="jNum"> 예790101-1111111</td>
</tr>
<tr><th>백신코드</th>
<td>
<select name="vCode">
<option value="">백신선택</option>
<option value="V001">A백신</option>
<option value="V002">B백신</option>
<option value="V003">C백신</option>
</select>
</td>
</tr>
<tr><th>병원코드</th>
<td>
<label><input type="radio" name="hCode" Value="H001">A병원</label>
<label><input type="radio" name="hCode" Value="H002">B병원</label>
<label><input type="radio" name="hCode" Value="H003">C병원</label>
<label><input type="radio" name="hCode" Value="H004">D병원</label>
</td>
</tr>
<tr><th>예약날짜</th>
<td><input type="text" name="rDate"> 예)20210101</td>
</tr>
<tr><th>예약시간</th>
<td><input type="text" name="rTime"> 예)0930, 1130</td>
</tr>
<tr class="center"><td colspan="2">
<input type="submit" value="등록">
<input type="button" value="취소" onclick="remove()">
<input type="button" value="백신예약현황조회">
</td></tr>
</table>
</form>
</section>
<footer>
<jsp:include page="layout/footerr.jsp"></jsp:include>
</footer>
</body>
</html>