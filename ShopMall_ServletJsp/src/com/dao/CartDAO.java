package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CartDTO;

public class CartDAO {

	public int putInCart(SqlSession session, CartDTO cart) {
		int n = session.insert("CartMapper.putInCart", cart);
		return n;
	}

	public List<CartDTO> cartList(SqlSession session, String userid) {
		List<CartDTO> list = session.selectList("CartMapper.cartList", userid);
		return list;
	}

	public int deleteSep(SqlSession session, int num) {
		int n = session.delete("CartMapper.deleteSep", num);
		return n;
	}
}
