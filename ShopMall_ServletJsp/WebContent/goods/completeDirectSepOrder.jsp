<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.OrderDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="goods/completeDirectSepOrder.css">
<style>
</style>
<script type="text/javascript" 
	src=https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js></script>
<script type="text/javascript">
$(document).ready(function() {
	
});
</script>
</head>
<body>
	<%
		OrderDTO oDto = (OrderDTO) request.getAttribute("oDto");
	String userid = oDto.getUserid();
	String gname = oDto.getGname();
	int gprice = oDto.getGprice();
	String gsize = oDto.getGsize();
	String gcolor = oDto.getGcolor();
	int gamount = oDto.getGamount();
	String gimage = oDto.getGimage();
	String ordername = oDto.getOrdername();
	String post = oDto.getPost();
	String addr1 = oDto.getAddr1();
	String addr2 = oDto.getAddr2();
	String phone1 = oDto.getPhone1();
	String phone2 = oDto.getPhone2();
	String phone3 = oDto.getPhone3();
	String paymethod = oDto.getPaymethod();
	%>
	<div>
		<table id="table1">
			<tr>
				<td class="height4">
			</tr>
			<tr>
				<td class="header">상품 주문 완료</td>
			</tr>
			<tr>
				<td class="height0_5">
			</tr>
			<tr>
				<td class="header"><span id=""></span>님의 상품 주문이 완료됐습니다.</td>
			</tr>
			<tr>
				<td class="height2_5">
			</tr>
			<tr>
				<td colspan="40" class="division">
					&nbsp;&nbsp;&nbsp;상품 및 배송 정보
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
							<th class="oInfo">받으시는 분</th>
							<td><%=ordername%></td>
						</tr>
						<tr>
							<th class="oInfo" style="height:6rem;">주소</th>
							<td>
								우편번호:&nbsp;&nbsp;<%=post%><br>
								도로명 주소: &nbsp;&nbsp;<%=addr1%><br>
								지번 주소: &nbsp;&nbsp;<%=addr2%>
							</td>
						</tr>
						<tr>
							<th class="oInfo">전화번호</th>
							<td><%=phone1%>-<%=phone2%>-<%=phone3%></td>
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
				<td class="height0_5">
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<th style="width:40rem; height:3rem;">
								주문한 상품
							</th>
							<th style="width:10rem;">
								상품 가격
							</th>
							<th style="width:10rem;">
								주문 수량
							</th>
							<th style="width:10rem;">
								총 금액
							</th>
						</tr>
						<tr>
							<td class="c" style="height:3rem;">
								<%=gname%><br> 
								<span style="font-size: 0.8rem; color:#665b5f;">
									[옵션 : 사이즈(<%=gsize%>), 색상(<%=gcolor%>)]
								</span> 
							</td>
							<td class="c">
								<%=gprice%>원
							</td>
							<td class="c">
								<%=gamount%>개
							</td>
							<td class="c">
								<%=gprice * gamount%>원
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
				<td class="height2_5">
			</tr>
			<tr>
				<td colspan="40" class="division">
					&nbsp;&nbsp;&nbsp;결제 정보
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
							<th class="pInfo">결제 금액</th>
							<td class="pInfo2"> 
								<input type="text" value="<%=gprice * gamount%>" size="10"
								maxlength="10" readonly style="text-align:right;">원
							</td>
						</tr>
						<tr>
							<th class="pInfo">결제 수단</th>
							<td class="pInfo2"> 
								<%=paymethod%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="height4">
			</tr>
			<tr>
				<td class="c">
					<a href="">주문 상품 내역 확인하기</a>
				</td>
			</tr>
			<tr>
				<td class="height2_5">
			</tr>
		</table>
	</div>
</body>
</html>