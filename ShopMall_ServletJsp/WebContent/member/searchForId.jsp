<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src=https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#emailSel").change(function() {
			$("#email2").val($(this).val());
		});
		
	});
</script>
<%
	/* 입력한 회원 정보가 틀렸을 경우 searchForIdServlet에서 보낼 메세지. */
String mesg = (String) request.getAttribute("mesg");
if (mesg != null) {
%>
<script type="text/javascript">
     alert("<%=mesg%>");
</script>
<%
	}
%>
<h4>
	회원님의 가입 정보를 확인하여 이메일로 ID를 발송합니다.<br> 
	이름과 전화 번호를 정확히 입력해주십시오.
</h4>
<form action="SearchForIdServlet" method="post">
	* 이름 <input type="text" name="username"><br> 
	* 전화 번호 <select name="phone1">
		<option value="011">011</option>
		<option value="010">010</option>
	</select> - 
	<input type="text" name="phone2"> - <input type="text" name="phone3">
	<hr>
	이메일 <input type="text" name="email1"> @ 
	<input type="text" name="email2" id="email2" placeholder="직접 입력"> 
	<select id="emailSel">
		<option value="daum.net">daum.net</option>
		<option value="naver.com">naver.com</option>
	</select><br> 
	<input type="submit" value="이메일 발송">
</form>