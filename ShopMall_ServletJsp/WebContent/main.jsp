<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<%
	String mesg = (String) session.getAttribute("addMember");
if (mesg != null) { // 회원 정보가 있다면(session으로 데이터가 제대로 넘어온다면)
%>
<script type="text/javascript">
	alert("<%=mesg%>");
</script>
<%
	session.removeAttribute("addMember"); // 회원가입 완료 후 session의 해당 속성 삭제.
}
%>
</head>
<body>
	<h1>Main Page</h1>
	<!-- 쇼핑몰의 메인 페이지가 될 파일(main.jsp) 생성. 메인 페이지에 top.jsp와 menu.jsp의 두 페이지를 
		동적 삽입함(jsp:include 사용). -->
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	<hr>
	<jsp:include page="goods/goodsList.jsp" flush="true"></jsp:include>
</body>
</html>