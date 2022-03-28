<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.CartDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- <link rel="stylesheet" type="text/css" href="goods/cartList.css"> -->
<style>
.h {
	height: 1rem;
}

.c {
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<form>
			<table>
				<tr>
					<td style="height: 2rem;"></td>
				</tr>
				<tr>
					<td colspan="5" style="font-size: 1.5rem; font-weight: bold;">
						&nbsp;&nbsp;&nbsp;나의 장바구니 목록
					</td>
				</tr>
				<tr>
					<td class="h">
				</tr>
				<tr>
					<td colspan="15">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="h">
				</tr>
				<tr>
					<th style="width:8rem;">
						<input type="checkbox" name="checkAll" id="checkAll">전체 선택
					</th>
					<th style="width:6rem;">주문 번호</th>
					<th style="width:25rem;" colspan="2">상품 정보</th>
					<th style="width:6rem;">상품 가격</th>
					<th style="width:10rem; padding-left:1rem;">수량</th>
					<th style="width:6rem;">결제 금액</th>
					<th style="width:6rem;"></th>
					<th style="width:10rem;"></th>
					<th style="width:10rem;"></th>
				</tr>
				<tr>
					<td class="h">
				</tr>
				<tr>
					<td colspan="15">
						<hr>
					</td>
				</tr>
				<%
					List<CartDTO> list = (List<CartDTO>) request.getAttribute("cartList");

				for (int i = 0; i < list.size(); i++) {
					CartDTO dto = list.get(i);
					int num = dto.getNum();
					String userid = dto.getUserid();
					String gcode = dto.getGcode();
					String gname = dto.getGname();
					int gprice = dto.getGprice();
					String gsize = dto.getGsize();
					String gcolor = dto.getGcolor();
					int gamount = dto.getGamount();
					String gimage = dto.getGimage();
				%>
				<tr>	
					<td class="c"><input type="checkbox" name="checkOne" id="checkOne"></td>
					<td class="c"><%=num%></td>
					<td class="c">
						<img src="images/items/<%=gimage%>.gif" style="width:7rem; padding-left:2rem;">
					</td>
					<td style="padding-left:1rem;">
						<%=gname%><br> 
						<span style="font-size: 0.8rem; color: #665b5f;">
							[옵션 : 사이즈(<%=gsize%>), 색상(<%=gcolor%>)]
						</span>
					</td>
					<td class="c"><%=gprice%></td>
					<td style="padding-left:3rem;">
						<input type="text" name="gamount" id="gamount" 
						style="text-align: right;" maxlength="2" size="1" 
						value="<%=gamount%>">
						<input type="button" value="수량 변경"></td>
					<td class="c">
						<span><%=gprice * gamount%></span>
					</td>
					<td class="c"><input type="button" value="구매"></td>
					<td class="c">
						<input type="button" value="장바구니에서 삭제">
					</td>
					<td></td>
				</tr>
				<tr>
					<td class="h"></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="15">
						<hr>
					</td>
				</tr>
				<tr>
					<td style="height: 2rem;">
				</tr>
				<tr>
					<td colspan="6"></td>
					<td colspan="4" style="text-align:right;">
						<a href="">전체 구매</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="">전체 삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="GoodsListServlet">계속 쇼핑하기</a>
					</td>
				</tr>
				<tr>
					<td class="h">
				</tr>
			</table>
		</form>
	</div>
</body>
</html>