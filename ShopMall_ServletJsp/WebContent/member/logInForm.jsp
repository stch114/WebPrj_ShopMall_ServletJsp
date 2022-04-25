<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
	$(document).ready(function() {
		
		$("form").on("submit", function(event) {
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid.length == 0) {
				alert("아이디가 입력되지 않았습니다.")
				$("#userid").focus;
				event.preventDefault();
			} else if (passwd.length == 0) {
				alert("비밀번호가 입력되지 않았습니다.")
				$("#passwd").focus();
				event.preventDefault();
			}
		});
	});
</script>
</head>
<body>
	<form action="LogInServlet" method="post">
		아이디: <input type="text" name="userid" id="userid"><br>
		비밀번호: <input type="password" name="passwd" id="passwd"><br> 
		<input type="submit" value="로그인"> <input type="reset" value="취소">
	</form>
	아이디가 기억나지 않으신가요?	<a href="SearchForIdUIServlet">아이디 찾기</a>
</body>
</html>