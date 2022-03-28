package com.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/AddMemberServlet")
public class AddMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddMemberServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");

		MemberDTO dto = new MemberDTO(userid, passwd, username, post, addr1, addr2, phone1, phone2, phone3, email1,
				email2);

		MemberService service = new MemberService();
		int n = service.addMember(dto);

		// redirect로 화면처리 위임하니 session scope로 데이터 저장.
		HttpSession session = request.getSession();
		if (n > 0) { // 회원가입이 정상적으로 될 경우(db에 레코드가 저장되었을 때)
			// main.jsp에서 받아 사용할 데이터.
			session.setAttribute("addMember", "회원가입 성공");
		}
		session.setMaxInactiveInterval(60 * 30); // session 만료시간 30분.
		response.sendRedirect("main"); // main.jsp -> MainServlet으로 변경해주었음.
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
