package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CartDAO;
import com.dto.CartDTO;
import com.dto.OrderDTO;

public class CartService {

	private CartDAO dao;

	public CartService() {
		super();
		dao = new CartDAO();
	}

	public int putInCart(CartDTO cDto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.putInCart(session, cDto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;

	}

	public int changeQty(HashMap<String, Integer> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.changeQty(session, map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}

	public int delChecked(List<String> list) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.delChecked(session, list);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}

	public int delAll(List<String> list) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.delAll(session, list);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}

	public CartDTO sepOrderInCart(String num) {
		SqlSession session = MySqlSessionFactory.getSession();
		CartDTO dto = null;
		try {
			dto = dao.sepOrderInCart(session, num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	public int completeSepOrderInCart(OrderDTO oDto, String num) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.completeSepOrderInCart(session, oDto); // order ??????????????? ??????.
			n = dao.deleteSep(session, Integer.parseInt(num)); // cart ?????????????????? ??????.
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback(); // Tx(????????????) ?????? ??????.
			System.out.println(".completeSepOrderInCart() error ?????? >>> rollback ??????.");
		} finally {
			session.close();
		}
		return n;
	}
}
