package com.controller.goods;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.GoodsDTO;
import com.service.GoodsService;

@WebServlet("/GoodsListServlet")
public class GoodsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String gcategory = request.getParameter("gcategory"); // top.jsp에서 전송한 데이터 파싱.
		if (gcategory == null) { // 전송 데이터 없을 경우에는(= main 화면에서는) top의 상품 사진이 보이도록.
			gcategory = "top";
		}
		GoodsService service = new GoodsService();
		List<GoodsDTO> list = service.goodsList(gcategory);

		request.setAttribute("goodsList", list);

		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
