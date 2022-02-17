package com.controller.main;

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

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GoodsService service = new GoodsService();
		List<GoodsDTO> list = service.goodsList("top"); // gcategory를 파라미터로.
		System.out.println(list.size());

		request.setAttribute("goodsList", list);
		// request스코프로 데이터 저장했기 때문에 화면처리는 forward 방식으로.
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
