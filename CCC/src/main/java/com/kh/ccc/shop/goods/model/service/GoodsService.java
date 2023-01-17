package com.kh.ccc.shop.goods.model.service;

import java.util.ArrayList;

import com.kh.ccc.shop.goods.model.vo.Goods;
import com.kh.ccc.shop.goods.model.vo.GoodsReview;

public interface GoodsService {
	
	//그냥 리스트 가기
	public ArrayList<Goods> goodsList();
	
	//네비에서 카테고리 들고가기
	public ArrayList<Goods> goodsList(String category);
	
	//굿즈 글쓰기
	public int insertGoods(Goods g);
	
	//굿즈 디테일
	public Goods selectGoods(int gno);
	
	//리뷰 등록
	public int insertReview(GoodsReview gr);
	
	//리뷰 조회
	public ArrayList<GoodsReview> selectReviewList(int gno);

	//검색 기능
	public ArrayList<Goods> searchList(String keyword);
}