package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;

public class MemberDAO {

	public int addMember(SqlSession session, MemberDTO dto) {
		System.out.println(dto);
		int n = session.insert("MemberMapper.addMember", dto);
		return n;
	}

	public int checkId(SqlSession session, String userid) {
		int count = session.selectOne("MemberMapper.checkId", userid);
		return count;
	}

	public MemberDTO logIn(SqlSession session, HashMap<String, String> map) {
		MemberDTO dto = session.selectOne("MemberMapper.logIn", map);
		return dto;
	}

	public MemberDTO myPage(SqlSession session, String userid) {
		MemberDTO dto = session.selectOne("MemberMapper.myPage", userid);
		return dto;
	}

	public int updateMyInfo(SqlSession session, MemberDTO dto) {
		int n = session.update("MemberMapper.updateMyInfo", dto);
		return n;
	}

	public String searchForId(SqlSession session, MemberDTO dto) {
		String userid = session.selectOne("MemberMapper.searchForId", dto);
		return userid;
	}
}