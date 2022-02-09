package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.MemberDTO;

public class MemberService {

	MemberDAO dao;

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
}