<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	<h1>Main Page</h1>
	<!-- 쇼핑몰의 메인 페이지가 될 파일(main.jsp) 생성. 메인 페이지에 top.jsp와 menu.jsp의 두 페이지를 
		동적 삽입함(jsp:include 사용). -->
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	<jsp:include page="common/top.jsp" flush="true"></jsp:include>
</body>
</html>