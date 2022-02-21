package com.mail;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 별도의 .jar파일들을 라이브러리로 추가하여 작업한 부분(mailapi, pop3, smtp).

		// searchForIdServlet에서 request스코프에 저장해둔 데이터 받음.
		String mailTo = (String) request.getAttribute("mailTo");
		String userid = (String) request.getAttribute("userid");
		String username = (String) request.getAttribute("username");
		System.out.println("이메일: " + mailTo + "\t 아이디: " + userid + "\t 이름: " + username);

		// 메일을 발송해줄 호스트 정보
		String host = "smtp.naver.com";
		String subject = "사용자 ID 찾기 결과 전송"; // 이메일 제목
		String from = "ㅁㅁㅁ@ㅁㅁㅁ.com"; // 보내는 사람의 메일
		String fromName = "ShopMallPrj"; // 보내는 사람의 이름 설정해줄 수 있음.
		String to = mailTo; // 받는 사람의 메일
		String content = username + " 회원님의 아이디는 " + userid + " 입니다."; // 메일 내용

		try {
			// 메일 발송해줄 호스트 관련 프로퍼티 값 인스턴스 생성과 기본 세션(SMTP 서버 호스트 지정)
			Properties props = new Properties();
			// 주의! '네이버 SMTP' 사용 시
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "465"); // 보내는 메일 포트 설정
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");

			Authenticator auth = new SendMail(); // id, passwd 인증 -> 자바 클래스(SendMail.java).
			Session mailSession = Session.getDefaultInstance(props, auth);

			Message mesg = new MimeMessage(mailSession);
			// 보내는 사람 설정
			mesg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));

			InternetAddress[] address = { new InternetAddress(to) };
			mesg.setRecipients(Message.RecipientType.TO, address); // 받는 사람 설정

			mesg.setSubject(subject); // 제목 설정
			mesg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			mesg.setContent(content, "text/html; charset=UTF-8"); // 내용 설정(MIME 지정-HTML 형식)
			Transport.send(mesg); // 메일 보내기

		} catch (MessagingException e) {
			System.out.println("sending mail error: " + e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("error: " + e.getMessage());
			e.printStackTrace();
		}

		response.sendRedirect("LogInUIServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
