<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.GoodsDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="goods/goodsDetail.css">
<style></style>
<%
	/* CartServlet에서 저장해둔 session 정보. */
	String mesg = (String) session.getAttribute("mesg");
if (mesg != null) {
%>
<script>
alert('<%=mesg%>');
</script>

<%
	}
session.removeAttribute("mesg");
%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script type="text/javascript">	
	$(document).ready(function() {

		$("#cart").on("click", function() {

			if ($("#gsize").val() == "사이즈 선택") {
				alert("사이즈를 선택하세요.");
				return false;
				// event.preventDefault();
			}

			if ($("#gcolor").val() == "색상 선택") {
				alert("색상을 선택하세요.");
				return false;
				// event.preventDefault();
			}

			$("form").attr("action", "CartServlet");
		});

		$("#order").on("click", function() {
			if ($("#gsize").val() == "사이즈 선택") {
				alert("사이즈를 선택하세요.");	
				return false;
			}
			
			if($("#gcolor").val() == "색상 선택") {
				alert("색상을 선택하세요.");
				return false;
			}
			
			$("form").attr("action", "ConfirmDirectSepOrderServlet");
		});
	});
</script>
</head>
<body>
<%
	GoodsDTO dto = (GoodsDTO) request.getAttribute("goodsDetail");
String gcode = dto.getGcode();
String gname = dto.getGname();
int gprice = dto.getGprice();
String gimage = dto.getGimage();
%>
<form>
	<input type="hidden" name="gcode" value="<%=gcode%>"> 
	<input type="hidden" name="gname" value="<%=gname%>"> 
	<input type="hidden" name="gprice" value="<%=gprice%>">
	<input type="hidden" name="gimage" value="<%=gimage%>"> 
	<div>
		<table id="table1">
			<tr>
				<td style="height:2rem;"></td>
			</tr>
			<tr>
				<td>
					<table id="table2">
						<tr>
							<th id="f">상품 정보</th>
						</tr>
						<tr>
							<td class="h"></td>
						</tr>
						<tr>
							<td rowspan="10">
								<img id="gimage" src="images/items/<%=gimage%>.gif">
							</td>
							<th class="ginfo">상품 코드</th>
							<td class="p" colspan="2"><%=gcode%></td>
						</tr>
						<tr>
							<th class="ginfo">상품명</th>
							<td class="p" colspan="2"><%=gname%></td>
						</tr>
						<tr>
							<th class="ginfo">가격</th>
							<td class="p" colspan="2"><%=gprice%></td>
						</tr>
						<tr>
							<th class="ginfo">배송비</th>
							<td class="p" colspan="2" style="font-size:1rem;">
								<span>무료 배송</span>(도서 산간 지역은 별도 배송비 추가)
							</td>
						</tr>
						<tr>
							<th class="ginfo">상품 옵션</th>
							<td class="p">
								<select name="gsize" id="gsize">
									<option selected value="사이즈 선택">사이즈 선택</option>
									<option value="L">L</option>
									<option value="M">M</option>
									<option value="S">S</option>
								</select><br>
								<select name="gcolor" id="gcolor">
									<option selected value="색상 선택">색상 선택</option>
									<option value="navy">navy</option>
									<option value="black">black</option>
									<option value="ivory">ivory</option>
									<option value="white">white</option>
									<option value="gray">gray</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="h"></td>
						</tr>
						<tr>
							<th class="ginfo">주문 수량</th>
							<td class="p">
								<input type="text" name="gamount" id="gamount" 
								value="1" style="text-align:right;"> 
								<img class="gamount" src="images/up.PNG"> 
								<img class="gamount" src="images/down.PNG">
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<button id="order">주문하기</button>&nbsp;&nbsp;
								<button id="cart">장바구니에 담기</button>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>