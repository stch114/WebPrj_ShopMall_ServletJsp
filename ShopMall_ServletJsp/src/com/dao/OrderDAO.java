package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.OrderDTO;

public class OrderDAO {

	public int directSepOrder(SqlSession session, OrderDTO oDto) {
		int n = session.insert("OrderMapper.directSepOrder", oDto);
		return n;
	}

	public int completeDirectSepOrder(SqlSession session, OrderDTO oDto) {
		int n = session.update("OrderMapper.completeDirectSepOrder", oDto);
		return n;
	}

}
