package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.OrderDAO;
import com.dto.OrderDTO;

public class OrderService {

	private OrderDAO dao;

	public OrderService() {
		super();
		dao = new OrderDAO();
	}

	public int directSepOrder(OrderDTO oDto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.directSepOrder(session, oDto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}

	public int completeDirectSepOrder(OrderDTO oDto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.completeDirectSepOrder(session, oDto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}

}
