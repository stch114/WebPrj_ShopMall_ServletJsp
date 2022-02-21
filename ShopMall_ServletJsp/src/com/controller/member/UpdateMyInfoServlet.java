package com.controller.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/UpdateMyInfoServlet")
public class UpdateMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("logIn");
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		if (dto != null) {
			String userid = request.getParameter("userid");
			String post = request.getParameter("post");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");

			HashMap<String, String> map = new HashMap<>();
			map.put("userid", userid);
			map.put("post", post);
			map.put("addr1", addr1);
			map.put("addr2", addr2);
			map.put("phone1", phone1);
			map.put("phone2", phone2);
			map.put("phone3", phone3);
			map.put("email1", email1);
			map.put("email2", email2);
			MemberService service = new MemberService();
			int num = service.updateMyInfo(map);
			System.out.println("수정된 레코드: " + num + "개");
			nextPage = "main";
			request.setAttribute("mesg", "회원 정보가 수정되었습니다.");
		} else {
			nextPage = "LogInUIServlet";
			request.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
