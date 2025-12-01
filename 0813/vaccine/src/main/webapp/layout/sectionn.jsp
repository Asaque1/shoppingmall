<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<section>
<h2>백신예약 프로그램 작성 안내</h2>
<p>
데이터 입출력 요건에 맞게 주민정보, 병원정보, 백신예약정보를 작성하는 프로그램이다.
프로그램 작성 순서
1. 주어진 테이블 정보를 생성한다.
2. 문제에 제시된 기본 데이터를 일괄 입력한다.
3. 백신예약 정보를 입력하는 프로그램을 작성한다.
- 예약번호는 자동 생성
- 백신코드는 셀렉트 박스로 만들며, 값은 V001은 A백신, V--2는 B백신, V003은 C백신으로 표시
- 병원코드는 라디오 버튼으로 값은 H001, H002, H003, H004로 보이는 것은 가_병원, 나_병원, 다_병원, 라_병원
- 예약날짜는 YYYYMMDD, 예얀시간은 0930, 1130처럼 4자리 숫자로 24시간제로 표시
4. 모든 항목에 대한 유효성 검사를 하며, 값이 비어있거나 선택되지 않을 경우 오류메세지를 띄우고 포커스를 이동
</p>
</section>
</body>
</html>