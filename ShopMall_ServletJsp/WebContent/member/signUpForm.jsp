<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src=https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		// id와 비밀번호가 입력되지 않은 경우 alert 띄우고 데이터 전송 안 되로록 설정.
		$("form").on("submit", function(event) {
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid.length == 0) {
				alert("아이디가 입력되지 않았습니다.");
				$("#userid").focus();
				event.preventDefault();
			} else if (passwd.length == 0) {
				alert("비밀번호가 입력되지 않았습니다.");
				$("#passwd").focus();
				event.preventDefault();
			}
		});

		// 비밀번호 확인 -> key이벤트로 일치 여부 검사
		$("#passwd2").on("keyup", function() {
			var passwd = $("#passwd").val();
			var mesg = "비밀번호 불일치";
			if (passwd == $(this).val()) {
				mesg = "비밀번호 일치";
			}
			$("#result2").text(mesg);
		});
	
		// 이메일 주소 입력하지 않고 선택할 시에 자동으로 삽입되도록 설정.
		$("#emailSel").change(function() {
			$("#email2").val($(this).val());
		});
		
		// id 중복 여부 체크 -> ajax로 비동기 처리.
		$("#userid").on("keyup", function(event) {
			$.ajax({
				type : "get",
				url : "CheckIdServlet",
				dataType : "text", // 응답 데이터 타입
				data : {
					userid : $("#userid").val()
				},
				success : function(responseData, status, xhr) {
					$("#result").text(responseData);
				},
				error : function(xhr, status, error) {
					console.log("error");
				}
			}); // end of 'ajax'
		}); // end of 'id 중복 여부 체크'
	});
</script>
<form action="AddMemberServlet" method="post">
	*아이디: <input type="text" name="userid" id="userid"> <span id="result"></span><br>
	*비밀번호: <input type="password" name="passwd" id="passwd"><br>
	비빌번호 확인: <input type="password" name="passwd2" id="passwd2"> <span id="result2"></span><br> 
	이름: <input type="text" name="username"><br>
	<input type="text" name="post" id="postcode" placeholder="우편번호">
	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br> 
	<input type="text" name="addr1" id="roadNameAdd" placeholder="도로명 주소"> 
	<input type="text" name="addr2" id="lotNumberAdd" placeholder="지번 주소">
	<span id="guide" style="color: #999"></span><br> 
	전화번호: <select name="phone1">
		   		<option value="010">010</option>
				<option value="011">011</option>
		    </select> - 
	<input type="text" name="phone2"> - <input type="text" name="phone3"><br> 
	이메일: <input type="text" name="email1"> @
	<input type="text" id="email2" name="email2" placeholder="직접 입력">
	<select id="emailSel">
		<option value="daum.net">daum.net</option>
		<option value="naver.com">naver.com</option>
	</select><br> 
	<input type="submit" value="회원가입"> <input type="reset" value="취소">
</form>
<!-- 우편번호 서비스 기능 구현 부분. 별도의 설명 없이 붙여주기만 했으므로 나중에 찾아볼 것. -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode; // 5자리 새 우편번호 사용
						document.getElementById('roadNameAdd').value = fullRoadAddr;
						document.getElementById('lotNumberAdd').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							// 예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>