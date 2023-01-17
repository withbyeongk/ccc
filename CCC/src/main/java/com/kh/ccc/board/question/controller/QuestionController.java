package com.kh.ccc.board.question.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ccc.board.question.model.service.QuestionService;
import com.kh.ccc.board.question.model.vo.Question;
import com.kh.ccc.board.question.model.vo.QuestionAttach;
import com.kh.ccc.common.model.vo.PageInfo;
import com.kh.ccc.common.template.Pagenation;
import com.kh.ccc.member.model.vo.Member;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("list.qu")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage
			, Model model, HttpSession session) {
		
		
//		// 일반회원 자동 로그인 코드
//		Member loginUser = new Member();
//		loginUser.setmNo(1);
//		loginUser.setmId("user01");
//		loginUser.setmName("오상희");
//		loginUser.setMgNo(1);	// 등급 번호
//		
//		System.out.println("일반회원 자동 로그인");
//		System.out.println(loginUser);
//		session.setAttribute("loginUser", loginUser);
//		session.setAttribute("alertMsg", loginUser.getmName()+"님 어서오세요!");
		
//		System.out.println("list.qu:: currentPage : "+currentPage);
		
		// 총 게시글 수
		int listCount = questionService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 10;
//		System.out.println("QuestionList::CTRL:: listCount : "+listCount);
		
		PageInfo pi = Pagenation.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
		model.addAttribute("pi", pi);
//		System.out.println("QuestionList::CTRL:: pi : " + pi);
		
		ArrayList<Question> list = questionService.selectList(pi);
		model.addAttribute("list", list);
//		System.out.println("QuestionList::CTRL:: list : " + list);
		
		return "board/question/questionListView";
	}
	
	
	@RequestMapping("mylist.qu")
	public String selectMyList(@RequestParam(value="currentPage", defaultValue="1") int currentPage
			, Model model, HttpSession session) {
		
//		System.out.println("list.qu:: currentPage : "+currentPage);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
		// 총 게시글 수
		int listCount = questionService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 10;
//		System.out.println("QuestionList::CTRL:: listCount : "+listCount);
		
		PageInfo pi = Pagenation.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
		model.addAttribute("pi", pi);
//		System.out.println("QuestionList::CTRL:: pi : " + pi);
		
		ArrayList<Question> list = questionService.selectMyList(memberNo, pi);
		model.addAttribute("list", list);
//		System.out.println("QuestionList::CTRL:: list : " + list);
		
		return "board/question/questionListView";
	}
	
	// EnrollForm으로 이동
	@GetMapping("insert.qu")
	public String insertNotice() {
		return "board/question/questionEnrollForm";
	}
	// 글작성
	@PostMapping("insert.qu")
	public ModelAndView insertNotice(Question q, ModelAndView mv, HttpSession session,
							@RequestParam(value="multifile", required=false) List<MultipartFile> upfileList) {
		
//		System.out.println("insert.qu::CTRL : question : "+q);
//		System.out.println("insert.qu::CTRL : upfileList : "+upfileList);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
//		System.out.println(loginUser);
		
		//------------------- 첨부파일 Start
//		System.out.println("size : "+upfileList.size());
		ArrayList<QuestionAttach>qaList = new ArrayList<QuestionAttach>();
		
		if(upfileList != null) {
			for(int i=0; i<upfileList.size(); i++) {
//				System.out.println("반복문 확인 i : "+i);
				
				// 파일이 존재하면 
				if(!upfileList.get(i).getOriginalFilename().equals("")) {
//					System.out.println("담기 전 : "+upfileList.get(i));
					
					// resources/question/uploadFiles 에 저장하고 파일명 수정하여 반환
					String changeName = saveFile(upfileList.get(i),session);
					QuestionAttach qa = new QuestionAttach();
					qa.setQuestionAttachOriginName(upfileList.get(i).getOriginalFilename());
//					qa.setQuestionAttachChangeName("resources/question/uploadFiles/"+changeName);
					qa.setQuestionAttachChangeName(changeName);
					qa.setQuestionAttachFilePath("resources/question/uploadFiles/");
//					System.out.println(i+"번에 넣는 qa : "+qa);
					qaList.add(qa);
				}
			}
//			System.out.println("다 담은 후 : ");
//			System.out.println(qaList);
//			for(int i=0; i<qaList.size(); i++) {
//				System.out.println("qaList의 "+i+"번째 데이터 : "+qaList.get(i));
//			}
		}
		//------------------- 첨부파일 End
		
		q.setQuestionWriterNo(loginUser.getMemberNo());
		
		System.out.println("Question Insert 전 : "+q);
		//만약 첨부파일이 없다면 - 작성자,내용,제목 
		//첨부파일이 있다면 - 작성자,제목,내용,원본이름,저장경로
		int result = questionService.insertQuestion(q, qaList);
		
		if(result>0) {
			session.setAttribute("alertMsg", "문의글이 등록되었습니다.");
			mv.setViewName("redirect:/list.qu");
		}else {
			mv.addObject("errorMsg","문의글 등록 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	//현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 메소드
	public String saveFile(MultipartFile upfile,HttpSession session) {
		
		//1.원본파일명 뽑기 
		String originName = upfile.getOriginalFilename();
		
		//2.시간 형식 뽑기
		//"202212050153533"
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//3.확장자 추출하기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//4.랜덤숫자 추출하기 5자리
		int ranNum = (int)(Math.random() * 90000 + 10000); // 5자리 랜덤값
		
		//5. 모두 이어붙이기
		String changeName = currentTime+ranNum+ext;
		
		//6.파일을 업로드할 실질적인 위치(물리경로)찾기 
		String savePath = session.getServletContext().getRealPath("/resources/question/uploadFiles/");
		
		try {
		//7.물리경로+변경이름으로 파일 생성 및 업로드	
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@RequestMapping("detail.qu")
	public ModelAndView detailQuestion(@RequestParam(value="qno") int qno, ModelAndView mv, HttpSession session, HttpServletRequest request) {
		
//		System.out.println("글번호 : "+qno);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser);
		
		int result = questionService.increaseCount(qno);
//		System.out.println("detail.qu:: increase result: "+ result);
		
		if(result>0) {
			Question q = questionService.selectQuestion(qno);
			System.out.println("detail.qu:: q :"+q);
			
			/*
			 * VIEW 에서 처리함
			// 해당 글 작성자와 로그인한 사람이 같지 않으면 글을 볼 수 없도록
//			System.out.println("detail.qu :: q.getQuestionWriter() : " + q.getQuestionWriter() );
//			System.out.println("detail.qu :: loginUser.getmName() : " + loginUser.getmName() );
			if((loginUser == null) ) {
				System.out.println("로그인되지 않음");
				if (request.getHeader("Referer") != null) {
					mv.addObject("alertMsg", "로그인하셔야 볼 수 있습니다.");
					mv.setViewName("redirect:" + request.getHeader("Referer"));
					return mv;
				}
			}
			else {
				if(!q.getQuestionWriter().equals(loginUser.getmName())) {
					System.out.println("작성자와 로그인한 유저가 동일하지 않거나 로그인되지 않음");
					mv.addObject("alertMsg", "자신의 글만 볼 수 있습니다.");
					if (request.getHeader("Referer") != null) {
						mv.setViewName("redirect:" + request.getHeader("Referer"));
						return mv;
					}
				}
			}*/
				
			ArrayList<QuestionAttach> qaList = questionService.selectQAList(qno);
//			System.out.println("detail.qu:: qaList : "+qaList);
			
			mv.addObject("qaList", qaList).addObject("q",q).setViewName("board/question/questionDetailView");
			
		}else {
			mv.addObject("errorMsg", "문의글 상세 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("updateForm.qu")
	public String questionUpdateForm(int qno, Model model) {
		Question q = questionService.selectQuestion(qno);
		model.addAttribute("q", q);
//		System.out.println("updateForm.qu:: q :" + q);
		
		ArrayList<QuestionAttach> qaList = questionService.selectQAList(qno);
		model.addAttribute("qaList", qaList);
//		System.out.println("updateForm.qu:: qaList : "+qaList);
		
		return "board/question/questionUpdateForm";
	}
	
	
	@RequestMapping("update.qu")
	public ModelAndView questionUpdate(Question q, HttpSession session, ModelAndView mv,
			@RequestParam(value="multifile", required=false) List<MultipartFile> upfileList,
			@RequestParam(value="oldQa", required=false) ArrayList<Integer> oldQaList) {
		
		System.out.println("update.qu:: upfileList : " + upfileList);
		System.out.println("update.qu:: oldQaList : "+ oldQaList);	// 수정 후 남은 첨부파일.(냅둘 것)
		System.out.println("update.qu:: question : "+ q);
		
		// 해당 게시물의 첨부파일 번호 목록 가져오기
		ArrayList<QuestionAttach> qaList = questionService.selectQAList(q.getQuestionNo());
		System.out.println("update.qu:: qaList : " + qaList);
		
		
		if(qaList.isEmpty()) {
			System.out.println("기존 첨부파일 없음.");
			
		}
		else {
			// 현재 남아있는 것을 제외하고는 첨부파일 삭제
			int delAttachResult = 0;
			for(QuestionAttach qa : qaList) {
//				System.out.println(qa.getQuestionAttachNo()+"를 확인");
//				System.out.println(oldQaList.contains(qa.getQuestionAttachNo()));
				
				if(oldQaList != null) {
					if(!oldQaList.contains(qa.getQuestionAttachNo())) {	// 있는지 확인
						// 없는 첨부파일 삭제
//						System.out.println("삭제할 첨부파일 번호 : " + qa.getNoticeAttachNo());
						delAttachResult = questionService.deleteQuestionAttachByQaNo(qa.getQuestionAttachNo());
//						System.out.println("첨부파일 삭제 결과 : " + delAttachResult);
						
						//물리적인 경로 찾기 
						String realPath = session.getServletContext().getRealPath(qa.getQuestionAttachChangeName()+qa.getQuestionAttachFilePath());
//						String realPath = session.getServletContext().getRealPath(qa.getQuestionAttachChangeName());
//						System.out.println("realPath : " + realPath);
						//해당 경로와 연결시켜 파일객체 생성후 삭제 메소드(해당 파일 삭제)
						new File(realPath).delete();
						
						if(delAttachResult == 0) {
							System.out.println("update.qu::기존 첨부파일 삭제 실패");
							mv.addObject("errorMsg", "기존 첨부파일 삭제 실패");
							mv.setViewName("common/errorPage");
							return mv;
						}
					}
					
				}
				else {	// 기존 첨부파일을 전부 삭제한 경우
//					System.out.println("삭제할 첨부파일 번호 : " + qa.getNoticeAttachNo());
					delAttachResult = questionService.deleteQuestionAttachByQaNo(qa.getQuestionAttachNo());
//					System.out.println("첨부파일 삭제 결과 : " + delAttachResult);
					
					//물리적인 경로 찾기 
					String realPath = session.getServletContext().getRealPath(qa.getQuestionAttachChangeName()+qa.getQuestionAttachFilePath());
//					String realPath = session.getServletContext().getRealPath(qa.getQuestionAttachChangeName());
//					System.out.println("realPath : " + realPath);
					//해당 경로와 연결시켜 파일객체 생성후 삭제 메소드(해당 파일 삭제)
					new File(realPath).delete();
					
					if(delAttachResult == 0) {
						System.out.println("update.qu::기존 첨부파일 삭제 실패");
						mv.addObject("errorMsg", "기존 첨부파일 삭제 실패");
						mv.setViewName("common/errorPage");
						return mv;
					}
				}
			}
		}
		
		// 추가된 첨부파일 삽입
//		System.out.println("size : "+upfileList.size());
		ArrayList<QuestionAttach> newQaList = new ArrayList<QuestionAttach>();
		
		if(upfileList != null) {
			for(int i=0; i<upfileList.size(); i++) {
				System.out.println("반복문 확인 i : "+i);
				
				// 파일이 존재하면 
				if(!upfileList.get(i).getOriginalFilename().equals("")) {
					System.out.println("담기 전 : "+upfileList.get(i));
					
					// resources/question/uploadFiles 에 저장하고 파일명 수정하여 반환
					String changeName = saveFile(upfileList.get(i),session);
					QuestionAttach qa = new QuestionAttach();
					qa.setQuestionNo(q.getQuestionNo());
					qa.setQuestionAttachOriginName(upfileList.get(i).getOriginalFilename());
//					qa.setQuestionAttachChangeName("resources/question/uploadFiles/"+changeName);
					qa.setQuestionAttachChangeName(changeName);
					qa.setQuestionAttachFilePath("resources/question/uploadFiles/");
//					System.out.println(i+"번에 넣는 qa : "+qa);
					newQaList.add(qa);
				}
			}
//			System.out.println("다 담은 후 : ");
//			System.out.println(newQaList);
			for(int i=0; i<newQaList.size(); i++) {
				System.out.println("newQaList의 "+i+"번째 데이터 : "+newQaList.get(i));
			}
		}
		//------------------- 첨부파일 End
		
		Member loginUser = (Member)session.getAttribute("loginUser");
//		System.out.println("사용자 : "+loginUser);
		q.setQuestionWriterNo(loginUser.getMemberNo());
		
//		System.out.println("Question Update 전 : "+q);
		//만약 첨부파일이 없다면 - 작성자,내용,제목 
		//첨부파일이 있다면 - 작성자,제목,내용,원본이름,저장경로
		int result = questionService.updateQuestion(q, newQaList);
		
		if(result>0) {
			session.setAttribute("alertMsg", "문의글이 수정되었습니다.");
			mv.setViewName("redirect:/list.qu");
		}else {
			mv.addObject("errorMsg","문의글 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping(value="delete.qu")
	public String questionDelete(int qno, HttpSession session ,Model model) {
		
		// 해당 게시물의 첨부파일 목록 가져오기
		ArrayList<QuestionAttach> qaList = questionService.selectQAList(qno);
		
		// 해당 게시물의 첨부파일 삭제
		if(qaList.isEmpty()) {
			System.out.println(qno+"번 게시물의 첨부파일 없음");
		}
		else {
			
			// 실제 파일 삭제
			for(QuestionAttach qa : qaList) {
					
				//물리적인 경로 찾기 
				String realPath = session.getServletContext().getRealPath(qa.getQuestionAttachChangeName()+qa.getQuestionAttachFilePath());
//				String realPath = session.getServletContext().getRealPath(qa.getQuestionAttachChangeName());
//				System.out.println("realPath : " + realPath);
				
				//해당 경로와 연결시켜 파일객체 생성후 삭제 메소드(해당 파일 삭제)
				new File(realPath).delete();
					
			}
			// DB에서 첨부파일 삭제
			int delAttachResult = 0;
			delAttachResult = questionService.deleteQuestionAttachByQno(qno);
			System.out.println("첨부파일 삭제 결과 : " + delAttachResult);

			if(delAttachResult == 0) {
				System.out.println("delete.qu::첨부파일 삭제 실패");
				model.addAttribute("errorMsg", "첨부파일 삭제 실패");
				return "common/errorPage";
			}
		}
		
		int result = questionService.deleteQuestion(qno);
		System.out.println("delete.qu :: result : " + result);
		
		if(result>0) { //데이터 삭제에 성공했으면 - 서버에 저장된 파일도 삭제하여 자원 낭비하지 않기
			System.out.println("delete.qu :: 문의글 첨부파일 전체 삭제 성공");
		}
		else {
			System.out.println("delete.qu :: 문의글 첨부파일 삭제 실패");
			model.addAttribute("errorMsg","게시글 첨부파일 삭제 실패");
			return "common/errorPage";
		}
		return "redirect:/list.qu";
	}
	
	@RequestMapping("responseForm.qu")
	public String questionResponseForm(int qno, Model model) {
		Question q = questionService.selectQuestion(qno);
		model.addAttribute("q", q);
		System.out.println("responseForm.qu:: q :" + q);
		
		ArrayList<QuestionAttach> qaList = questionService.selectQAList(qno);
		model.addAttribute("qaList", qaList);
		System.out.println("responseForm.qu:: qaList : "+qaList);
		
		return "board/question/questionResponseForm";
	}
	
	@RequestMapping("response.qu")
	public String questionResponse(Model model, Question q) {
		
		int result = questionService.responseQuestion(q);
		
		if(result >0) {
			System.out.println("response.qu:: result" + result);
			return "redirect:/list.qu";
		}
		else {
			System.out.println("response.qu:: result" + result);
			model.addAttribute("errorMsg","답변 작성 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteGroup.qu")
	public String deleteGroup(Model model, String chkArr) {
	
//		System.out.println("deleteGroup.qu :: chk = " + chkArr);
		// 문자열을 ',' 로 나누어서 String 배열에 담기
		String[] deleteNoList = chkArr.split(",");
		int[] deleteNoArr = new int[deleteNoList.length];
		// int 배열로 변경
		for(int i=0; i<deleteNoList.length; i++) {
			deleteNoArr[i] =  Integer.parseInt(deleteNoList[i]);
//			System.out.println(deleteNoList[i]+" -> " + deleteNoArr[i]);
		}
		
		int result = questionService.deleteGroup(deleteNoArr);
		if(result > 0) {
//			System.out.println("deleteGroup.qu:: result : "+ result);
			return "redirect:/list.qu";
		}
		else {
//			System.out.println("deleteGroup.qu:: result : "+ result);
			model.addAttribute("errorMsg", "그룹삭제 실패");
			return "common/errorPage";
		}
	}
}
