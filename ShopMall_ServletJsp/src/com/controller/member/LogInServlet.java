package com.controller.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/LogInServlet")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// logInForm.jsp에서 받은 데이터 파싱.
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		HashMap<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);

		MemberService service = new MemberService();
		MemberDTO dto = service.logIn(map); // 회원인 경우 dto 존재.

		String nextPage = null;
		if (dto != null) { // 회원인 경우
			nextPage = "main"; // main.jsp -> MainServlet으로 변경해주었음.
			HttpSession session = request.getSession();
			session.setAttribute("logIn", dto);
			session.setMaxInactiveInterval(60 * 60); // 1시간(세션 만료 시간) 설정.
		} else { // 회원이 아닌 경우(DB에 저장된 회원정보가 없는 경우)
			nextPage = "LogInUIServlet";
		}
		response.sendRedirect(nextPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}