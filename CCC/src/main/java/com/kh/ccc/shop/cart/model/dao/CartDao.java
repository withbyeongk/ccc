package com.kh.ccc.shop.cart.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.goods.model.vo.Wish;

@Repository
public class CartDao {

	public int updateCartChangeQuantity(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.update("cartMapper.updateCartChangeQuantity", c);
	}

	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList", memberNo);
	}

	public Cart selectCart(SqlSessionTemplate sqlSession, int cartNo) {
		return sqlSession.selectOne("cartMapper.selectCart", cartNo);
	}

	public Cart selectCartByGoodsNo(SqlSessionTemplate sqlSession, int goodsNo) {
		return sqlSession.selectOne("cartMapper.selectCartByGoodsNo", goodsNo);
	}
	
	public int selectCartByGnoMno(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.selectOne("cartMapper.selectCartByGnoMno", c);
	}
	
	public int deleteGoodsInCart(SqlSessionTemplate sqlSession, int cartNo) {
		return sqlSession.delete("cartMapper.deleteGoodsInCart", cartNo);
	}

	public int insertWish(SqlSessionTemplate sqlSession, Wish w) {
		return sqlSession.insert("cartMapper.insertWish", w);
	}

	public ArrayList<Wish> selectWishList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("cartMapper.selectWishList", memberNo);
	}

	public int checkWish(SqlSessionTemplate sqlSession, Wish w) {
		return sqlSession.selectOne("cartMapper.checkWish", w);
	}

	public int removeWish(SqlSessionTemplate sqlSession, Wish w) {
		return sqlSession.delete("cartMapper.removeWish", w);
	}

	public int deleteGoodsInCart(SqlSessionTemplate sqlSession, List<Integer> chkArr) {
		int result = 1;
		for(int i=0; i<chkArr.size(); i++) {
			result *= sqlSession.delete("cartMapper.deleteGoodsInCart", chkArr.get(i));
		}
		return result;
	}

	public ArrayList<Cart> selectCartListBycnoList(SqlSessionTemplate sqlSession, ArrayList<Integer> cnoList) {
		// 여기부터 수정하면 될듯.
		ArrayList<Cart> clist = new ArrayList<>();
		
		for (int i=0; i<cnoList.size(); i++) {
//			System.out.println("DAO::selectCartListBycnoList:: cartNo : " + cnoList.get(i));
			Cart c = sqlSession.selectOne("cartMapper.selectCart", cnoList.get(i));
//			System.out.println("DAO::selectCartListBycnoList:: c : " + c);
			clist.add(c);
		}
//		System.out.println("DAO::selectCartListBycnoList:: clist : \n ->" + clist);
		
		return clist; 
	}

	public int updateStock(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.update("cartMapper.updateStock", cart);
	}

	public int updateStock(SqlSessionTemplate sqlSession, ArrayList<Cart> clist) {
		int result = 1;
		for (int i=0; i<clist.size(); i++) {
			result *= sqlSession.update("cartMapper.updateStock", clist.get(i));
		}
		return result;
	}

	public int insertCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.insert("cartMapper.insertCart", c);
	}



}
