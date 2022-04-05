package com.service;

import java.util.List;

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

	public List<CartDTO> cartList(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<CartDTO> list = null;
		try {
			list = dao.cartList(session, userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public int deleteSep(int num) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.deleteSep(session, num);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
}
