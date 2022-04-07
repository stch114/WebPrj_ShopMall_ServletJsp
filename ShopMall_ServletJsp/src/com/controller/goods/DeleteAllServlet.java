package com.controller.goods;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.CartService;

@WebServlet("/DeleteAllServlet")
public class DeleteAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("logIn");
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		if (dto != null) {
			String[] datas = request.getParameterValues("checkOne");
			for (String data : datas) {
				System.out.println("전체 삭제하는 상품의 주문 번호: " + data);
			}
			List<String> list = Arrays.asList(datas);

			CartService service = new CartService();
			int n = service.delAll(list);
			System.out.println(n + "개 상품을 장바구니에서 삭제.");
			nextPage = "CartListServlet";
		} else {
			nextPage = "LogInUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		response.sendRedirect(nextPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
