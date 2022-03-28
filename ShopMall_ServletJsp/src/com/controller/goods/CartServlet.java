package com.controller.goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.service.CartService;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("logIn");
		String nextPage = null;
		if (member != null) { // 로그인 되어있는 경우.
			String userid = member.getUserid();
			String gcode = request.getParameter("gcode");
			String gname = request.getParameter("gname");
			String gprice = request.getParameter("gprice");
			String gimage = request.getParameter("gimage");
			String gsize = request.getParameter("gsize");
			String gcolor = request.getParameter("gcolor");
			String gamount = request.getParameter("gamount");

			CartDTO cart = new CartDTO();
			cart.setUserid(userid);
			cart.setGcode(gcode);
			cart.setGname(gname);
			cart.setGprice(Integer.parseInt(gprice));
			cart.setGimage(gimage);
			cart.setGsize(gsize);
			cart.setGcolor(gcolor);
			cart.setGamount(Integer.parseInt(gamount));

			CartService c_service = new CartService();
			int n = c_service.putInCart(cart);
			System.out.println(n + "개 상품을 장바구니에 저장.");
			nextPage = "GoodsDetailServlet?gcode=" + gcode;
			session.setAttribute("mesg", "상품 코드 " + gcode + " 제품을 장바구니에 저장했습니다.");
		} else { // 로그인 되어있지 않은 경우.
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
