package com.bc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.ShopVO;
import com.bc.mybatis.DBService;

public class ShopDAO {
	
	public ShopDAO() {
	}
	
	public List<ShopVO> list(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ShopVO> list = ss.selectList("list", category);
		ss.close();
		return list;
	}
	
	// 제품번호로 데이터 조회
	public ShopVO selectOne(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		ShopVO vo = ss.selectOne("one", idx);
		ss.close();
		return vo;
	}
	
	public List<ShopVO> selectsort(String menusort) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ShopVO> list = ss.selectList("list", menusort);
		ss.close();
		return list;
	}
}




















