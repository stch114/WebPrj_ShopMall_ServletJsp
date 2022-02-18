<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.MemberDTO"%>
<%
	/* main.jsp에 include되는 화면이기 때문에 LogInServlet에서 main으로 넘겨준 session을 받을 수 
	있는 것으로 생각됨. */
MemberDTO dto = (MemberDTO) session.getAttribute("logIn");
if (dto != null) { // 로그인이 되었을 경우에 main으로 include될 부분.
	String username = dto.getUsername();
%>
안녕하세요, <%=username%>님.&nbsp;&nbsp;&nbsp;
<a href="LogOutServlet">LogOut</a>
<a href="">MyCart</a>
<a href="MyPageServlet">MyPage</a>
<%
	} else { // 로그인 되지 않은 상태에 main으로 include될 기존의 부분.
%>
<!-- Menu -->
<a href="LogInUIServlet">LogIn</a>
<a href="SignUpUIServlet">SignUp</a>
<a href="">MyCart</a>
<a href="MyPageServlet">MyPage</a>
<%
	} // end of 'if ~ else'
%>