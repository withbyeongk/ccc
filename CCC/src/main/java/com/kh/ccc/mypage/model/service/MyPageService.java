package com.kh.ccc.mypage.model.service;
import java.util.ArrayList;

import com.kh.ccc.mypage.model.vo.MyCharacter;
import com.kh.ccc.mypage.model.vo.MyCharacterAttach;
import com.kh.ccc.mypage.model.vo.MyCharacterData;
import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.goods.model.vo.Wish;
import com.kh.ccc.shop.goods.model.vo.WishGoods;
import com.kh.ccc.shop.order.model.vo.MyOrderDetail;
import com.kh.ccc.shop.order.model.vo.Order;
import com.kh.ccc.shop.order.model.vo.OrderDetail;
import com.kh.ccc.shop.order.model.vo.OrderListByDate;
import com.kh.ccc.shop.shipping.model.vo.DeliveryDetail;

public interface MyPageService {

	//마이페이지 들어갈때 주문목록조회
	ArrayList<MyOrderDetail> selectOrderListView(int memberNo);
	
	//마이캐릭터 목록조회
	ArrayList<MyCharacter> selectchaList(int memberNo);
	
	//마이캐릭터 입력
	int mycharInsert(MyCharacter cha, ArrayList<MyCharacterAttach> mchalist);

	//마이캐릭터 상세보기1.  조회수 증가
    //int increaseCount(int characterNo);

	//마이캐릭터 상세보기2. 글 조회
	MyCharacter selecectMyChar(int characterNo);

	//마이캐릭터 상세보기3. 이미지리스트 조회
	ArrayList<MyCharacterAttach> selectChaList(int characterNo);

	//마이캐릭터 실제업데이트
	int updateMyChar(MyCharacter cha, ArrayList<MyCharacterAttach> newlist);

	//마이캐릭터 삭제
	int delteMyChar(int characterNo);

	//주문상세페이지1. 리스트조회
	ArrayList<OrderDetail> orderDetail(int orderNo);

	//주문상세페이지2. 조회(join)
	MyOrderDetail myOrderDetail(int orderNo);

	//배송정보 조회(상품상세번호객체-상품상세번호, 상품번호 필요)
	DeliveryDetail selectDeliveryDetail(OrderDetail od);

	//기간별 주문리스트 (시작날짜,끝날짜, 사용자번호 객체를 담아서 가져감)
    //ArrayList<Order> selectOrderListView(int userNo, Date startDate, Date endDate);
	ArrayList<Order> selectOrderListView(OrderListByDate tbd);

	//기간별 주문리스트(실제 주문리스트)
	MyOrderDetail selectRealOrderListView(int orderNo);

	//장바구니 조회
	ArrayList<Cart> selectCartList(int memberNo);

	//캐릭터별 좋아요 데이터 조회
	ArrayList<MyCharacterData> dataSelect(int memberNo);

	//찜한 위시리스트 조회
	ArrayList<WishGoods> selectWishList(int memberNo);

	//찜한리스트 삭제
	int deleteWishList(Wish wish);

	//장바구니 추가1. 카트에 상품 이미 있는지 확인작업
	boolean findCartGoods(Cart cart);

	//장바구니 추가2. 장바구니에 상품없었을 때에 실제 추가작업
	void addCartGoods(Cart cart);
	
	//장바구니 수량수정
	int updateCartCount(Cart cart);
	
	
	
	
}
