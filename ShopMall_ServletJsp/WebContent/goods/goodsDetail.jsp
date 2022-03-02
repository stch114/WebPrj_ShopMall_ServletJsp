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
								<img id="gImage" src="images/items/<%=gimage%>.gif">
							</td>
							<th class="gInfo">상품 코드</th>
							<td class="p" colspan="2"><%=gcode%></td>
						</tr>
						<tr>
							<th class="gInfo">상품명</th>
							<td class="p" colspan="2"><%=gname%></td>
						</tr>
						<tr>
							<th class="gInfo">가격</th>
							<td class="p" colspan="2"><%=gprice%></td>
						</tr>
						<tr>
							<th class="gInfo">배송비</th>
							<td class="p" colspan="2" style="font-size:1rem;">
								<span>무료 배송</span>(도서 산간 지역은 별도 배송비 추가)
							</td>
						</tr>
						<tr>
							<th class="gInfo">상품 옵션</th>
							<td class="p">
								<select name="gSize" id="gSize">
									<option selected value="사이즈 선택">사이즈 선택</option>
									<option value="L">L</option>
									<option value="M">M</option>
									<option value="S">S</option>
								</select><br>
								<select name="gColor" id="gColor">
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
							<th class="gInfo">주문 수량</th>
							<td class="p">
								<input type="text" name="gAmount" id="gAmount" 
								value="1" style="text-align:right;"> 
								<img class="gAmount" src="images/up.PNG"> 
								<img class="gAmount" src="images/down.PNG">
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<button>바로 구매</button>&nbsp;&nbsp;<button>장바구니에 담기</button>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<br>
	
</form>
</body>
</html>