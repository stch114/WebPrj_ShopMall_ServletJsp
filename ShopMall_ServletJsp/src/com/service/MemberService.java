package com.service;

import java.util.HashMap;

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

	public MemberDTO logIn(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO dto = null;
		try {
			dto = dao.logIn(session, map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
}