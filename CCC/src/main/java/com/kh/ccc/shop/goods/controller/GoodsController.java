package com.kh.ccc.shop.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ccc.member.model.vo.Member;
import com.kh.ccc.shop.cart.model.service.CartService;
import com.kh.ccc.shop.cart.model.vo.Cart;
import com.kh.ccc.shop.goods.model.service.GoodsService;
import com.kh.ccc.shop.goods.model.vo.Goods;
import com.kh.ccc.shop.goods.model.vo.GoodsReview;

@Controller
public class GoodsController {
	
	@Autowired private GoodsService goodsService;
	
	//굿즈 메인 페이지로 보내기
	@RequestMapping("goodsMain.go")
	public String GoodsMainPage() {
		return "shop/goods/goodsMainPage";
	}
	
	//굿즈 리스트 보내기
	@RequestMapping("list.go")
	public String StickerListView(@RequestParam(value="menu") String menu, HttpSession session, Model model) {
		System.out.println("list.go:: menu" + menu);
		
		ArrayList<Goods> list = new ArrayList<>();
		
		// 게시글 받아오기
		list = goodsService.goodsList(menu);
		
		//보내기
		model.addAttribute("list",list);
		System.out.println("list.go : " +list);
		
		return "shop/goods/goodsListView";
	}

	
	//굿즈 디테일 페이지로 보내기
	@RequestMapping("detail.go")
	public ModelAndView GoodsDetailPage(@RequestParam(value="gno") int gno, ModelAndView mv) {
		//gno로 데이터 담아서 넘겨주기~~~
		System.out.println("gno"+gno);
		
		Goods g = goodsService.selectGoods(gno);
		ArrayList<GoodsReview> list = goodsService.selectReviewList(gno);
		
		System.out.println("detail.go:: g : " + g);
		System.out.println("detail.go:: list : " + list);
		mv.addObject("g", g);
		mv.addObject("list", list).setViewName("shop/goods/goodsDetailView");
		
		return mv;
	}
		
	//네비 페이지로 보내기
	@RequestMapping("navi.go")
	public String NaviPage() {
		return "shop/goods/goodsNavi";
	}
	
	//글작성 페이지로 이동시키는 메소드 (포워드)
	@RequestMapping("insert.go")
	public String insertGoods() {
		return "shop/goods/goodsEnrollForm";
	}
	
	//글 등록을 시키는 메소드
	@PostMapping("insert.go")
	public ModelAndView insertBoard(Goods g,
									List<MultipartFile> upfile,
									ModelAndView mv,
									HttpSession session) {
		System.out.println("g:"+g);
		System.out.println("upfile:"+upfile);
		
		//전달된 파일이 있을 경우 - 파일명 수정 후에 서버로 업로드 - 원본명, 서버에 업로드된 경로를 이어서 다운로드 처리
		System.out.println(upfile.get(0).getOriginalFilename()); 												//파일을 업로드하지 않고 호출했을 시 "" 처리가 된다.
		System.out.println("upfile.size() : "+upfile.size());
		
		if(!upfile.get(0).getOriginalFilename().equals("")) { 													//파일 업로드가 되었다면 파일명 수정 후 서버로 업로드 //짱구.jpg -> 20221202113413344555.jpg
			//아래에서 모듈화 시킨 saveFile 메소드 활용
			String changeName = saveFile(upfile.get(0),session);
			
			// 원본명, 서버에 업로드한 경로를 Board 객체에 담아주기
			g.setGoodsOriginName1(upfile.get(0).getOriginalFilename());
			g.setGoodsChangeName1("resources/goodsImg/"+changeName);
		}
		
		if(!upfile.get(1).getOriginalFilename().equals("")) { 													//파일 업로드가 되었다면 파일명 수정 후 서버로 업로드 //짱구.jpg -> 20221202113413344555.jpg
			//아래에서 모듈화 시킨 saveFile 메소드 활용
			String changeName = saveFile(upfile.get(1),session);
			
			// 원본명, 서버에 업로드한 경로를 Board 객체에 담아주기
			g.setGoodsOriginName2(upfile.get(1).getOriginalFilename());
			g.setGoodsChangeName2("resources/goodsImg/"+changeName);
		}
		
		if(!upfile.get(2).getOriginalFilename().equals("")) { 													//파일 업로드가 되었다면 파일명 수정 후 서버로 업로드 //짱구.jpg -> 20221202113413344555.jpg
			//아래에서 모듈화 시킨 saveFile 메소드 활용
			String changeName = saveFile(upfile.get(2),session);
			
			// 원본명, 서버에 업로드한 경로를 Board 객체에 담아주기
			g.setGoodsOriginName3(upfile.get(2).getOriginalFilename());
			g.setGoodsChangeName3("resources/goodsImg/"+changeName);
		}
		
		if(!upfile.get(3).getOriginalFilename().equals("")) { 													//파일 업로드가 되었다면 파일명 수정 후 서버로 업로드 //짱구.jpg -> 20221202113413344555.jpg
			//아래에서 모듈화 시킨 saveFile 메소드 활용
			String changeName = saveFile(upfile.get(3),session);
			
			// 원본명, 서버에 업로드한 경로를 Board 객체에 담아주기
			g.setGoodsOriginName4(upfile.get(3).getOriginalFilename());
			g.setGoodsChangeName4("resources/goodsImg/"+changeName);
		}
		

		//만약 첨부파일이 없다면 - 작성자, 내용, 제목
		//첨부파일이 있다면 - 작성자, 제목, 내용, 원본이름, 경로, 저장경로
		int result = goodsService.insertGoods(g);
		
		System.out.println("굿즈 컨트롤러"+g);
		System.out.println("굿즈 컨트롤러"+upfile);
		
		if(result>0) { //성공시 - 게시판 리스트 띄워주기 (list.bo 재요청)
			session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
			mv.addObject("menu", g.getGoodsCategory());
			mv.setViewName("redirect:/list.go");
		}else { //실패 - 에러페이지 포워딩
			mv.addObject("errorMsg","게시글 등록 실패").setViewName("common/errorPage");
			System.out.println("등록실패");
		}
		return mv;
	}
	
	
	
	//현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 메소드(모듈)
	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = ((MultipartFile)upfile).getOriginalFilename();										//1. 원본 파일명 뽑기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());							//2. 시간 형식 뽑기 - "20221205153533"
		String ext = originName.substring(originName.lastIndexOf("."));											//3. 확장자 추출하기
		int ranNum = (int)(Math.random() * 90000 + 10000); 														//4. 랜덤 숫자 추출하기(5자리) // 5자리 랜덤값
		String changeName = currentTime + ranNum + ext;															//5. 모두 이어붙이기
		String savePath = session.getServletContext().getRealPath("/resources/goodsImg/");						//6. 파일을 업로드 할 실질적인 위치 (물리경로) 찾기
		
		try {
			((MultipartFile)upfile).transferTo(new File(savePath+changeName));									// 7. 물리 경로 + 변경이름으로 파일 생성 및 업로드
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	
	//리뷰 작성폼으로 이동
	@RequestMapping("reviewForm.go")
	public String GoodsReviewForm(Model model, int gno) {
		model.addAttribute("gno",gno);
		return "shop/goods/goodsReviewForm";
	}
	
	//리뷰 등록하기
	@PostMapping("review.go")
	public ModelAndView insertGoodsReview(GoodsReview gr,
										  @RequestParam(value="upfile") MultipartFile upfile,	
										  HttpSession session,
										  ModelAndView mv) {

		Member loginUser = (Member)session.getAttribute("loginUser");
//			loginUser.setMemberNo(1);
//			loginUser.setMemberId("user01");
//			loginUser.setMemberName("오상희");
//			
		int memberNo = loginUser.getMemberNo();

//			GoodsReview gr = new GoodsReview();
		
//			gr.setGrScore(grScore);
//			gr.setGrContent(grContent);
//			gr.setGoodsNo(goodsNo);
		gr.setMemberNo(memberNo);
		
		//만약 첨부파일이 없다면 - 작성자, 내용, 별점	//첨부파일이 있다면 - 작성자, 내용, 별점, 원본이름
		
		if(!upfile.getOriginalFilename().equals("")) { 	//파일 업로드가 되었다면 파일명 수정 후 서버로 업로드 //짱구.jpg -> 20221202113413344555.jpg
			//아래에서 모듈화 시킨 saveFile 메소드 활용
			String changeName = saveFile(upfile,session);
			
			// 원본명, 서버에 업로드한 경로를 Board 객체에 담아주기
			gr.setOriginName(upfile.getOriginalFilename());
			gr.setChangeName("resources/goodsImg/"+changeName);
		}
		
		int result =  goodsService.insertReview(gr);
		
		if(result > 0) {
			System.out.println("굿즈리뷰 등록 성공");
		}
		else {
			System.out.println("굿즈리뷰 등록 실패");
		}
		
		System.out.println("리뷰 컨트롤러 : "+gr);
		
		mv.setViewName("redirect:/detail.go?gno="+gr.getGoodsNo());
		return mv;
	}
	
	//검색하기
	@RequestMapping("searchGoods.go")
	public String searchList(@RequestParam(value="keyword", required=false) String keyword, HttpSession session, Model model) {
		
		System.out.println("keyword::" + keyword);
		ArrayList<Goods> list = new ArrayList<>();
		
		list = goodsService.searchList(keyword);
		 
        model.addAttribute("list", list);
        System.out.println("list.go :: " +list);
        
		return "shop/goods/goodsSearchView";
	
	}
	//문의글 등록
//	@RequestMapping("goodsQna.go")
//	public String goodsQna(@RequestParam(value="keyword", required=false) String keyword, HttpSession session, Model model) {
//		
//		ArrayList<Goods> list = new ArrayList<>();
//		
//		list = goodsService.goodsQna();
//		 
//        model.addAttribute("list", list);
//        System.out.println("list.go :: " +list);
//        
//		return "shop/goods/goodsSearchView";
//	
//	}
		
}
