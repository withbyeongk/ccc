package com.kh.ccc.shop.shipping.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ccc.member.model.vo.Member;
import com.kh.ccc.shop.shipping.model.service.ShippingService;
import com.kh.ccc.shop.shipping.model.vo.AddressInfo;

@Controller
public class ShippingController {

	@Autowired
	private ShippingService shippingService;
	
	@RequestMapping("shipping.go")
	public String goPopup(HttpSession session, Model model, HttpServletRequest request) {
//		System.out.println("address.sh::");
		Member loginUser = (Member)session.getAttribute("loginUser");
//		System.out.println("infoInsert.sh :: loginUser : " + loginUser);
		
		// 해당 회원의 배송지 정보를 조회
		ArrayList<AddressInfo> aiList = shippingService.selectListAddressInfo(loginUser.getMemberNo());
		System.out.println("shipping.go :: aiList : " + aiList);
		model.addAttribute("aiList", aiList);
		
		return "shop/shipping/shippingMain";
	}
	
	@RequestMapping("infoUpdateForm.sh")
	public String goAddressUpdateForm(HttpSession session, Model model, int addressInfoNo) {
		System.out.println("infoUpdateForm.sh :: addressInfoNo : " + addressInfoNo);
		
		AddressInfo ai = shippingService.selectAddressInfoByAddrNo(addressInfoNo);
//		System.out.println("infoUpdateForm.sh :: ai : " + ai);
		model.addAttribute("ai", ai);
		
		return "shop/shipping/shippingUpdate";
	}
	
	@RequestMapping("infoInsertForm.sh")
	public String addressInfoInsertForm(HttpSession session, Model model) {
//		System.out.println("infoInsertForm.sh");
		
		return "shop/shipping/shippingInsert";
	}
	
	@RequestMapping("infoInsert.sh")
	public String addressInfoInsert(HttpSession session, Model model, HttpServletRequest request, AddressInfo ai, String basicChk) {
		Member loginUser = (Member)session.getAttribute("loginUser");
//		System.out.println("infoInsert.sh :: loginUser : " + loginUser);
		System.out.println("infoInsert.sh :: ai : " + ai);
		System.out.println("infoInsert.sh :: basicChk : " + basicChk);
		
		// 현재 회원이 가진 배송지 수가 5개이하이면 추가, 아니면 추가가 안되도록
		
		
		// 추가할 배송지 정보 객체에 담기
		ai.setMemberNo(loginUser.getMemberNo());
		ai.setMemberName(loginUser.getMemberName());
		if(basicChk != null) {
//			System.out.println("basicChk : null 아님 : " + basicChk);
			ai.setStatus("Y");	// 기본배송지로 설정
			

			// 초기에 배송지가 없을 때 예외처리
			ArrayList<AddressInfo> aiList = shippingService.selectListAddressInfo(loginUser.getMemberNo());
			if(aiList.size() > 1) {
				// 기본 배송지는 하나여야 하므로 나머지 배송지의 state를 'N'으로 변경
				int updateResult = shippingService.changeState(loginUser.getMemberNo());
				if(updateResult == 0) {
//				System.out.println("DB의 배송지 전부 N으로 변경 실패");
					String referer = request.getHeader("Referer");
					return "redirect:"+ referer;
				}
//				else {
//					System.out.println("DB의 배송지 전부 N으로 변경 성공");
//				}
			}
			
		}
		else {
//			System.out.println("basicChk : null임 : " + basicChk);
			ai.setStatus("N");	// 기본배송지가 아닌 채로 추가
		}
		System.out.println("infoInsert.sh :: ai : " + ai);
		
		// DB에 추가
		int insertResult = shippingService.insertAddressInfo(ai);
		System.out.println("infoInsert.sh :: insertResult : " + insertResult);
		if(insertResult > 0) {
//			System.out.println("DB에 배송지 추가 성공");
		    return "redirect:/shipping.go";
		}
		else {
//			System.out.println("DB에 배송지 추가 실패");
			String referer = request.getHeader("Referer");
		    return "redirect:"+ referer;
		}
	}
	
	@RequestMapping("infoUpdate.sh")
	public String updateAddressInfo(HttpSession session, HttpServletRequest request, Model model, AddressInfo ai, String basicChk) {
		System.out.println("infoUpdate.sh :: AddressInfo : " + ai + " basicChk : " + basicChk);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("infoUpdate.sh :: loginUser : " + loginUser);
		
		// 추가할 배송지 정보 객체에 담기
		ai.setMemberNo(loginUser.getMemberNo());
		ai.setMemberName(loginUser.getMemberName());
		if(basicChk != null) {
			System.out.println("basicChk : null 아님 : " + basicChk);
			ai.setStatus("Y");	// 기본배송지로 설정
			
			// 초기에 배송지가 없을 때 예외처리
			ArrayList<AddressInfo> aiList = shippingService.selectListAddressInfo(loginUser.getMemberNo());
			if(aiList.size() > 1) {
				// 기본 배송지는 하나여야 하므로 나머지 배송지의 state를 'N'으로 변경
				int updateResult = shippingService.changeState(loginUser.getMemberNo());
				if(updateResult == 0) {
					System.out.println("DB의 배송지 전부 N으로 변경 실패");
					String referer = request.getHeader("Referer");
					return "redirect:"+ referer;
				}
//				else {
//					System.out.println("DB의 배송지 전부 N으로 변경 성공");
//				}
			}
			
		}
		else {
//			System.out.println("basicChk : null임 : " + basicChk);
			ai.setStatus("N");	// 기본배송지가 아닌 채로 추가
		}
		System.out.println("infoUpdate.sh :: ai : " + ai);
		
		// DB에 업데이트
		int insertResult = shippingService.updateAddressInfo(ai);
		if(insertResult > 0) {
//			System.out.println("DB에 배송지 추가 성공");
			
		    return "redirect:/shipping.go";
		}
		else {
			System.out.println("DB에 배송지 추가 실패");
			String referer = request.getHeader("Referer");
		    return "redirect:"+ referer;
		}
	}
	
	@RequestMapping("deleteAddressInfo.sh")
	public String deleteAddressInfo(HttpSession session, Model model, HttpServletRequest request, int addressNo) {
		System.out.println("deleteAddressInfo.sh::");
		
		int result = shippingService.deleteAddressInfo(addressNo);
		if(result == 0) {
			System.out.println("배송주소 삭제 실패 : result = " +result);
			String referer = request.getHeader("Referer");
		    return "redirect:"+ referer;
		}
		
		return "redirect:/shipping.go";
	}
}
