<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.MemberDTO"%>
<%
	/* session스코프에 저장되어있는 로그인 정보 파싱. */
	MemberDTO dto = (MemberDTO) session.getAttribute("logIn");
String userid = dto.getUserid();
String username = dto.getUsername();
String post = dto.getPost();
String addr1 = dto.getAddr1();
String addr2 = dto.getAddr2();
String phone1 = dto.getPhone1();
String phone2 = dto.getPhone2();
String phone3 = dto.getPhone3();
String email1 = dto.getEmail1();
String email2 = dto.getEmail2();
%>

<form action="">
	아이디: <%=userid%><br> 
	이름: <%=username%><br> 
	<input type="text" value="<%=post%>" name="post" id="postcode" placeholder="우편번호"> 
	<input type="button" value="우편번호 찾기"><br>
	<input type="text" value="<%=addr1%>" name="addr1" id="roadNameAdd" placeholder="도로명 주소"> 
	<input type="text" value="<%=addr2%>" name="addr2" id="lotNumberAdd" placeholder="지번 주소"> 
	<span id="guide" style="color: #999"></span><br> 
	전화번호: <select name="phone1">
		<option value="010" <%if ("010".equals(phone1)) {%> selected <%}%>>010</option>
		<option value="011" <%if ("011".equals(phone1)) {%> selected <%}%>>011</option>
		    </select> - 
	<input type="text" value="<%=phone2%>" name="phone2"> - 
	<input type="text" value="<%=phone3%>" name="phone3"><br> 
	이메일: <input type="text" value="<%=email1%>" name="email1"> @
	<input type="text" value="<%=email2%>" name="email2" placeholder="직접 입력">
	<select id="emailSel">
		<option value="daum.net">daum.net</option>
		<option value="naver.com">naver.com</option>
	</select><br> 
</form>