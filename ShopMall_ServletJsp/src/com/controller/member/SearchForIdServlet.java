package com.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/SearchForIdServlet")
public class SearchForIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username").trim();
		String phone1 = request.getParameter("phone1").trim();
		String phone2 = request.getParameter("phone2").trim();
		String phone3 = request.getParameter("phone3").trim();
		String email1 = request.getParameter("email1").trim();
		String email2 = request.getParameter("email2").trim();

		MemberDTO dto = new MemberDTO();
		dto.setUsername(username);
		dto.setPhone1(phone1);
		dto.setPhone2(phone2);
		dto.setPhone3(phone3);

		MemberService service = new MemberService();
		String userid = service.searchForId(dto);
		System.out.println("회원 ID(userid) 확인: " + userid);
		String nextPage = null;
		if (userid == null) { // 회원 정보에 해당되는 ID가 없는 경우
			nextPage = "SearchForIdUIServlet";
			request.setAttribute("mesg", "이름 또는 핸드폰이 등록되어 있지 않습니다.");
		} else { // 회원 정보에 해당되는 ID가 있는 경우
			nextPage = "SendMailServlet";
			// 이름, 이메일 정보, 아이디 등의 회원정보를 각각 request스코프에 저장.
			request.setAttribute("mailTo", email1 + "@" + email2);
			request.setAttribute("username", username);
			request.setAttribute("userid", userid);
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
