<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 장바구니</title>
</head>
<body>
	<h1>나의 장바구니</h1>
	<jsp:include page="common/menu.jsp" flush="true" /><br>
	<jsp:include page="common/top.jsp" flush="true" />
	<hr>
	<jsp:include page="goods/cartList.jsp" flush="true" />
</body>
</html>