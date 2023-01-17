package com.kh.ccc.shop.goods.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.shop.goods.model.vo.Goods;
import com.kh.ccc.shop.goods.model.vo.GoodsReview;

@Repository
public class GoodsDao {

	//리스트 출력
	public ArrayList<Goods> selectList(SqlSessionTemplate sqlSession) {
		ArrayList<Goods> list = (ArrayList)sqlSession.selectList("goodsMapper.selectList");
		System.out.println("dao리스트 : "+list);
		return list;
	}
	
	//리스트 출력
	public ArrayList<Goods> selectList(SqlSessionTemplate sqlSession, String category) {
		ArrayList<Goods> list = (ArrayList)sqlSession.selectList("goodsMapper.selectList",category);
		System.out.println("dao리스트2 : "+list);
		return list;
	}
	
	//글쓰기
	public int insertGoods(SqlSessionTemplate sqlSession, Object g) {
		return sqlSession.insert("goodsMapper.insertGoods",g);
	}
	
	//상세보기
	public Goods selectBoard(SqlSessionTemplate sqlSession, int goodsNo) {
		return sqlSession.selectOne("goodsMapper.selectBoard", goodsNo);
	}
	
	//리뷰 등록
	public int insertReview(SqlSessionTemplate sqlSession, GoodsReview gr) {
		return sqlSession.insert("goodsMapper.insertReview", gr);
	}
	
	//리뷰 조회
	public ArrayList<GoodsReview> selectReviewList(SqlSessionTemplate sqlSession, int goodsNo) {
		return (ArrayList)sqlSession.selectList("goodsMapper.selectReviewList", goodsNo);
	}

	//검색 기능
	public ArrayList<Goods> searchList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("goodsMapper.searchList", keyword);
	}
}
