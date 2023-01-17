package com.kh.ccc.shop.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.shop.cart.model.dao.CartDao;
import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.goods.model.vo.Wish;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDao cartDao = new CartDao();
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int updateCartChangeQuantity(Cart c) {
		return cartDao.updateCartChangeQuantity(sqlSession, c);
	}

	@Override
	public ArrayList<Cart> selectCartList(int memberNo) {
		return cartDao.selectCartList(sqlSession, memberNo);
	}

	@Override
	public Cart selectCart(int cartNo) {
		return cartDao.selectCart(sqlSession, cartNo);
	}

	@Override
	public Cart selectCartByGoodsNo(int goodsNo) {
		return cartDao.selectCartByGoodsNo(sqlSession, goodsNo);
	}
	
	@Override
	public int selectCartByGnoMno(Cart c) {
		return cartDao.selectCartByGnoMno(sqlSession, c);
	}

	@Override
	public int deleteGoodsInCart(int cartNo) {
		return cartDao.deleteGoodsInCart(sqlSession, cartNo);
	}

	@Override
	public int insertWish(Wish w) {
		return cartDao.insertWish(sqlSession, w);
	}

	@Override
	public ArrayList<Wish> selectWishList(int memberNo) {
		return cartDao.selectWishList(sqlSession, memberNo);
	}

	@Override
	public int checkWish(Wish w) {
		return cartDao.checkWish(sqlSession, w);
	}

	@Override
	public int removeWish(Wish w) {
		return cartDao.removeWish(sqlSession, w);
	}

	@Override
	public int deleteGoodsInCart(List<Integer> chkArr) {
		return cartDao.deleteGoodsInCart(sqlSession, chkArr);
	}

	@Override
	public ArrayList<Cart> selectCartListBycnoList(ArrayList<Integer> cnoList) {
		return cartDao.selectCartListBycnoList(sqlSession, cnoList);
	}

	@Override
	public int updateStock(Cart cart) {
		return cartDao.updateStock(sqlSession, cart);
	}

	@Override
	public int updateStock(ArrayList<Cart> clist) {
		return cartDao.updateStock(sqlSession, clist);
	}

	@Override
	public int insertCart(Cart c) {
		return cartDao.insertCart(sqlSession, c);
	}




}
