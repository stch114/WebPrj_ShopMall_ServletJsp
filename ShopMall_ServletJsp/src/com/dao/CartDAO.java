package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.CartDTO;

public class CartDAO {

	public int putInCart(SqlSession session, CartDTO cart) {
		int n = session.insert("CartMapper.putInCart", cart);
		return n;
	}
}
