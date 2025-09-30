<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%--오라클은 이클립스와 별개 시스템 => utf-8 걍 쓰면 조짐 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 데이터 전송 이게 보이면 안됩니다</title>
<%@ page import ="DB.DBConnect" %> <!-- 지시문 형식을 통해 db연결 자바 파일 불러오기 -->
<%@ page import ="java.sql.*" %> <!-- 지시문 형식을 통해 sql 관련 라이브러리 불러오기 -->

<%
request.setCharacterEncoding("UTF-8");
//오라클에 한글 입력 시 깨짐 문제 해결용
String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
//sql 변수 선언 후 쿼리문 형ㅌ의 문자열 저장, 삽입 쿼리문에 입력 데이터 자리(?) 7개 준비
Connection conn = DBConnect.getConnection();
PreparedStatement pstmt= conn.prepareStatement(sql);
pstmt.setInt(1,Integer.parseInt(request.getParameter("custno")));
//웹브라우저 화면에서 읽는 데이터는 모두 문자로 취급, 그러니 db로 들어갈 데이터들은 모두 형변환 필요
//숫자로 변경된 데이터는 pstmt에 있는 쿼리문 1번 자리에 삽입
pstmt.setString(2,request.getParameter("custname"));
pstmt.setString(3,request.getParameter("phone"));
pstmt.setString(4,request.getParameter("address"));
pstmt.setString(5,request.getParameter("joindate"));
pstmt.setString(6,request.getParameter("grade"));
pstmt.setString(7,request.getParameter("city"));

pstmt.executeUpdate();
//executeQuery는 쿼리문을 실행하는 것, 근데 executeUpdate는 누적해서 하는 업데이트임, 그렇기에 건 별로 실행시킬 수 있는 update를
//사용, executeQuery는 사용 후 저장하는 등 1회성 사용에 적합
%>
</head>
<body>
<jsp:forward page="member_list.jsp"></jsp:forward>
<%--뷰 페이지 : 눈에 보이는거
백 그라운드 페이지 : 눈에 안 보이는 배경용 페이지
이 페이지의 목적 = join의 값을 db로 송환
--%>
</body>
</html>