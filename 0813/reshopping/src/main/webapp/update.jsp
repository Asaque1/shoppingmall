<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DB.DBConnect"%>
<!-- db파일 받아오기 -->
<%@page import="java.sql.*"%>
<!-- sql 관련 java의 library 받기 -->
<%
String sql = "select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd') as newdate, grade ,city from member_tbl_02 where custno=" + request.getParameter("click_custno");
Connection conn = DBConnect.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css\style.css">
<script type="text/javascript">
function checkValue(){
	if(!document.u_data.custname.value){
		//document 객체(웹페이지),data(폼 이름),(custname = input의 name)
		u_data.custname.focus();
		alert("회원 이름 비설정됨");
		return false;
		
	}else if(!document.u_data.phone.value){
		u_data.phone.focus();
		alert("회원 전화번호 비설정됨");
		return false;
	}else if(!document.u_data.address.value){
		u_data.address.focus();
		alert("회원 주소 비설정됨");
		return false;
	}else if(!document.u_data.joindate.value){
		u_data.joindate.focus();
		alert("회원 가입일자 비설정됨");
		return false;
	}else if(!document.u_data.grade.value){
		u_data.grade.focus();
		alert("회원 등급 비설정됨");
		return false;
	}else if(!document.u_data.city.value){
		u_data.city.focus();
		alert("회원 등급 비설정됨");
		return false;
	}else{
		alert("완료");
		return true;

	}
}
function checkDel(f_custno){
	msg="정말"+f_custno+"번 회원을 삭제하시겠습니까?";
	if(confirm(msg)!=0){
		alert("삭제되었습니다");
		location.href="delete.jsp?d_custno="+ f_custno;
	}else{alert("취소되었습니다.");}
}

</script>
</head>
<body>

<header>
<jsp:include page="Layout/header.jsp"></jsp:include>
</header>

<nav>
<jsp:include page="Layout/nav.jsp"></jsp:include>
</nav>

<section class="section">
<h2>홈쇼핑 회원 정보수정</h2>
<form name="u_data" action="update_p.jsp" method="post" onsubmit="return checkValue()">
<table class="table_line">
<tr>
<th>회원번호(자동발생)</th>
<td><input type="text" name="custno" value="<%=rs.getInt("custno") %>" readonly></td>
</tr>
<tr>
<th>회원성명</th>
<td><input type="text" name="custname" value="<%=rs.getString("custname") %>" ></td>
</tr>
<tr>
<th>회원전화</th>
<td><input type="text" name="phone" value="<%=rs.getString("phone") %>"></td>
</tr>
<tr>
<th>회원주소</th>
<td><input type="text" name="address" value="<%=rs.getString("address") %>"></td>
</tr>
<tr>
<th>가입일자</th>
<td><input type="text" name="joindate" value="<%=rs.getString("newdate") %>"></td>
</tr>
<tr>
<th>고객등급[A:VIP,B:일반,C:직원]</th>
<td><input type="text" name="grade" value="<%=rs.getString("grade") %>"></td>
</tr>
<tr>
<th>도시코드</th>
<td><input type="text" name="city" value="<%=rs.getString("city") %>"></td>
</tr>
<tr class="center">
<td  colspan="2" >
<input type="submit" value="등록">
<input type="button" value="삭제" onclick = "checkDel(<%=rs.getInt("custno")%>)">
<input type="button" value="취소" onclick = "location.href='member_list.jsp'">
</tr>
</table>
</form>
</section>

</body>
</html>