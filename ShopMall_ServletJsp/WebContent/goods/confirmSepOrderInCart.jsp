<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="goods/confirmSepOrder.css">
<style>
</style>
<script type="text/javascript" 
	src=https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js></script>
<script type="text/javascript">
$(document).ready(function() {

	// 배송지 정보 자동입력.
	$("#autoAdd").on("click", function() {
		var mPhone = $("#mPhone").val();
		if (this.checked) {
			$("#oName").val($("#mName").val());
			$("#oPostcode").val($("#mPostcode").val());
			$("#oRoadNameAdd").val($("#mRoadNameAdd").val());
			$("#oLotNumAdd").val($("#mLotNumAdd").val());
			$("#oPhone1").val(mPhone.split("-")[0]);
			$("#oPhone2").val(mPhone.split("-")[1]);
			$("#oPhone3").val(mPhone.split("-")[2]);
		} else {
			$("#oName").val("");
			$("#oPostcode").val("");
			$("#oRoadNameAdd").val("");
			$("#oLotNumAdd").val("");
			$("#oPhone1").val("010");
			$("#oPhone2").val("");
			$("#oPhone3").val("");
		}
	});
	
	// 우편번호 입력창 클릭 시 우편번호 자동 클릭.
	$("#oPostcode").on("click", function() {
		$("#findPcode").click();
		this.blur();
	});

	// 도로명 주소 입력창 클릭 시 우편번호 자동 클릭.
	$("#oRoadNameAdd").on("click", function() {
		$("#findPcode").click();
		this.blur();
	});
	
	// 지번 주소 입력창 클릭 시 우편번호 자동 클릭.
	$("#oLotNumAdd").on("click", function() {
		$("#findPcode").click();
		this.blur();
	});
	
	// 배송지 정보 미입력 시 다음 단계 진행 불가하도록.
	$("form").on("submit", function(event) {
		var name = $("#oName").val();
		var postcode = $("#oPostcode").val();
		var roadName = $("#oRoadNameAdd").val();
		var lotNum = $("#oLotNumAdd").val();
		var phone2 = $("#oPhone2").val();
		var phone3 = $("#oPhone3").val();
		if (name.length == 0) {
			alert("배송 받는 분의 이름을 입력해주세요.");
			$("#oName").focus();
			event.preventDefault();
		} else if (postcode.length != 5) {
			alert("우편번호를 입력해주세요.");
			event.preventDefault();
		} else if (roadName.length == 0 || lotNum.length == 0) {
			alert("배송 받으실 주소를 입력해주세요.");
			event.preventDefault();
		} else if (phone2.length == 0 || phone3.length == 0) {
			alert("배송 받는 분의 전화번호를 입력해주세요.");
			event.preventDefault();
		}
	});
	
	// 취소 버튼 클릭 -> 이전 화면 이동
	$("#cancelBtn").on("click", function() {
		window.history.back();
	});
	
});
</script>

</head>
<body>
<%
	CartDTO cDto = (CartDTO) request.getAttribute("cDto");
int num = cDto.getNum();
String gcode = cDto.getGcode();
String gname = cDto.getGname();
int gprice = cDto.getGprice();
String gsize = cDto.getGsize();
String gcolor = cDto.getGcolor();
int gamount = cDto.getGamount();
String gimage = cDto.getGimage();

// request가 아닌 session스코프로 저장해둔 로그인 정보를 통해 파싱.
MemberDTO mDto = (MemberDTO) session.getAttribute("logIn"); 
String userid = mDto.getUserid();
String username = mDto.getUsername();
String post = mDto.getPost();
String addr1 = mDto.getAddr1();
String addr2 = mDto.getAddr2();
String phone1 = mDto.getPhone1();
String phone2 = mDto.getPhone2();
String phone3 = mDto.getPhone3();
String email1 = mDto.getEmail1();
String email2 = mDto.getEmail2();
%>

	<div>
		<form action="CompleteSepOrderInCartServlet" method="post">
			<input type="hidden" name="ordernum" value="<%=num%>">
			<input type="hidden" name="gcode" value="<%=gcode%>">
			<input type="hidden" name="gname" value="<%=gname%>">
			<input type="hidden" name="gprice" value="<%=gprice%>">
			<input type="hidden" name="gsize" value="<%=gsize%>">
			<input type="hidden" name="gcolor" value="<%=gcolor%>">
			<input type="hidden" name="gamount" value="<%=gamount%>">
			<input type="hidden" name="gimage" value="<%=gimage%>">
			<table>
				<tr>
					<td class="height2"></td>
				</tr>
				
				<!-- 상품 정보 -->
				<tr>
					<td colspan="20" class="division">
						&nbsp;&nbsp;&nbsp;주문하는 상품 
					</td>
				</tr>
				<tr>
					<td colspan="30">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="height0_5"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<th style="width:6rem;">주문 번호</th>
								<th style="width:40rem;"colspan="2">상품 정보</th>
								<th style="width:10rem;">상품 가격</th>
								<th style="width:10rem;">수량</th>
							</tr>
							<tr>
								<td colspan="30">
									<hr class="hrSub">
								</td>
							</tr>
							<tr>
								<td class="c"><%=num%></td>
								<td>
									<img src="images/items/<%=gimage%>.gif" 
									style="width:9rem; padding-left:4rem;">
								</td>
								<td style="padding-left: 1rem;">
									<%=gname%><br> 
									<span style="font-size: 0.8rem; color:#665b5f;">
										[옵션 : 사이즈(<%=gprice%>), 색상(<%=gcolor%>)]
									</span>
								</td>
								<td class="c"><%=gprice%></td>
								<td class="c"><%=gamount%></td>
							</tr>
							<tr>
								<td style="height:2rem;"></td>
								<td class="r" colspan="2">총 결제 금액:</td>
								<td class="c"><%=gprice * gamount%>원</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="30">
						<hr class="hrSub">
					</td>
				</tr>
				<tr>
					<td class="height2"></td>
				</tr>
				
				<!-- 고객 정보 -->
				<tr >
					<td colspan="20" class="division">
						&nbsp;&nbsp;&nbsp;고객 정보
					</td>
				</tr>
				<tr>
					<td colspan="30">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="height0_5"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td colspan="3" class="c">이 름</td>
								<td colspan="15">
									<input type="text" id="mName" size="20"
									maxlength="20" value="<%=username%>" readonly>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="c">우편번호</td>
								<td colspan="15">
									<input type="text" id="mPostcode" size="6"
									maxlength="6" value="<%=post%>" readonly>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="c">주 소</td>
								<td colspan="15">
									<input type="text" id="mRoadNameAdd" size="35"
									maxlength="200" value="<%=addr1%>" readonly><br> 
									<input type="text" id="mLotNumAdd" size="35"
									maxlength="200" value="<%=addr2%>" readonly>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="c">전화번호</td>
								<td colspan="15">
									<input type="text" id="mPhone" size="15"
									maxlength="15" value="<%=phone1%>-<%=phone2%>-<%=phone3%>">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="30">
						<hr class="hrSub">
					</td>
				</tr>
				<tr>
					<td class="height2"></td>
				</tr>
		
				<!-- 배송지 정보 -->
				<tr>
					<td colspan="20">
						&nbsp;&nbsp;&nbsp;<span class="division">배송지 정보</span>&nbsp;&nbsp;
						<input type="checkbox" name="autoAdd" id="autoAdd"> 고객 정보와 배송지 정보가 동일합니다.
					</td>
				</tr>
				<tr>
					<td colspan="30">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="height0_5"></td>
				</tr>	
				<tr>
					<td>
						<table>
							<tr>
								<td colspan="3" class="c">이 름</td>
								<td colspan="15">
									<input type="text" name="oName" id="oName" size="20"
									maxlength="20">
								</td>
							</tr>
							<tr>
								<td colspan="3" class="c">우편번호</td>
								<td colspan="15">
									<input type="text" name="oPostcode" id="oPostcode"  
									placeholder="우편번호" size="6" maxlength="6">&nbsp;
									<input type="button" id="findPcode" 
									onclick="execDaumPostcode()" value="우편번호 찾기"><br> 
								</td>
							</tr>
							<tr>
								<td colspan="3" class="c">주 소</td>
								<td colspan="15">
									<input type="text" name="oRoadNameAdd" id="oRoadNameAdd" 
									placeholder="도로명 주소" size="35" maxlength="200"><br> 
									<input type="text" name="oLotNumAdd" id="oLotNumAdd" 
									placeholder="지번 주소" size="35" maxlength="200">
									<span id="guide" style="color: #999"></span>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="c">전화번호</td>
								<td colspan="15">
									<select name="oPhone1" id="oPhone1">
										<option value="010" selected="selected">010</option>
										<option value="011">011</option>
										<option value="02">02</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="044">044</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
									</select> -
									<input type="text" id="oPhone2" name="oPhone2" size="4" maxlength="4"> -
									<input type="text" id="oPhone3" name="oPhone3" size="4" maxlength="4">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="30">
						<hr class="hrSub">
					</td>
				</tr>
				<tr>
					<td class="height2"></td>
				</tr>
				
				<!-- 결제 수단 -->
				<tr>
					<td colspan="20" class="division">
						&nbsp;&nbsp;&nbsp;결제 수단
					</td>
				</tr>
				<tr>
					<td colspan="30">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="height0_5"></td>
				</tr>	
				<tr>
					<td>
						<table>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;<input type="radio" name="pmtMethod" 
									value="신용카드" checked>신용카드
									&nbsp;&nbsp;&nbsp;<input type="radio" name="pmtMethod" 
									value="계좌 이체">계좌 이체
									&nbsp;&nbsp;&nbsp;<input type="radio" name="pmtMethod" 
									value="무통장 입금">무통장 입금
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="height2">
				</tr>
				<tr>
					<td class="c">
						<input type="submit" value="결제하기">
						<input type="button" value="취소" id="cancelBtn">
					</td> 
				</tr>
			</table>
		</form>
	</div>	
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
						document.getElementById('oPostcode').value = data.zonecode; // 5자리 새 우편번호 사용
						document.getElementById('oRoadNameAdd').value = fullRoadAddr;
						document.getElementById('oLotNumAdd').value = data.jibunAddress;

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
</body>
</html>