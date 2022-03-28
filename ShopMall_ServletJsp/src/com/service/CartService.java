package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CartDAO;
import com.dto.CartDTO;

public class CartService {

	private CartDAO dao;

	public CartService() {
		super();
		dao = new CartDAO();
	}

	public int putInCart(CartDTO cart) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.putInCart(session, cart);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
}
