package com.dao;

import java.util.HashMap;
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

	public int changeQty(SqlSession session, HashMap<String, Integer> map) {
		int n = session.update("CartMapper.changeQty", map);
		return n;
	}

	public int delChecked(SqlSession session, List<String> list) {
		int n = session.delete("CartMapper.delChecked", list);
		return n;
	}

	public int delAll(SqlSession session, List<String> list) {
		int n = session.delete("CartMapper.delAll", list);
		return n;
	}
}
