package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.MemberDTO;

public class MemberService {

	private MemberDAO dao;

	public MemberService() {
		super();
		dao = new MemberDAO();
	}

	public int addMember(MemberDTO dto) {

		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.addMember(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int checkId(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int count = 0;
		try {
			count = dao.checkId(session, userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}
}