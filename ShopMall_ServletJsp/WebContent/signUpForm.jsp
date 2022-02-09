<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h1>회원 가입</h1>
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	<hr>
	<!-- member폴더의 signUpForm.jsp를 include하여 실제 회원 가입 구현 화면이 되게끔 해준다. -->
	<jsp:include page="member/signUpForm.jsp" flush="true"></jsp:include>
</body>
</html>