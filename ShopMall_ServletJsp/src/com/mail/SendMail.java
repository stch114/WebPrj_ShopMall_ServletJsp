package com.mail;

import javax.mail.PasswordAuthentication;

public class SendMail extends javax.mail.Authenticator {
	public PasswordAuthentication getPasswordAuthentication() {

		// 이메일을 통해 id를 전송 받으려면 이메일 환경설정 조작해야 함.
		// ex) 네이버의 경우, 이메일 환경설정란으로 들어가서 상단의 'POP3/IMAP 설정'을 클릭한 후
		// 'POP3/SMTP 사용'을 '사용함'으로 변경.

		System.out.println("PasswdAuthentication");
		// naver, gmail 등 사용자의 email 계정 정보 입력.
		return new PasswordAuthentication("ㅁㅁ", "ㅁㅁㅁㅁㅁ"); // 파라미터 -> id, 비밀번호.
	}
}