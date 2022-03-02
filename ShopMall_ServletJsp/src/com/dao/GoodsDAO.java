package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.GoodsDTO;

public class GoodsDAO {

	public List<GoodsDTO> goodsList(SqlSession session, String gcategory) {
		List<GoodsDTO> list = session.selectList("GoodsMapper.goodsList", gcategory);
		return list;
	}

	public GoodsDTO goodsDetail(SqlSession session, String gcode) {
		GoodsDTO dto = session.selectOne("GoodsMapper.goodsDetail", gcode);
		return dto;
	}
}
