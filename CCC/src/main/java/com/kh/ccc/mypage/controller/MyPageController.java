package com.kh.ccc.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ccc.member.model.vo.Member;
import com.kh.ccc.mypage.model.service.MyPageService;
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

@Controller
public class MyPageController {

	@Autowired
	private MyPageService mypageService;

	// 마이페이지 조회
	@RequestMapping("mypage.me")
	public String myPage(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();

		ArrayList<MyOrderDetail> realoList = mypageService.selectOrderListView(memberNo);
		System.out.println("ddd"+realoList);

		model.addAttribute("realoList", realoList);

		return "mypage/mypage";
	}

	// 마이페이지 내정보 조회
	@RequestMapping("profileEnroll.me")
	public String profile() {

		// 내 캐릭터정보도 가져와서 뿌려줌
		return "mypage/profile";
	}

	////////////////////////////// 기존 내 캐릭터영역
	// 내 캐릭터 목록조회
	// @RequestMapping("list.mychar")
	// public ModelAndView selectMychaList(HttpSession session, ModelAndView mv) {
	//
	// System.out.println("11111");
	//
	// // 사용자번호를 가지고 내캐릭터 목록조회
	// Member loginUser = (Member) session.getAttribute("loginUser");
	// int mNo = loginUser.getMemberNo();
	//
	// // ~글리스트,파일리스트 join해서 조회
	// ArrayList<MyCharacter> chalist = mypageService.selectchaList(mNo);
	//
	// // <<리스트
	// mv.addObject("chalist",chalist).setViewName("mypage/myCharList2");
	// System.out.println(chalist);
	//
	// return mv;
	// }

	// 내 캐릭터
	// 영역----------------------------------------------------------------------------------------------
	// 내 캐릭터 목록조회
	@RequestMapping("list.mychar2")
	public ModelAndView selectMychaList(HttpSession session, ModelAndView mv) {

		// 사용자번호를 가지고 내캐릭터 목록조회
		Member loginUser = (Member) session.getAttribute("loginUser");
		int mNo = loginUser.getMemberNo();

		// ~글리스트,파일리스트 join해서 조회
		ArrayList<MyCharacter> chalist = mypageService.selectchaList(mNo);

		// <<리스트
		mv.addObject("chalist", chalist).addObject("loginUser", loginUser).setViewName("mypage/myCharList2");
		System.out.println(chalist);
		return mv;
	}

	// 마이캐릭터 업로드폼으로 이동
	@RequestMapping("enrollForm.mychar")
	public String myCharpage3() {

		return "mypage/myCharEnrollForm";
	}

	// 다중첨부파일 입력- 타이틀이미지는 따로 받아줌 upfileList 새로 올라오는 파일
	@RequestMapping("insert.mychar")
	public ModelAndView mycharInsert(MyCharacter cha, ModelAndView mv, MultipartFile titleImg,
			@RequestParam(value = "upfileList", required = false) List<MultipartFile> upfileList, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int mNo = loginUser.getMemberNo();

		ArrayList<MyCharacterAttach> mchalist = new ArrayList<>(); // 담아줄 파일 ArrayList

		// 썸네일 첨부파일
		if (!titleImg.getOriginalFilename().equals("")) {// 파일 업로드가 되었다면

			// 아래에서 모듈화 시킨 saveFile 메소드 활용
			String titleChangeName = saveFile(titleImg, session);
			MyCharacterAttach mca = new MyCharacterAttach();

			// 원본명,서버에 업로드한 경로를 기존객체에 담아주기
			mca.setOriginName(titleImg.getOriginalFilename());
			mca.setChangeName("resources/myPage/myChar/" + titleChangeName);
			mca.setMyCharAttachLevel(1);// 레벨1로 처리
			mchalist.add(mca);
		}

		// 일반첨부파일 처리과정
		for (int i = 0; i < upfileList.size(); i++) {
			if (!upfileList.get(i).getOriginalFilename().equals("")) { // 만약 올라오는 파일이 있다면

				// System.out.println("파일리스트 원본명 출력"+upfileList.get(i).getOriginalFilename());
				String changeName = saveFile(upfileList.get(i), session); // 수정명 모듈화 메소드로 구해줌

				// 파일객체 생성(원본명,수정명,파일레벨 설정해준다.)
				MyCharacterAttach mca = new MyCharacterAttach();

				mca.setOriginName(upfileList.get(i).getOriginalFilename()); // 원본명
				mca.setChangeName("resources/myPage/myChar/" + changeName); // 파일경로=실제경로+수정
				mca.setMyCharAttachLevel(2); // 일반첨부파일
				mchalist.add(mca); // 리스트에 담아서 가져가준다.
			}
		}

		cha.setMemberNo(loginUser.getMemberNo());

		// 게시물과 파일리스트를 가지고 요청처리(INSERT)
		int result = mypageService.mycharInsert(cha, mchalist);

		if (result > 0) {

			session.setAttribute("alsertMsg", "내 캐릭터 등록완료");

			// 멤버번호로 파일리스트조회
			ArrayList<MyCharacter> chalist = mypageService.selectchaList(mNo);

			mv.addObject("chalist", chalist).setViewName("mypage/myCharList2"); // 내캐릭터 페이지로 보내줌

		} else {
			mv.addObject("errorMsg", "문의글 등록실패").setViewName("common/errorPage");
		}

		return mv;
	}

	// 상세보기
	// 목록에서 특정캐릭터를 누르면 캐릭터번호를 가지고 조회수 증가후에 게시글 정보와 파일정보ArrayList를 가져와준다.
	@RequestMapping("chardetail.my")
	public ModelAndView detailMyChar(@RequestParam(value = "characterNo") int characterNo, ModelAndView mv) {

		// System.out.println("번호"+characterNo);
		MyCharacter cha = mypageService.selecectMyChar(characterNo); // 게시글조회

		ArrayList<MyCharacterAttach> mchalist = mypageService.selectChaList(characterNo); // 게시글 파일리스트조회

		MyCharacterAttach ml = new MyCharacterAttach();
		ml.setOriginName(mchalist.get(0).getOriginName());

		mv.addObject("cha", cha).addObject("mchalist", mchalist).setViewName("mypage/myCharDetail");

		return mv;
	}

	// 수정폼이동 (SELECT)
	@RequestMapping("updateForm.my")
	public String updateFormMychar(@RequestParam(value = "cNo") int characterNo, Model model) {

		// ~게시글,파일리스트 SELECT(cNo를 가지고가서)
		MyCharacter cha = mypageService.selecectMyChar(characterNo);
		ArrayList<MyCharacterAttach> mchalist = mypageService.selectChaList(characterNo);

		// <<게시글 파일리스트
		model.addAttribute("cha", cha);
		model.addAttribute("mchalist", mchalist);

		return "mypage/myCharUpdateForm";
	}

	// 실제수정과정
	@RequestMapping("update.my")
	public ModelAndView updateMyChar(MyCharacter cha, MultipartFile titleImg,
			@RequestParam(value = "upfileList") List<MultipartFile> upfileList, HttpSession session, ModelAndView mv) {

		// 해당 캐릭터번호로 기존파일리스트 조회
		int characterNo = cha.getCharacterNo();

		// ~해당 게시글의 기존파일리스트
		ArrayList<MyCharacterAttach> oldList = mypageService.selectChaList(characterNo);
		// System.out.println("실제수정 기존파일리스트"+mchalist);
		// System.out.println("실제수정 새로운 수정파일"+upfile);

		// 수정 파일리스트 담을 곳
		ArrayList<MyCharacterAttach> newList = new ArrayList<>();

		// 새썸네일파일이 있다면
		if (!titleImg.getOriginalFilename().equals("")) {// 파일 업로드가 되었다면

			// 아래에서 모듈화 시킨 saveFile 메소드 활용
			String titleChangeName = saveFile(titleImg, session);
			MyCharacterAttach mca = new MyCharacterAttach();

			// 원본명,서버에 업로드한 경로를 기존객체에 담아주기
			mca.setOriginName(titleImg.getOriginalFilename());
			mca.setChangeName("resources/myPage/myChar/" + titleChangeName);
			mca.setMyCharAttachLevel(1);// 레벨1로 처리
			mca.setCharacterNo(characterNo);// 캐릭터번호
			newList.add(mca);
		}

		// 새첨부파일이 있다면
		if (!upfileList.get(0).getOriginalFilename().equals("")) {

			// 기존첨부파일 리스트의 수만큼 기존첨부파일 삭제해줌
			for (int i = 0; i < oldList.size(); i++) {
				if (oldList.get(i).getOriginName() != null) {
					new File(session.getServletContext().getRealPath(oldList.get(i).getChangeName())).delete();
				}
			}

			// 새첨부파일이 올라온 수만큼 파일객체생성후에 담을용으로 만든 list에 넣어주기
			for (int i = 0; i < upfileList.size(); i++) {

				// 담아줄 파일객체 생성
				MyCharacterAttach mca = new MyCharacterAttach();

				// 수정파일명 구해줌
				String changeName = saveFile(upfileList.get(i), session);

				// 참조캐릭터번호,원본파일명,체인지파일명,파일레벨
				mca.setCharacterNo(characterNo);
				mca.setOriginName(upfileList.get(i).getOriginalFilename());
				mca.setChangeName("resources/myPage/myChar/" + changeName);
				mca.setMyCharAttachLevel(2);
				mca.setCharacterNo(characterNo);
				newList.add(mca);
			}

		}

		// ~게시글과 담을리스트에 넣어서 요청처리
		int result = mypageService.updateMyChar(cha, newList);
		// System.out.println("6시 요청결과"+result);

		if (result != 0) {
			session.setAttribute("alertMsg", "게시글 수정성공");
			mv.setViewName("redirect:/chardetail.my?cNo=" + characterNo);

		} else {
			mv.addObject("errorMsg", "게시글 수정에 실패했습니다").setViewName("common/errorPage");
		}

		// 객체를 넣어줘서 update
		return mv;
	}

	// 마이캐릭터 삭제
	@RequestMapping("delete.my")
	public String delteMyChar(@RequestParam(value = "cNo") int characterNo, HttpSession session, Model model) {

		// ~해당 캐릭터글의 첨부파일 리스트를 가져와
		ArrayList<MyCharacterAttach> mchalist = mypageService.selectChaList(characterNo);

		// 게시글 번호의 글과 첨부파일을 삭제하는 메소드
		int result = mypageService.delteMyChar(characterNo);

		if (result != 0) {
			for (int i = 0; i < mchalist.size(); i++) { // 첨부파일리스트의 수만큼 반복해줘. 첨부파일리스트가 있다면
				if (!mchalist.get(i).equals("")) {
					// 수정첨부파일의 물리적경로를 구한뒤 파일을 생성해서 지워줌
					String realPath = session.getServletContext().getRealPath(mchalist.get(i).getChangeName());
					new File(realPath).delete();
				}
			}
			session.setAttribute("alertMsg", "게시글 삭제에 성공했습니다!");
		} else {
			model.addAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
			return "common/errorPage";
		}

		return "mypage/mypage";
	}

	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 메소드 (모듈)
	public String saveFile(MultipartFile upfile, HttpSession session) {
		// 1. 원본파일명 뽑기
		String originName = upfile.getOriginalFilename();
		// System.out.println(originName);
		// 2. 시간형식을 문자열로 뽑기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// System.out.println(currentTime);
		// 3. 뒤에 붙일 랜덤값 뽑기

		int ranNum = (int) (Math.random() * 90000 + 10000); // 5자리 랜덤값
		// System.out.println(ranNum);
		// 4. 원본 파일명으로부터 확장자명 뽑아오기
		String ext = originName.substring(originName.lastIndexOf("."));
		// System.out.println(ext);
		// 5. 뽑아놓은 값 전부 붙여서 파일명 만들기
		String changeName = currentTime + ranNum + ext;
		// System.out.println(changeName);
		// 6. 업로드 하고자 하는 실제 위치 경로 지정해주기 (실제 경로. 8번 changeName이랑 비교)
		String savePath = session.getServletContext().getRealPath("/resources/myPage/myChar/");
		// System.out.println(savePath);
		// 7. 경로와 수정파일명 합쳐서 파일을 업로드해주기
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}

	// 주문영역------------------------------------------------------------------------------------------------------
	// 기간별 주문내역 조회 단순이동
	@RequestMapping(value = "selectoListbyDate2.my")
	public String selectoListbyDate2(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();

		ArrayList<MyOrderDetail> realoList = mypageService.selectOrderListView(memberNo);
		// System.out.println("ddd"+realoList);
		model.addAttribute("realoList", realoList);

		return "mypage/selectoListbyDate2";

	}

	// 기간별주문내역 조회기능(버튼클릭시 날짜별로 출력)
	@ResponseBody
	@RequestMapping(value = "selectoListbyDate.my", produces = "application/json;charset=UTF-8")
	public ModelAndView selectoListbyDate(HttpSession session, int startDay, ModelAndView mv) {

		// System.out.println("startDay시작일"+startDay);

		Member loginUser = (Member) session.getAttribute("loginUser");
		int mNo = loginUser.getMemberNo(); // mNo나중에 memberNumber로 바꿔주기

		final int TODAY = 1; // 오늘
		final int ONE_WEEK = 2; // 일주일 전
		final int ONE_MONTH = 3; // 한 달 전
		final int THREE_MONTH = 4; // 3개월 전
		final int SIX_MONTH = 5; // 6개월 전

		Date dt = new Date();

		// 시작일
		String before = ""; // 시작 날짜문자열
		Calendar cal = null; // 캘린더객체
		Date startDate = null; // 시작일 객체

		// 끝일
		Date endDate = new Date(dt.getTime() + (1000 * 60 * 60 * 24));// 현재날짜+1일 함
		String after = new SimpleDateFormat("yyyy-MM-dd").format(endDate); // 마지막 날짜 문자열
		java.sql.Date endDatesql = java.sql.Date.valueOf(after);// sql끝일객체

		// 사용자번호,시작일,끝일 담을객체
		OrderListByDate tbd = new OrderListByDate(); // 시작일과 끝일과 사용자번호를 들고갈 객체

		// 조회해온 주문번호
		int oNo = 0;

		// 주문번호 받아오기용 주문리스트
		ArrayList<Order> oList = null; // 멤버번호,시작일객체,끝일객체 담아가서 담아올 주문리스트

		// 진짜주문객체
		MyOrderDetail selectbyDate= null;
		
		//주문객체를 담을 리스트
		//담을 ArrayList 선언후에 객체담아준다.
		ArrayList<MyOrderDetail> realoList=new ArrayList<MyOrderDetail>();
		

		switch (startDay) {

		case TODAY:
			// 시작일
			startDate = new Date(System.currentTimeMillis()); // util Date객체생성
			before = new SimpleDateFormat("yyyy-MM-dd").format(startDate); // 문자열로 변경
			java.sql.Date startDateSql = java.sql.Date.valueOf(before); // sql Date로 변경
			System.out.println("sql변경한뒤의 버튼주문조회 ::" + startDateSql + "~" + endDatesql + "까지 조회");

			// 시작일-끝일-사용자번호 담아줌
			tbd.setStartDate(startDateSql);
			tbd.setEndDate(endDatesql);
			tbd.setMemberNo(mNo);

			oList = mypageService.selectOrderListView(tbd);

			for (Order or : oList) {
				oNo = or.getOrderNo(); // 주문번호를 뽑아준다.
				System.out.println("주문번호"+oNo);
				
				selectbyDate = mypageService.selectRealOrderListView(oNo);
				System.out.println("객체결과!"+selectbyDate);
				
				realoList.add(selectbyDate);
			}
			
			System.out.println("리스트결과?" + realoList);
			
			mv.addObject("realoList", realoList).setViewName("mypage/mypageSelectOrderList");
			//System.out.println("결과" + selectbyDate);
			
			break;

		case ONE_WEEK:
			cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -7); // 일주일 전 캘린더객체

			// 캘린더 객체를 형식지정된 문자열로 변경
			before = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			// 일주일 전 날짜 스트링을 넣어서 Date타입으로 변경
			startDateSql = java.sql.Date.valueOf(before);

			tbd.setStartDate(startDateSql);
			tbd.setEndDate(endDatesql);
			tbd.setMemberNo(mNo);

			System.out.println("sql변경한뒤의 버튼주문조회 ::" + startDateSql + "~" + endDatesql + "까지 조회");

			oList = mypageService.selectOrderListView(tbd);
			
			for (Order or : oList) {
				oNo = or.getOrderNo(); // 주문번호를 뽑아준다.
				System.out.println("주문번호"+oNo);
				
				selectbyDate = mypageService.selectRealOrderListView(oNo);
				System.out.println("객체결과!"+selectbyDate);
				
				realoList.add(selectbyDate);
			}
			
			System.out.println("리스트결과?" + realoList);
			
			mv.addObject("realoList", realoList).setViewName("mypage/mypageSelectOrderList");

			break;

		case ONE_MONTH:
			cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, -1);
			before = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			// 일주일 전 날짜 스트링을 넣어서 Date타입으로 변경
			startDateSql = java.sql.Date.valueOf(before);

			tbd.setStartDate(startDateSql);
			tbd.setEndDate(endDatesql);
			tbd.setMemberNo(mNo);

			oList = mypageService.selectOrderListView(tbd);

			for (Order or : oList) {
				oNo = or.getOrderNo(); // 주문번호를 뽑아준다.
				System.out.println("주문번호"+oNo);
				
				selectbyDate = mypageService.selectRealOrderListView(oNo);
				System.out.println("객체결과!"+selectbyDate);
				
				realoList.add(selectbyDate);
			}
			
			System.out.println("리스트결과?" + realoList);
			
			mv.addObject("realoList", realoList).setViewName("mypage/mypageSelectOrderList");
			
			break;

		case THREE_MONTH:
			cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, -3);
			before = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime()); // 문자열타입을 yyyy MM dd형태로
			// 일주일 전 날짜 스트링을 넣어서 Date타입으로 변경
			startDateSql = java.sql.Date.valueOf(before);
			System.out.println("sql변경한뒤의 버튼주문조회 ::" + startDateSql + "~" + endDatesql + "까지 조회");

			tbd.setStartDate(startDateSql);
			tbd.setEndDate(endDatesql);
			tbd.setMemberNo(mNo);

			oList = mypageService.selectOrderListView(tbd);

			for (Order or : oList) {
				oNo = or.getOrderNo(); // 주문번호를 뽑아준다.
				System.out.println("주문번호"+oNo);
				
				selectbyDate = mypageService.selectRealOrderListView(oNo);
				System.out.println("객체결과!"+selectbyDate);
				
				realoList.add(selectbyDate);
			}
			
			System.out.println("리스트결과?" + realoList);
			
			mv.addObject("realoList", realoList).setViewName("mypage/mypageSelectOrderList");
			
			break;

		case SIX_MONTH:
			cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, -6);
			before = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			// 일주일 전 날짜 스트링을 넣어서 Date타입으로 변경
			startDateSql = java.sql.Date.valueOf(before);
			System.out.println("sql변경한뒤의 버튼주문조회 ::" + startDateSql + "~" + endDatesql + "까지 조회");

			tbd.setStartDate(startDateSql);
			tbd.setEndDate(endDatesql);
			tbd.setMemberNo(mNo);
			oList = mypageService.selectOrderListView(tbd);

			for (Order or : oList) {
				oNo = or.getOrderNo(); // 주문번호를 뽑아준다.
				System.out.println("주문번호"+oNo);
				
				selectbyDate = mypageService.selectRealOrderListView(oNo);
				System.out.println("객체결과!"+selectbyDate);
				
				realoList.add(selectbyDate);
			}
			
			System.out.println("리스트결과?" + realoList);
			
			mv.addObject("realoList", realoList).setViewName("mypage/mypageSelectOrderList");
			
			break;

		default:
			System.out.println("잘못입력");
			break;
		}
		return mv;
	}

	// 상세 주문내역SELECT
	@RequestMapping("orderDetail.my")
	public ModelAndView orderDetail(String orderNo, HttpSession session, ModelAndView mv) {

		// 로그인유저
		Member loginUser = (Member) session.getAttribute("loginUser");

		// ~상세주문리스트가져옴(SELECT)
		ArrayList<OrderDetail> orderDetail = mypageService.orderDetail(Integer.parseInt(orderNo));

		// ~join한 주문객체가져옴(SELECT) 객체하나
		MyOrderDetail myOrderDetail = mypageService.myOrderDetail(Integer.parseInt(orderNo));
		System.out.println(myOrderDetail);
		
		// 로그인이 되어있다면
		if (loginUser != null) {

			mv.addObject("myOrderDetail", myOrderDetail).addObject("loginUser", loginUser)
					.addObject("orderDetail", orderDetail).setViewName("mypage/orderDetail");

		} else {

			session.setAttribute("alertMsg", "로그인후 사용할 수 있습니다.");

		}

		return mv;
	}

	
	// 배송조회 >>상세번호
	@RequestMapping("delivery.my")
	public String deliveryDetail(String orderDetailNo, int orderNo, HttpSession session, Model model) {

		OrderDetail od = new OrderDetail();
		od.setOrderDetailNo(Integer.parseInt(orderDetailNo));
		od.setOrderNo(orderNo);

		// 상세번호,번호 주문객체에 담아서 가져가자
		// ~배송정보()
		DeliveryDetail deliInfo = mypageService.selectDeliveryDetail(od);

		// <<배송정보 객체
		model.addAttribute("deliInfo", deliInfo);

		return "mypage/deliveryDetail";

	}


	// 캐릭터별 좋아요 데이터 가져옴
	@ResponseBody
	@RequestMapping(value = "dataSelect.my", produces = "application/json;charset=UTF-8")
	public String dataSelect(HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();

		// 요청처리
		ArrayList<MyCharacterData> cDataList = mypageService.dataSelect(memberNo);

		return new Gson().toJson(cDataList);

	}

	//찜하기영역-----------------------------------------------------------------------------------------------------
	// 찜한 리스트 조회
	@RequestMapping("wishList.my")
	public String selectWishList(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int mNo = loginUser.getMemberNo();

		// ~멤버번호를 가지고 찜한 리스트 조회
		ArrayList<WishGoods> wList = mypageService.selectWishList(mNo);
		model.addAttribute("wList", wList);

		return "mypage/wish";
	}

	// 찜한리스트 체크박스 삭제
	@ResponseBody
	@RequestMapping(value = "deleteWishList.my", produces = "application/json;charset=UTF-8")
	public String deleteWishList(HttpServletRequest request, HttpSession session) {

		String[] deleteWishList = request.getParameterValues("valueArr");

		Wish wish = new Wish();// 굿즈번호와 멤버번호 담아갈 wish객체
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();

		int goodsNo = 0;
		int result = 0;

		if (deleteWishList != null) {
			for (int i = 0; i < deleteWishList.length; i++) {
				goodsNo = Integer.parseInt(deleteWishList[i]);
				wish.setMemberNo(memberNo);
				wish.setGoodsNo(goodsNo);
				result = mypageService.deleteWishList(wish);
			}
		}

		return result + "";
	}

	// 찜한 리스트 버튼삭제
	@RequestMapping("deleteOk.my")
	public void deleteOk(@RequestParam(value = "goodsNo") int goodsNo, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();

		// 굿즈번호와 위시번호를 담아서 가져간다
		Wish wish = new Wish();// 굿즈번호와 멤버번호 담아갈 wish객체
		wish.setMemberNo(memberNo);
		wish.setGoodsNo(goodsNo);

		mypageService.deleteWishList(wish);

	}

	// 장바구니영역--------------------------------------------------------------------------------------------------
	// 장바구니 추가
	@ResponseBody
	@RequestMapping(value = "findCartGoods.my", produces = "application/text;charset=utf8")
	public String cartInsert(@RequestParam("goodsNo") int goodsNo, HttpSession session) {

		// 회원번호,굿즈번호를 가지고 와야됨
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		// System.out.println("굿즈번호 들어오니"+goodsNo);
		// System.out.println("멤버번호 들어오니"+memberNo);

		// 카트객체에 회원번호,굿즈번호 담아준다
		Cart cart = new Cart();
		cart.setMemberNo(memberNo);
		cart.setGoodsNo(goodsNo);

		// ~해당 상품이 카트에 존재하는지 확인
		boolean findCart = mypageService.findCartGoods(cart);
		// System.out.println("결과 돌?"+cartAlreadyExisted);

		if (findCart) {
			// 카트에 이미 있다면
			return "already";
		} else {
			// 카트에 없다면 카트객체를 가지고 INSERT
			mypageService.addCartGoods(cart);
			return "add";
		}
	}


	// 내가 만든 버전 장바구니 리스트2
	// 조회--------------cartList2
	@RequestMapping("cartList2.my")
	public String selectCartList2(HttpSession session, Model model) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int mNo = loginUser.getMemberNo();

		ArrayList<Cart> cList = mypageService.selectCartList(mNo);

		if (cList != null) {
			model.addAttribute("cList", cList);
		} else {
			session.setAttribute("errorMsg", "장바구니 불러오기 실패");
		}

		return "mypage/cartList";

	 }
	

	//장바구니 수량수정
	@PatchMapping ("updateCartCount.my")
	public String updateCartCount(Cart cart) {
		
		//cart객체
		mypageService.updateCartCount(cart);
		
		return "redirect:/cartList";
		
	}
	
	

}
