<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<!-- main화면으로 include해줄 상품 목록 페이지(table구조 주의) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="goods/goodsList.css">
<style></style>
</head>
<body>
	<div>
		<table id="table1">
			<tr>
				<%
					/* MainServlet에서 저장해준 데이터 파싱. */
					List<GoodsDTO> list = (List<GoodsDTO>) request.getAttribute("goodsList");
				for (int i = 1; i <= list.size(); i++) {
					GoodsDTO dto = list.get(i - 1); // 주의) i는 1부터 시작하도록 설정했음.
					String gcode = dto.getGcode();
					String gcategory = dto.getGcategory();
					String gname = dto.getGname();
					String gcontent = dto.getGcontent();
					int gprice = dto.getGprice();
					String gimage = dto.getGimage();
				%>
				<td>
					<table id="table2">
						<tr>
							<td>
								<a href="GoodsDetailServlet?gcode=<%=gcode%>">
									<img src="images/items/<%=gimage%>.gif">
								</a>
							</td>
						</tr>
						<tr>
							<td class="h"></td>
						</tr>
						<tr>
							<td class="c">
								<a href="GoodsDetailServlet?gcode=<%=gcode%>"><%=gname%></a>
							</td>
						</tr>
						<tr>
							<td class="c" class="h" style="color: gray;">
								--------------------
							</td>
						</tr>
						<tr>
							<td class="c"><%=gcontent%></td>
						</tr>
						<tr>
							<td class="h"></td>
						</tr>
						<tr>
							<td class="c" class="cr" style="color: red;">
								<strong><%=gprice%></strong>
							</td>
						</tr>
					</table>
				</td>
				<%
					/* 한 줄에 상품 4개씩 보여주기 */
				if (i % 4 == 0) {
				%>
			</tr><!-- 첫 번째 <tr>의 closing. -->
			<tr>
				<td class="h">
			</tr>
			<tr><!-- 한 줄 보여주기가 끝난 후 다음 줄로 넘어가기 위해 행 열어줌. -->
				<%
					} // end of 'if'
				} // end of 'for'
				%>
			</tr>
		</table>
	</div>
</body>
</html>