package com.kh.ccc.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class MyPageDao {

	
	//마이페이지 들어갈때 주문 목록조회
	public ArrayList<MyOrderDetail> selectOrderListView(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.MypageSelectOrderListView",memberNo);
	}
	
	
	//목록조회
	public ArrayList<MyCharacter> selectchaList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectchaList",memberNo);
	}
	
	//글과 파일리스트를 나눠서 넣어줌
	public int mycharInsert(SqlSessionTemplate sqlSession, MyCharacter cha, ArrayList<MyCharacterAttach> mchalist) {
		
		//글을 넣은 결과
		int chaResult=sqlSession.insert("myPageMapper.mycharInsert",cha);
		//System.out.println("1111111111111");
		//파일결과 1로 초기화
		int mchalistResult=1;
		
		if (chaResult>0){ //글넣은 결과가 0보다 크다면
			
		  for(MyCharacterAttach mca :mchalist) {
			  mchalistResult *=sqlSession.insert("myPageMapper.mycharAtInsert",mca);
		   }
			
		}
		
		return chaResult*mchalistResult;
	   }

	
	//조회수 증가
//		public int increaseCount(SqlSessionTemplate sqlSession, int characterNo) {
//			return sqlSession.update("myPageMapper.increaseCount",characterNo);
//			
//		}

	//글 select
	public MyCharacter selecectMyChar(SqlSessionTemplate sqlSession, int characterNo) {
		return sqlSession.selectOne("myPageMapper.selecectMyChar",characterNo);
	}

	//글 파일 select
	public ArrayList<MyCharacterAttach> selectChaList(SqlSessionTemplate sqlSession, int characterNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMyCharList",characterNo);
	}

	
	public int updateMyChar(SqlSessionTemplate sqlSession, MyCharacter cha, ArrayList<MyCharacterAttach> newlist) {
	  
	  //System.out.println("Dao 캐릭터객체 넘?"+cha);	
		System.out.println("Dao파일수정리스트"+newlist);
		
	  //글수정
	  int result= sqlSession.update("myPageMapper.updateMyChar", cha);	
	  System.out.println("Dao글수정확인"+result);
	 	
	  int result1=1;
	  
	  //글수정이 되었으면 파일수정
	  if(result>0) {
	     for( MyCharacterAttach mca : newlist) {
	    	 result1*=sqlSession.insert("myPageMapper.updateMyCharAttach", mca);
	     }
	  }	
	  
	  System.out.println("Dao파일수정확인"+result1);
	  return result*result1;
		
	}


	//글 삭제
	public int deleteMyChar(SqlSessionTemplate sqlSession, int characterNo) {
		return sqlSession.delete("myPageMapper.deleteMyChar",characterNo);
	}

	//첨부파일 삭제
	public int deleteMyCharAttach(SqlSessionTemplate sqlSession, int characterNo) {
		return sqlSession.update("myPageMapper.deleteMyCharAttach",characterNo);
	}

	
	//1.주문상세보기 리스트(주문번호)
	public ArrayList<OrderDetail> orderDetail(SqlSessionTemplate sqlSession, int orderNo){
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectOrderDetail",orderNo);
		
	}
	
	//2.주문상세보기(주문번호) join
	public MyOrderDetail myOrderDetail(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("myPageMapper.selectMyOrderDetail",orderNo);
	}

	//주문번호 얻기용 
	public OrderDetail selectOrderDetail(SqlSessionTemplate sqlSession, int odNo) {
		
		return sqlSession.selectOne("myPageMapper.selectOnoFromOrderDetail");
	}
	
	//배송조회
	public DeliveryDetail selectDeliveryDetail(SqlSessionTemplate sqlSession, OrderDetail od) {
		
		return sqlSession.selectOne("myPageMapper.selectDeliveryDetail", od);
		
	}

	
	//1. (기간별)주문리스트조회  주문번호뽑기용
	public ArrayList<Order> selectOrderListView(SqlSessionTemplate sqlSession, OrderListByDate olByd) {
		
		//주문리스트
		return (ArrayList)sqlSession.selectList("myPageMapper.selectOrderListView", olByd);
		
	}

	//2. 실제 주문리스트조회 
	public MyOrderDetail selectRealOrderListView(SqlSessionTemplate sqlSession, int orderNo) {
		
		//주문리스트
		return sqlSession.selectOne("myPageMapper.selectRealOrderListView",orderNo);
		
	}
	
	
	//장바구니 조회
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, int memberNo) {
		
	   return (ArrayList)sqlSession.selectList("cartMapper.selectCartList",memberNo);
		
	}

	
	//찜하기 조회
	public ArrayList<WishGoods> selectWishList(SqlSessionTemplate sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectWishList",memberNo);
	
	}

	//찜하기 삭제
	public int deleteWishList(SqlSessionTemplate sqlSession, Wish wish) {
		
		return sqlSession.delete("myPageMapper.deleteWishList",wish);
		
	}

	//캐릭터별 좋아요 데이터
	public ArrayList<MyCharacterData> dataSelect(SqlSessionTemplate sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectDataList",memberNo);
	
	}

	//1. 카트 상품 추가: 카트에 상품있는지 확인
	public boolean findCartGoods(SqlSessionTemplate sqlSession, Cart cart) {
		
		 String result=sqlSession.selectOne("myPageMapper.findCartGoods",cart) ;
		 
		 return Boolean.parseBoolean(result);
		 
	}

	//2. 카트 상품추가:실제 INSERT
	public void addCartGoods(SqlSessionTemplate sqlSession, Cart cart) {
		sqlSession.insert("myPageMapper.addCartGoods",cart) ;
	}


	//카트 수량변경
	public int updateCartCount(SqlSessionTemplate sqlSession,Cart cart) {
		return sqlSession.update("myPageMapper.updateCartCount",cart);
	}
	
	
}
