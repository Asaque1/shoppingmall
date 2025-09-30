<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@page import="DB.DBConnect"%>
<!-- db파일 받아오기 -->
<%@page import="java.sql.*"%>
<!-- sql 관련 java의 library 받기 -->
<%
String sql = "select max(custno) from member_tbl_02"; //sql이라는 문자열 변수에 쓸 쿼리문 저장
//구문 저장
Connection conn = DBConnect.getConnection(); //Db 연결 기능을 conn 변수에 저장, 이후 db 연결
// db와 연결을 위해 객체 생성
PreparedStatement pstmt = conn.prepareStatement(sql);//변수 sql에 저장된 문장을 쿼리로 변경, db 연결 후 실행
//연결용 객체를 통해 구문 실행, 이를 다른 객체에 저장, 그 객체는 구문을 저장
//여기서 sql이 구문이 됨
ResultSet rs = pstmt.executeQuery();//변수 pstmt에 있는 쿼리문을 실행 후 rs에 저장
//그 구문을 실행하여 그 결과물을 저장
//결과를 저장하는 데이터타입, 책과 같은 형식?	
rs.next(); //rs에 있는 결과를 next()로 호출, 마지막 값 저장
//next()는 정보의 가장 마지막 부분을 확인할 수 있음

int num = rs.getInt(1) +1; //num에 뽑은 결과(member 테이블 속 마지막 회원번호)에 +1해서 값 저장
//이 num을 join하려는 사람에게 적용
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 관리</title>

<link rel="stylesheet" href="css\style.css">
<script type="text/javascript">
function checkValue(){
	if(!document.data.custname.value){
		//document 객체(웹페이지),data(폼 이름),(custname = input의 name)
		data.custname.focus();
		alert("회원 이름 비설정됨");
		return false;
		
	}else if(!document.data.phone.value){
		data.phone.focus();
		alert("회원 전화번호 비설정됨");
		return false;
	}else if(!document.data.address.value){
		data.address.focus();
		alert("회원 주소 비설정됨");
		return false;
	}else if(!document.data.joindate.value){
		data.joindate.focus();
		alert("회원 가입일자 비설정됨");
		return false;
	}else if(!document.data.grade.value){
		data.grade.focus();
		alert("회원 등급 비설정됨");
		return false;
	}else if(!document.data.city.value){
		data.city.focus();
		alert("회원 등급 비설정됨");
		return false;
	}else{
		alert("fin");
		return true;
	}
}
</script>

</head>
<body>
	<header>
<jsp:include page="Layout\header.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="Layout\nav.jsp"></jsp:include>
</nav>
<section class="section">

<h2>sushi1 join</h2>
<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
<table class="table_line">
<tr>
<th>
회원번호(자동발생)
</th>
<td>
<input type="text" name="custno" value="<%= num %>" readonly>
</td>
</tr>
<tr>
<th>
회원성명
</th>
<td>
<input type="text" name="custname" value="">
</td>
</tr>
<tr>
<th>
회원전화
</th>
<td>
<input type="text" name="phone" value="">
</td>
</tr>
<tr>
<th>
회원주소
</th>
<td>
<input type="text" name="address" value="">
</td>
</tr>
<tr>
<th>
가입일자
</th>
<td>
<input type="text" name="joindate" value="">
</td>
</tr>
<tr>
<th>
고객등급(A:vip,B:일반,C:직원)
</th>
<td>
<input type="text" name="grade" value="">
</td>
</tr>
<tr>
<th>
도시코드
</th>
<td>
<input type="text" name="city" value="">
</td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="등록">
<input type="button" value="취소" onclick="location.href='join.jsp'">
<input type="button" value="조회" onclick="location.href='member_list.jsp'">
</td>
</tr>
</table>
</form>
</section>
<footer>
<jsp:include page="Layout\footer.jsp"></jsp:include>
</footer>
</body>
</html>