package com.dao;

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
}
