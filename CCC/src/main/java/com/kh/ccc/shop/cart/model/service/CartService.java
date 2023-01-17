package com.kh.ccc.shop.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.goods.model.vo.Wish;

@Service
public interface CartService {
	
	// 장바구니에서 해당 굿즈의 수량을 변경
	int updateCartChangeQuantity(Cart c);
	
	// 해당 회원의 장바구니를 조회
	ArrayList<Cart> selectCartList(int memberNo);
	
	// 카트번호 리스트로 카트 정보 리스트로 가져옴
	ArrayList<Cart> selectCartListBycnoList(ArrayList<Integer> cnoList);
	
	// cartNo로 굿즈번호와 수량 조회
	Cart selectCart(int cartNo);
	
	// goodsNo로 카트 조회
	Cart selectCartByGoodsNo(int goodsNo);

	// M_NO와 G_NO로 카트 조회 
	int selectCartByGnoMno(Cart c);
	
	// 장바구니에서 cartNo 삭제
	int deleteGoodsInCart(int cartNo);

	// 해당 멤버의 관심상품 굿즈번호 조회
	ArrayList<Wish> selectWishList(int memberNo);
	
	// 관심상품 등록
	int insertWish(Wish w);

	// 관심상품 존재 유무 확인
	int checkWish(Wish w);

	// 관심상품 삭제
	int removeWish(Wish w);

	// 관심 상품 선택 삭제
	int deleteGoodsInCart(List<Integer> chkArr);
	
	// 한 항목 구매 시 재고 업데이트
	int updateStock(Cart cart);
	
	// 여러 항목 구매 시 재고 업데이트
	int updateStock(ArrayList<Cart> clist);

	// 장바구니에 상품 추가
	int insertCart(Cart c);


}
