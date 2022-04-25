<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문하기</title>
</head>
<body>
	<h1>상품 주문하기</h1>
	<jsp:include page="common/menu.jsp" flush="true" /><br>
	<jsp:include page="common/top.jsp" flush="true" />
	<hr>
	<jsp:include page="goods/confirmSepOrderInCart.jsp" flush="true" />
</body>
</html>