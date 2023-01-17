package com.kh.ccc.shop.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ccc.member.model.vo.Member;
import com.kh.ccc.shop.cart.model.service.CartService;
import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.order.model.service.OrderService;
import com.kh.ccc.shop.order.model.vo.InsertOrder;
import com.kh.ccc.shop.order.model.vo.Order;
import com.kh.ccc.shop.shipping.model.service.ShippingService;
import com.kh.ccc.shop.shipping.model.vo.AddressInfo;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ShippingService shippingService;
	
	@RequestMapping(value="insert.or")
	public String insertOrder(Model model, HttpSession session, int aiNo, String cnoArr) {
		
		System.out.println("insert.or:: cnoArr = " + cnoArr);
		System.out.println("aiNo : "+aiNo);
		
		// 주문시 할 것
		// 		1. Order insert
		//		- Order : 주문한 회원번호 / 배송비 번호 / 주문일자 / 최종결제금액 / STATUS
		//				    송장번호 / 수신자명 / 배송주소 / 배송상세주소 / 우편번호 / 배송메세지 / 수신자 전화번호 / 택배사  / 배송상태
		//		2. OrderDetail insert
		//		- OrderDetail : 위에서 넣은 주문번호 / 굿즈 번호 / 굿즈 가격 / 굿즈 수량 / 옵션1 / 옵션2 
		//		3. payment insert
		//		- Payment : 위에서 넣은 주문번호 / 주문방식 번호 / 할부개월수 / 결제 금액 / 결제일자 / 결제한 사람 이름(입금자명) / 은행 / STATUS
		
		// 카트번호 리스트를 받아서 카트로 주문한 품목 조회
		ArrayList<Integer> cnoList = new ArrayList<>();
		String[] cnoArray = cnoArr.split(",");
		for(int i=0; i<cnoArray.length; i++) {
//			System.out.println("insert.or :: cnoArr : " + cnoArr[i]);
			cnoList.add(Integer.parseInt(cnoArray[i]));
		}
		ArrayList<Cart> clist = cartService.selectCartListBycnoList(cnoList);
		System.out.println("insert.or :: clist : " + clist);
		
		// 주문정보 담기
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("insert.or:: loginUser = " + loginUser);
		AddressInfo ai = new AddressInfo();
		
		// 배송지 번호를 받아서 배송지 정보 조회
		if(aiNo >0) {
			ai = shippingService.selectAddressInfoByAddrNo(aiNo);
		}
		else {
			ai.setAddress(loginUser.getMemberAddress());
			ai.setReceiverName(loginUser.getMemberName());
			ai.setPhone(loginUser.getMemberPhone());
		}
		System.out.println("insert.or :: ai : " + ai);
		
		
		Order o = new Order();
		o.setMemberNo(loginUser.getMemberNo());
		o.setDeliveryNo(1);	//일단 그냥 서울(2500원) 1번으로 설정
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000); // 5자리 랜덤값
		String invoiceNo = currentTime+ranNum;
		int orderFinalAmount = 2500;
		for(Cart c : clist) {
			orderFinalAmount += c.getGoodsPrice()*c.getQuantity();
		}
		System.out.println("insert.or :: 총 결제 금액 = "+orderFinalAmount);
		o.setOrderFinalAmount(orderFinalAmount);
		o.setOrderInvoiceNo(invoiceNo);
		o.setOrderReceiverName(ai.getReceiverName());
		o.setOrderAddress(ai.getAddress());
		o.setOrderAddressDetail(ai.getAddressDetail());
		o.setOrderZipCode(ai.getZipCode());
		o.setOrderComment(ai.getComment());
		o.setOrderPhone(ai.getPhone());
		o.setOrderPackage("우체국");		// 일단 우체국으로 통일
		o.setOrderDetailStatus("R");	// 배송준비
		System.out.println("insert.or :: order = "+o);
		
		InsertOrder io = new InsertOrder(o, clist);
		
		// 주문정보 등록
		int insertOrderResult = orderService.insertOrder(io);
		if(insertOrderResult > 0) {
			session.setAttribute("alertMsg", "주문이 되었습니다.");
			System.out.println("주문등록 성공");
		}
		else {
			session.setAttribute("errorMsg", "주문에 실패하였습니다.");
			System.out.println("주문등록 실패");
		}
		
		return "redirect:/goodsMain.go";
	}
}
