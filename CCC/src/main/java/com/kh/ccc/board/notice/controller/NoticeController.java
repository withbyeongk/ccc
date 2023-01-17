package com.kh.ccc.board.notice.controller;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ccc.admin.model.vo.Admin;
import com.kh.ccc.board.notice.model.service.NoticeService;
import com.kh.ccc.board.notice.model.vo.ChangeBoardLimit;
import com.kh.ccc.board.notice.model.vo.Notice;
import com.kh.ccc.board.notice.model.vo.NoticeAttach;
import com.kh.ccc.common.model.vo.PageInfo;
import com.kh.ccc.common.template.Pagenation;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage
			,@RequestParam(value="boardLimit", defaultValue="10") int boardLimit
			, Model model, HttpSession session) {
		
		
//		System.out.println("관리자 자동 로그인");
//		System.out.println(loginAdmin);
//		session.setAttribute("alertMsg", loginAdmin.getAdminName()+"님 어서오세요!");
		
		System.out.println("list.no:: currentPage : "+currentPage);
		System.out.println("list.no:: boardLimit : "+boardLimit);
		
		 
		// 총 게시글 수
		int listCount = noticeService.selectListCount();
		int pageLimit = 10;
//		int boardLimit = 10;
//		System.out.println("NoticeList::CTRL:: listCount : "+listCount);
		
		PageInfo pi = Pagenation.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
		model.addAttribute("pi", pi);
//		System.out.println("NoticeList::CTRL:: pi : " + pi);
		
		ArrayList<Notice> list = noticeService.selectList(pi);
		model.addAttribute("list", list);
//		System.out.println("NoticeList::CTRL:: list : " + list);
		
		return "board/notice/noticeListView";
	}
	
	
	// EnrollForm으로 이동
	@GetMapping("insert.no")
	public String insertNotice() {
		return "board/notice/noticeEnrollForm";
	}
	// 글작성
	@PostMapping("insert.no")
	public ModelAndView insertNotice(Notice n, ModelAndView mv, HttpSession session,
							@RequestParam(value="multifile", required=false) List<MultipartFile> upfileList) {
		
//		System.out.println("insert.no::CTRL : notice : "+n);
//		System.out.println("insert.no::CTRL : upfileList : "+upfileList);
		
		Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
//		System.out.println(loginAdmin);
		
		//------------------- 첨부파일 Start
		ArrayList<NoticeAttach> naList = new ArrayList<NoticeAttach>();
		
		if(upfileList != null) {
//			System.out.println("size : "+upfileList.size());
			System.out.println("insert.no:: upfileList : "+upfileList);
			for(int i=0; i<upfileList.size(); i++) {
				System.out.println("반복문 확인 i : "+i);
				
				// 파일이 존재하면 
				if(!upfileList.get(i).getOriginalFilename().equals("")) {
					System.out.println("담기 전 : "+upfileList.get(i));
					
					// resources/notice/uploadFiles 에 저장하고 파일명 수정하여 반환
					String changeName = saveFile(upfileList.get(i),session);
					NoticeAttach na = new NoticeAttach();
					na.setNoticeAttachOriginName(upfileList.get(i).getOriginalFilename());
	//				na.setNoticeAttachChangeName("resources/notice/uploadFiles/"+changeName);
					na.setNoticeAttachChangeName(changeName);
					na.setNoticeAttachFilePath("resources/notice/uploadFiles/");
	//				System.out.println(i+"번에 넣는 na : "+na);
					naList.add(na);
				}
			}
//			System.out.println("다 담은 후 : ");
//			System.out.println(naList);
//			for(int i=0; i<naList.size(); i++) {
//				System.out.println("naList의 "+i+"번째 데이터 : "+naList.get(i));
//			}
		}
		
		//------------------- 첨부파일 End
		
		n.setNoticeWriterNo(loginAdmin.getaNo());
		
		System.out.println("Notice Insert 전 : "+n);
		//만약 첨부파일이 없다면 - 작성자,내용,제목 
		//첨부파일이 있다면 - 작성자,제목,내용,원본이름,저장경로
		int result = noticeService.insertNotice(n, naList);
		
		if(result>0) {
			session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			mv.setViewName("redirect:/list.no");
		}else {
			mv.addObject("errorMsg","공지사항 등록 실패").setViewName("common/errorPage");
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
		String savePath = session.getServletContext().getRealPath("/resources/notice/uploadFiles/");
		
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
	
	@RequestMapping("detail.no")
	public ModelAndView detailNotice(@RequestParam(value="nno") int nno, ModelAndView mv) {
		
//		System.out.println("글번호 : "+nno);
		
		int result = noticeService.increaseCount(nno);
//		System.out.println("detail.no:: increase result: "+ result);
		
		if(result>0) {
			Notice n = noticeService.selectNotice(nno);
//			System.out.println("detail.no:: n :"+n);
			
			ArrayList<NoticeAttach> naList = noticeService.selectNAList(nno);
			System.out.println("detail.no:: naList : "+naList);
			
			mv.addObject("naList", naList).addObject("n",n).setViewName("board/notice/noticeDetailView");
			
		}else {
			mv.addObject("errorMsg", "공지사항 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("updateForm.no")
	public String noticeUpdateForm(int nno, Model model) {
		Notice n = noticeService.selectNotice(nno);
		model.addAttribute("n", n);
		System.out.println("updateForm.no:: n :" + n);
		
		ArrayList<NoticeAttach> naList = noticeService.selectNAList(nno);
		model.addAttribute("naList", naList);
		System.out.println("updateForm.no:: naList : "+naList);
		
		return "board/notice/noticeUpdateForm";
	}
	
	
	@RequestMapping("update.no")
	public ModelAndView noticeUpdate(Notice n, HttpSession session, ModelAndView mv,
			@RequestParam(value="multifile", required=false) List<MultipartFile> upfileList,
			@RequestParam(value="oldNa", required=false) ArrayList<Integer> oldNaList) {
		
		System.out.println("update.no:: upfileList : " + upfileList);
		System.out.println("update.no:: oldNaList : "+ oldNaList);	// 수정 후 남은 첨부파일.(냅둘 것)
		System.out.println("update.no:: notice : "+ n);
		
		// 해당 게시물의 첨부파일 번호 목록 가져오기
		ArrayList<NoticeAttach> naList = noticeService.selectNAList(n.getNoticeNo());
		System.out.println("update.no:: naList : " + naList);
		
		
		if(naList.isEmpty()) {
			System.out.println("기존 첨부파일 없음.");
			
		}
		else {
			// 현재 남아있는 것을 제외하고는 첨부파일 삭제
			int delAttachResult = 0;
			for(NoticeAttach na : naList) {
//				System.out.println(na.getNoticeAttachNo()+"를 확인");
//				System.out.println(oldNaList);
//				System.out.println(na.getNoticeAttachNo());
				if(oldNaList != null) {
					if(!oldNaList.contains(na.getNoticeAttachNo())) {	// 있는지 확인
						// 없는 첨부파일 삭제
//						System.out.println("삭제할 첨부파일 번호 : " + na.getNoticeAttachNo());
						delAttachResult = noticeService.deleteNoticeAttachByNaNo(na.getNoticeAttachNo());
//						System.out.println("첨부파일 삭제 결과 : " + delAttachResult);
						
						//물리적인 경로 찾기 
						String realPath = session.getServletContext().getRealPath(na.getNoticeAttachChangeName()+na.getNoticeAttachFilePath());
//						String realPath = session.getServletContext().getRealPath(na.getNoticeAttachChangeName());
//						System.out.println("realPath : " + realPath);
						//해당 경로와 연결시켜 파일객체 생성후 삭제 메소드(해당 파일 삭제)
						new File(realPath).delete();
						
						if(delAttachResult == 0) {
							System.out.println("update.no::기존 첨부파일 삭제 실패");
							mv.addObject("errorMsg", "기존 첨부파일 삭제 실패");
							mv.setViewName("common/errorPage");
							return mv;
						}
					}
				}
				else {	// 기존 첨부파일을 전부 삭제한 경우
					System.out.println("삭제할 첨부파일 번호 : " + na.getNoticeAttachNo());
					delAttachResult = noticeService.deleteNoticeAttachByNaNo(na.getNoticeAttachNo());
//					System.out.println("첨부파일 삭제 결과 : " + delAttachResult);
					
					//물리적인 경로 찾기 
					String realPath = session.getServletContext().getRealPath(na.getNoticeAttachChangeName()+na.getNoticeAttachFilePath());
//					String realPath = session.getServletContext().getRealPath(na.getNoticeAttachChangeName());
//					System.out.println("realPath : " + realPath);
					//해당 경로와 연결시켜 파일객체 생성후 삭제 메소드(해당 파일 삭제)
					new File(realPath).delete();
					
					if(delAttachResult == 0) {
						System.out.println("update.no::기존 첨부파일 삭제 실패");
						mv.addObject("errorMsg", "기존 첨부파일 삭제 실패");
						mv.setViewName("common/errorPage");
						return mv;
					}
				}
			}
		}
		
		// 추가된 첨부파일 삽입
//		System.out.println("size : "+upfileList.size());
		ArrayList<NoticeAttach> newNaList = new ArrayList<NoticeAttach>();
		
		if(upfileList != null) {
			for(int i=0; i<upfileList.size(); i++) {
				System.out.println("반복문 확인 i : "+i);
				
				// 파일이 존재하면 
				if(!upfileList.get(i).getOriginalFilename().equals("")) {
					System.out.println("담기 전 : "+upfileList.get(i));
					
					// resources/notice/uploadFiles 에 저장하고 파일명 수정하여 반환
					String changeName = saveFile(upfileList.get(i),session);
					NoticeAttach na = new NoticeAttach();
					na.setNoticeNo(n.getNoticeNo());
					na.setNoticeAttachOriginName(upfileList.get(i).getOriginalFilename());
//					na.setNoticeAttachChangeName("resources/notice/uploadFiles/"+changeName);
					na.setNoticeAttachChangeName(changeName);
					na.setNoticeAttachFilePath("resources/notice/uploadFiles/");
//					System.out.println(i+"번에 넣는 na : "+na);
					newNaList.add(na);
				}
			}
//			System.out.println("다 담은 후 : ");
//			System.out.println(newNaList);
			for(int i=0; i<newNaList.size(); i++) {
				System.out.println("newNaList의 "+i+"번째 데이터 : "+newNaList.get(i));
			}
		}
		
		//------------------- 첨부파일 End
		
		Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
//		System.out.println("관리자 : "+loginAdmin);
		n.setNoticeWriterNo(loginAdmin.getaNo());
		
//		System.out.println("Notice Update 전 : "+n);
		//만약 첨부파일이 없다면 - 작성자,내용,제목 
		//첨부파일이 있다면 - 작성자,제목,내용,원본이름,저장경로
		int result = noticeService.updateNotice(n, newNaList);
		
		if(result>0) {
			session.setAttribute("alertMsg", "공지사항이 수정되었습니다.");
			mv.setViewName("redirect:/list.no");
		}else {
			mv.addObject("errorMsg","공지사항 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping(value="delete.no")
	public String noticeDelete(int nno, HttpSession session ,Model model) {
		
		// 해당 게시물의 첨부파일 목록 가져오기
		ArrayList<NoticeAttach> naList = noticeService.selectNAList(nno);
		
		// 해당 게시물의 첨부파일 삭제
		if(naList.isEmpty()) {
			System.out.println(nno+"번 게시물의 첨부파일 없음");
		}
		else {
			
			// 실제 파일 삭제
			for(NoticeAttach na : naList) {
					
				//물리적인 경로 찾기 
				String realPath = session.getServletContext().getRealPath(na.getNoticeAttachChangeName()+na.getNoticeAttachFilePath());
//				String realPath = session.getServletContext().getRealPath(na.getNoticeAttachChangeName());
//				System.out.println("realPath : " + realPath);
				
				//해당 경로와 연결시켜 파일객체 생성후 삭제 메소드(해당 파일 삭제)
				new File(realPath).delete();
					
			}
			// DB에서 첨부파일 삭제
			int delAttachResult = 0;
			delAttachResult = noticeService.deleteNoticeAttachByNno(nno);
			System.out.println("첨부파일 삭제 결과 : " + delAttachResult);

			if(delAttachResult == 0) {
				System.out.println("delete.no::첨부파일 삭제 실패");
				model.addAttribute("errorMsg", "첨부파일 삭제 실패");
				return "common/errorPage";
			}
		}
		
		int result = noticeService.deleteNotice(nno);
		System.out.println("delete.no :: result : " + result);
		
		if(result>0) { //데이터 삭제에 성공했으면 - 서버에 저장된 파일도 삭제하여 자원 낭비하지 않기
			System.out.println("delete.no :: 공지사항 첨부파일 전체 삭제 성공");
		}
		else {
			System.out.println("delete.no :: 공지사항 첨부파일 삭제 실패");
			model.addAttribute("errorMsg","게시글 첨부파일 삭제 실패");
			return "common/errorPage";
		}
		return "redirect:/list.no";
	}
	
}
