package com.controller.goods;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.CartService;

@WebServlet("/ChangeQtyServlet")
public class ChangeQtyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("logIn");
		String nextPage = null;
		if (dto != null) {
			String num = request.getParameter("num");
			String gamount = request.getParameter("gamount");
			System.out.println("ChangeQtyServlet >>>> num, gamount: " + num + ", " + gamount);
			HashMap<String, Integer> map = new HashMap<>();
			map.put("num", Integer.parseInt(num));
			map.put("gamount", Integer.parseInt(gamount));

			CartService service = new CartService();
			int n = service.changeQty(map);
			System.out.println(n + "개의 장바구니 상품의 수량 변경 성공.");
		} else {
			nextPage = "LogInUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			response.sendRedirect(nextPage);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
