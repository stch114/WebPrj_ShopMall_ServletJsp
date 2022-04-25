package com.controller.goods;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.service.CartService;

@WebServlet("/ConfirmSepOrderInCartServlet")
public class ConfirmSepOrderInCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO) session.getAttribute("logIn");
		String nextPage = null;
		if (mDto != null) {
			String num = request.getParameter("num");
			System.out.println("장바구니에서 주문하는 상품의 주문번호: " + num);
			CartService cService = new CartService();
			CartDTO cDto = cService.sepOrderInCart(num);

			request.setAttribute("cDto", cDto);
			nextPage = "confirmSepOrderInCart.jsp";
		} else {
			nextPage = "LogInUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
