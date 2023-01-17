package com.kh.ccc.shop.goods.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.shop.goods.model.dao.GoodsDao;
import com.kh.ccc.shop.goods.model.vo.Goods;
import com.kh.ccc.shop.goods.model.vo.GoodsReview;

	@Service
	public class GoodsServiceImpl implements GoodsService{
		
	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Goods> goodsList() {
		return goodsDao.selectList(sqlSession);
	}

	@Override
	public ArrayList<Goods> goodsList(String category) {
		return goodsDao.selectList(sqlSession,category);
	}

	@Override
	public int insertGoods(Goods g) {
		return goodsDao.insertGoods(sqlSession,g);
	}

	@Override
	public Goods selectGoods(int gno) {
		return goodsDao.selectBoard(sqlSession, gno);
	}

	@Override
	public int insertReview(GoodsReview gr) {
		return goodsDao.insertReview(sqlSession, gr);
	}

	@Override
	public ArrayList<GoodsReview> selectReviewList(int gno) {
		return goodsDao.selectReviewList(sqlSession, gno);
	}

	@Override
	public ArrayList<Goods> searchList(String keyword) {
		return goodsDao.searchList(sqlSession, keyword);
	}

}


