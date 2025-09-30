<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.lang.*" %>
    <%--지시문와 jsp 페이지 속성을 지정할 때 사용한데슝 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰2025</title>
<link rel="stylesheet" href="css\style.css">
</head>
<body>
<header>
<jsp:include page="Layout\header.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="Layout\nav.jsp"></jsp:include>
</nav>
<section>
<jsp:include page="Layout\section.jsp"></jsp:include>
</section>

<footer>
<jsp:include page="Layout\footer.jsp"></jsp:include>
</footer>
</body>
</html>