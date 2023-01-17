package com.kh.ccc.shop.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ccc.member.model.vo.Member;
import com.kh.ccc.shop.cart.model.service.CartService;
import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.goods.model.service.GoodsService;
import com.kh.ccc.shop.goods.model.vo.Goods;
import com.kh.ccc.shop.goods.model.vo.Wish;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired 
	private GoodsService goodsService;

	@RequestMapping("cart.ca")
	public String goCart(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
//		System.out.println("cart.ca:: loginUser : " + loginUser);
		
		// 해당 회원의 장바구니 조회
		ArrayList<Cart> clist = cartService.selectCartList(loginUser.getMemberNo());
		clist = cartService.selectCartList(loginUser.getMemberNo());
//		System.out.println("cart.ca:: clist : " + clist);
		
		model.addAttribute("clist", clist);
		
		return "shop/cart";
	}
	
	@ResponseBody
	@RequestMapping(value="changeQuantity.ca", produces="text/html; charset=UTF-8")
	public String updateCartChangeQuantity(HttpSession session, int cartNo, int quantity) {
		String responseData = "응답 데이터 : "+cartNo+"번 상품을 "+quantity+"개로 변경.";
//		System.out.println(responseData);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Cart c = new Cart();
		c.setMemberNo(loginUser.getMemberNo());
		c.setCartNo(cartNo);
		c.setQuantity(quantity);
//		System.out.println("changeQuantity.ca:: c : " + c);
		
		// 장바구니에서 해당 상품의 수량 변경
		int result = cartService.updateCartChangeQuantity(c);
		
		return responseData;
	}
	
	
	// 관심 상품 확인
	@ResponseBody
	@RequestMapping(value="checkWish.ca")
	public String checkWish(HttpSession session, Model model, int cartNo) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// cartNo로 goodsNo 조회
		Cart cart = cartService.selectCart(cartNo);
		
		Wish w = new Wish();
		w.setMemberNo(loginUser.getMemberNo());
		w.setGoodsNo(cart.getGoodsNo());
		
		// 관심상품 등록
		int result = cartService.checkWish(w);
//		System.out.println("checkWish:: result : " + result);
		
		if(result > 0) {
			return "1";
		}
		else {
			return "0";
		}
	}
	
	// 관심 상품 추가
	@ResponseBody
	@RequestMapping(value="addWish.ca")
	public String addWish(HttpSession session, Model model, int cartNo) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// cartNo로 goodsNo 조회
		Cart cart = cartService.selectCart(cartNo);
		
		Wish w = new Wish();
		w.setMemberNo(loginUser.getMemberNo());
		w.setGoodsNo(cart.getGoodsNo());
		
		// 관심상품 등록
		int result = cartService.insertWish(w);
//		System.out.println("addWish:: result : " + result);
		
		if(result > 0) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	// 관심 상품 삭제
	@ResponseBody
	@RequestMapping(value="removeWish.ca")
	public String removeWish(HttpSession session, Model model, int cartNo) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// cartNo로 goodsNo 조회
		Cart cart = cartService.selectCart(cartNo);
		
		Wish w = new Wish();
		w.setMemberNo(loginUser.getMemberNo());
		w.setGoodsNo(cart.getGoodsNo());
		
		// 관심상품 등록
		int result = cartService.removeWish(w);
//		System.out.println("removeWish:: result : " + result);
		
		if(result > 0) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	// 장바구니에서 굿즈 삭제
	@ResponseBody
	@RequestMapping(value="deleteGoodsInCart.ca")
	public String deleteGoodsInCart(HttpSession session, Model model, int cartNo) {
		int result = cartService.deleteGoodsInCart(cartNo);		
		
		if(result > 0 ) {
//			System.out.println("DB에서 장바구니 항목 삭제 성공");
			return "1";
		}
		else {
//			System.out.println("DB에서 장바구니 항목 삭제 실패");
			return "0";
		}
	}
	
	// 장바구니에서 체크한 굿즈 삭제
	@ResponseBody
	@RequestMapping(value="deleteCheckGoodsInCart.ca")
	public String deleteCheckGoodsInCart(HttpSession session, Model model
			, @RequestParam(value="chkArr[]") List<Integer> chkArr) {
		
//		System.out.println("deleteCheckGoodsInCart:: chkArr : " + chkArr);
//		System.out.println(chkArr.get(0));
//		System.out.println(chkArr.get(1));
//		System.out.println(chkArr.get(2));
		
		int result = cartService.deleteGoodsInCart(chkArr);
		
		if(result > 0 ) {
//			System.out.println("DB에서 장바구니 선택 삭제 성공");
			return "1";
		}
		else {
//			System.out.println("DB에서 장바구니 선택 삭제 실패");
			return "0";
		}
	}
	
	@RequestMapping(value="buyGoods.ca")
	public String buyGoods(HttpSession session, Model model, int cartNo) {
		
		// 구매페이지에 자동으로 띄울 정보 갖고 오기
		/*
		 * 구매자 정보 : 이름 / 이메일 / 전화번호
		 * 
		 * 받을 사람 정보 : 이름 / 기본배송지 / 배송주소 / 연락처 / 배송 요청사항
		 * 
		 * 상품 정보 : 상품명 / 수량 / 가격
		 * 
		 * 결제 정보 : 총 상품가격 / 배송비 / 총 결제금액 / 결제 방법 / 
		 *  
		 */
		
		// 구매자 정보
		Member loginUser = (Member)session.getAttribute("loginUser");
//		System.out.println("buyGoods:: loginUser : " + loginUser);
		
		// cartNo로 구매할 굿즈번호와 수량 정보 조회
		Cart cart = cartService.selectCart(cartNo);
		ArrayList<Cart> clist = new ArrayList<>();
		clist.add(cart);
		model.addAttribute("clist", clist);
//		System.out.println("buyGoods.ca :: cart : " + cart);
		
		// 상품 총 합계 계산
		int totalPrice = 0;
		
		totalPrice += cart.getQuantity() * cart.getGoodsPrice();
		
		model.addAttribute("totalPrice", totalPrice);
//		System.out.println("buyGoods.ca :: totalPrice : " + totalPrice);
		
		/* 구매한 만큼 상품 재고 갱신-> 추후 결제 완료 시 삭제하는 것으로 변경할 것
		int resultUpdateStock = cartService.updateStock(cart);
		
		if(resultUpdateStock > 0 ) {
			System.out.println("DB에서 구매한 항목 재고 업데이트 성공");
		}
		else {
			System.out.println("DB에서 구매한 항목 재고 업데이트 실패");
		}*/
		
		/* DB에서 장바구니 항목 삭제 -> 추후 결제 완료 시 삭제하는 것으로 변경할 것
		int resultDeleteCart = cartService.deleteGoodsInCart(cartNo);		
		
		if(resultDeleteCart > 0 ) {
			System.out.println("DB에서 장바구니 항목 삭제 성공");
		}
		else {
			System.out.println("DB에서 장바구니 항목 삭제 실패");
		}*/
		
		return "shop/purchaseForm";
	}
	
	// 선택한 항목 주문과 전체 주문 처리
	@RequestMapping(value="buyManyGoods.ca")
	public String buyManyGoods(HttpSession session, Model model, String cartNoArr) {
		//깃헙테스트주석
		ArrayList<Integer> cnoList = new ArrayList<>();
		String[] cnoArr = cartNoArr.split(",");
		for(int i=0; i<cnoArr.length; i++) {
//			System.out.println("buyManyGoods.ca :: cnoArr : " + cnoArr[i]);
			cnoList.add(Integer.parseInt(cnoArr[i]));
		}
//		System.out.println("buyManyGoods.ca :: cnoList : " + cnoList);
		
		// 구매페이지에 자동으로 띄울 정보 갖고 오기
		/*
		 * 구매자 정보 : 이름 / 이메일 / 전화번호
		 * 
		 * 받을 사람 정보 : 이름 / 기본배송지 / 배송주소 / 연락처 / 배송 요청사항
		 * 
		 * 상품 정보 : 상품명 / 수량 / 가격
		 * 
		 * 결제 정보 : 총 상품가격 / 배송비 / 총 결제금액 / 결제 방법 / 
		 *  
		 */
		
		// 구매자 정보
		Member loginUser = (Member)session.getAttribute("loginUser");
//		System.out.println("buyManyGoods:: loginUser : " + loginUser);

		// cartNo로 구매할 굿즈번호와 수량 정보 조회
		ArrayList<Cart> clist = cartService.selectCartListBycnoList(cnoList);
		model.addAttribute("clist", clist);
//		System.out.println("buyManyGoods.ca :: clist : " + clist);
		
		// 상품 총 합계 계산
		int totalPrice = 0;
		
		for(int i=0; i<clist.size(); i++) {
			totalPrice += clist.get(i).getQuantity() * clist.get(i).getGoodsPrice();
		}
		
		model.addAttribute("totalPrice", totalPrice);
//		System.out.println("butManyGoods.ca :: totalPrice : " + totalPrice);
		
		/* 구매한 만큼 상품 재고 갱신  -> 추후 최종 주문 완료 시 장바구니에서 삭제하는 것으로 변경할 것
		int resultUpdateStock = cartService.updateStock(clist);
		
		if(resultUpdateStock > 0 ) {
			System.out.println("DB에서 구매한 항목 재고 업데이트 성공");
		}
		else {
			System.out.println("DB에서 구매한 항목 재고 업데이트 실패");
		}*/
		
		/* DB에서 장바구니 항목 삭제 -> 추후 최종 주문 완료 시 장바구니에서 삭제하는 것으로 변경할 것
		int resultDeleteCart = cartService.deleteGoodsInCart(cnoList);		
		
		if(resultDeleteCart > 0 ) {
			System.out.println("DB에서 장바구니 항목 삭제 성공");
		}
		else {
			System.out.println("DB에서 장바구니 항목 삭제 실패");
		}*/
		
		return "shop/purchaseForm";
	}

	@RequestMapping(value="buyGoodsDirect.go")
	public String buyGoodsDirect(HttpSession session, Model model
			, @RequestParam(value="qtt", defaultValue="1") int quantity, int gno) {
		
		System.out.println("buyGoodsDirect.go:: gno = "+gno);
		System.out.println("buyGoodsDirect.go:: quantity = "+quantity);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Cart c = new Cart();
		c.setGoodsNo(gno);
		c.setQuantity(quantity);
		c.setMemberNo(loginUser.getMemberNo());
		int result1 = cartService.selectCartByGnoMno(c);
		int result = 0;
		if(result1==0) {
			result = cartService.insertCart(c);
		}

		c = cartService.selectCartByGoodsNo(gno);
		System.out.println("카트 정보 : "+c);
		if(result > 0) {
			System.out.println("구매할 굿즈 장바구니 등록 성공");
		}
		else {
			System.out.println("구매할 굿즈 장바구니 등록 실패");
		}
		return "redirect:/buyGoods.ca?cartNo="+c.getCartNo();
	}
	
	// 관심 상품 확인
	@ResponseBody
	@RequestMapping(value="addCartByGno.ca")
	public String addCartByGno(HttpSession session, Model model
			, @RequestParam(value="qtt", defaultValue="1") int quantity, int gno) {
		
		System.out.println("addCartByGno.go:: gno = "+gno);
		System.out.println("addCartByGno.go:: quantity = "+quantity);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Cart c = new Cart();
		c.setGoodsNo(gno);
		c.setQuantity(quantity);
		c.setMemberNo(loginUser.getMemberNo());
		int result1 = cartService.selectCartByGnoMno(c);
		int result = 0;
		if(result1==0) {
			result = cartService.insertCart(c);
		}
		
		if(result > 0) {
			System.out.println("카트에 굿즈 추가 성공");
			return "1";
		}
		else {
			System.out.println("카트에 굿즈가 이미 있음");
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="addWishByGno.ca")
	public String addWishByGno(HttpSession session, Model model, int gno) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Wish w = new Wish();
		w.setMemberNo(loginUser.getMemberNo());
		w.setGoodsNo(gno);
		
		int checkResult = cartService.checkWish(w);
		if(checkResult > 0) {
			cartService.removeWish(w);
			return "0";
		}
		else {
			cartService.insertWish(w);
			return "1";
		}
	}
	
	@RequestMapping(value="wish.ca")
	public String goWishList(HttpSession session, Model model) {
//		System.out.println("진입 wish.ca");
		
		return "";
	}
}
