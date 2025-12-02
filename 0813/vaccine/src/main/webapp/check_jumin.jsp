<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약조회</title>
<link href="css/style.css" rel="stylesheet">
<script type="text/javascript">
function checkisready(){
	if(!document.sJ.sData.value){
		alert("주민번호를 입력하세요");
		sV.sData.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<header>
<jsp:include page="layout/headerr.jsp"></jsp:include>
</header>
<nav><jsp:include page="layout/navv.jsp"></jsp:include></nav>
<section>

<h2>백신예약조회</h2>

<form name="sJ" method="post" action="check_jumin_end.jsp" onsubmit="return checkisready()">
<table class="table_line">
<tr><th>주민번호</th>
<td><input type="text" size="10" name="sData"> 예)101010-1001010</td>
</tr>
<tr>
<th colspan="2">
<input type="submit" value="조회하기">
<input type="button" value="메인으로" onclick="location.href='index.jsp'">
</th>
</tr>
</table>
</form>
</section>
<footer><jsp:include page="layout/footerr.jsp"></jsp:include></footer>
</body>
</html>