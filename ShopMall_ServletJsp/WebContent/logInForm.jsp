<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%
	/* 로그인 되지 않은 상태에서 로그인이 필요한 작업 진행 시에 alert창 띄우기 위해  */
	String mesg = (String) session.getAttribute("mesg");
if (mesg != null) { // 로그인 정보가 있다면(session으로 데이터가 제대로 넘어온다면)
%>
<script type="text/javascript">
	alert("<%=mesg%>");
</script>
<%
	session.removeAttribute("mesg"); // alert창 출력 후엔 필요 없어지므로 session의 해당 속성 삭제.
}
%>
<%	
	/* SearchForIdServlet에서 request스코프에 저장해둔 데이터. */
	String mesg2 = (String) request.getAttribute("mesg");
if (mesg2 != null) {
%>
<script type="text/javascript">
	alert("<%=mesg2%>");
</script>
<%
}
%>
</head>
<body>
	<h1>로그인</h1>
	<jsp:include page="common/menu.jsp" flush="true" /><br>
	<jsp:include page="common/top.jsp" flush="true" />
	<hr>
	<jsp:include page="member/logInForm.jsp" flush="true" />
</body>
</html>