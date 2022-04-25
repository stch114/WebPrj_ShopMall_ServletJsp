package com.controller.goods;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.OrderService;

@WebServlet("/ConfirmDirectSepOrderServlet")
public class ConfirmDirectSepOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO) session.getAttribute("logIn");
		String nextPage = null;
		if (mDto != null) {
			String userid = mDto.getUserid();
			String gcode = request.getParameter("gcode");
			String gname = request.getParameter("gname");
			String gprice = request.getParameter("gprice");
			String gimage = request.getParameter("gimage");
			String gsize = request.getParameter("gsize");
			String gcolor = request.getParameter("gcolor");
			String gamount = request.getParameter("gamount");

			OrderDTO oDto = new OrderDTO();
			oDto.setUserid(userid);
			oDto.setGcode(gcode);
			oDto.setGname(gname);
			oDto.setGprice(Integer.parseInt(gprice));
			oDto.setGimage(gimage);
			oDto.setGsize(gsize);
			oDto.setGcolor(gcolor);
			oDto.setGamount(Integer.parseInt(gamount));

			OrderService oService = new OrderService();
			int n = oService.directSepOrder(oDto);
			System.out.println(n + "개 상품 레코드를 주문테이블에 저장.");
			request.setAttribute("oDto", oDto);
			nextPage = "confirmDirectSepOrder.jsp";
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
