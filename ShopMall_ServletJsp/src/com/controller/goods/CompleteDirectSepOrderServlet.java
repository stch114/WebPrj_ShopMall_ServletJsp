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

@WebServlet("/CompleteDirectSepOrderServlet")
public class CompleteDirectSepOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO) session.getAttribute("logIn");
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		if (mDto != null) {
			String userid = mDto.getUserid();

			String gcode = request.getParameter("gcode");
			String gname = request.getParameter("gname");
			String gprice = request.getParameter("gprice");
			String gsize = request.getParameter("gsize");
			String gcolor = request.getParameter("gcolor");
			String gamount = request.getParameter("gamount");
			String gimage = request.getParameter("gimage");
			String ordername = request.getParameter("oName");
			String post = request.getParameter("oPostcode");
			String addr1 = request.getParameter("oRoadNameAdd");
			String addr2 = request.getParameter("oLotNumAdd");
			String phone1 = request.getParameter("oPhone1");
			String phone2 = request.getParameter("oPhone2");
			String phone3 = request.getParameter("oPhone3");
			String paymethod = request.getParameter("pmtMethod");

			OrderDTO oDto = new OrderDTO();
			oDto.setUserid(userid);
			oDto.setGcode(gcode);
			oDto.setGname(gname);
			oDto.setGprice(Integer.parseInt(gprice));
			oDto.setGsize(gsize);
			oDto.setGcolor(gcolor);
			oDto.setGamount(Integer.parseInt(gamount));
			oDto.setGimage(gimage);
			oDto.setOrdername(ordername);
			oDto.setPost(post);
			oDto.setAddr1(addr1);
			oDto.setAddr2(addr2);
			oDto.setPhone1(phone1);
			oDto.setPhone2(phone2);
			oDto.setPhone3(phone3);
			oDto.setPaymethod(paymethod);
			System.out.println("CompleteDirectSepOrderServlet.oDto ===== " + oDto);
			OrderService oService = new OrderService();
			int n = oService.completeDirectSepOrder(oDto);
			System.out.println(n + "개 제품 주문 완료(주문테이블 레코드 수정).");
			request.setAttribute("oDto", oDto);
			nextPage = "completeDirectSepOrder.jsp";
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
