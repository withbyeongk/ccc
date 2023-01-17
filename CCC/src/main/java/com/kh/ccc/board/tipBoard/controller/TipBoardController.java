package com.kh.ccc.board.tipBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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

import com.kh.ccc.board.tipBoard.model.service.TipBoardService;
import com.kh.ccc.board.tipBoard.model.vo.TipAttach;
import com.kh.ccc.board.tipBoard.model.vo.TipBoard;
import com.kh.ccc.common.model.vo.PageInfo;
import com.kh.ccc.common.template.Pagenation;

@Controller
public class TipBoardController {

	@Autowired
	private TipBoardService boardService;
	
	
	//글 등록시 넘어온 첨부파일 자체를 서버의 폴더에 저장시키는 메소드 (모듈)
		public String saveFile(MultipartFile upfile, HttpSession session) {
			
			//1.원본파일명 반환
			String originName = upfile.getOriginalFilename();
			
			//2.시간형식 문자열로 반환
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			//3.뒤에 붙일 랜덤값 반환
			int ranNum = (int)(Math.random() * 90000 + 10000); //5자리의 랜덤숫자
			
			//4.원본 파일명으로부터 확장자명 반환
			String ext = originName.substring(originName.lastIndexOf("."));
			
			//5.위에 반환받은 데이터 모두 붙여 파일명 만들기
			String changeName = currentTime + ranNum + ext;
			
			//6.업로드 하고자 하는 실제 위치 경로 지정해주기 (실제 경로)
			String savePath = session.getServletContext().getRealPath("/resources/charBoardImg/");
			
			//7.경로와 수정파일명 합쳐서 파일을 업로드해주기
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return changeName;
		}
		
		
	
	//리스트 조회
	@RequestMapping("list.tp")
	public String selectList(@RequestParam(value="currentPage"
							,defaultValue = "1") int currentPage
							,Model model) {

		int listCount = boardService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagenation.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
		
		//게시글 리스트 조회
		ArrayList<TipBoard> list = boardService.selectList(pi);
		
		System.out.println("list.tp:: list" +list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "board/tipBoard/tipBoardListView";
	}
	
	
	//글 작성 페이지로 이동시키는 메소드 (포워딩)
	@GetMapping("insert.tp")
	public String insertBoard() {
		return "board/tipBoard/tipBoardEnrollForm";
	}
	
	
	//글 등록시키는 메소드
	@PostMapping("insert.tp")
	public ModelAndView insertTipBoard(TipBoard tb
									  ,ArrayList<MultipartFile> upfile
									  ,ModelAndView mv
									  ,HttpSession session) {
		
		System.out.println("insert.tp-- tb : "+tb);
		System.out.println("insert.tp-- upfile : "+upfile);
		
		ArrayList<TipAttach> talist = new ArrayList<>();
		
		// 첨부파일 리스트를 view에서 전달받은 만큼(upfile 수)만큼 반복
		for(int i=0; i<upfile.size(); i++) {
			// 파일이 존재하는지 확인
			if (!upfile.get(i).getOriginalFilename().equals("")) {//파일이 존재
			
				String changeName = saveFile(upfile.get(i),session);
				
				TipAttach tab= new TipAttach();
				
				tab.setTaOriginName(upfile.get(i).getOriginalFilename());
				tab.setTaChangeName("resources/tipBoardImg/"+changeName);
				
				talist.add(tab);
				System.out.println("talist:"+talist);
			}
		}

		
		if(talist.isEmpty()) { //글만 작성할때
			int result = boardService.insertTipBoard(tb);
			
			if(result>0) {
				System.out.println("등록완료");
				session.setAttribute("alertMsg", "게시글 등록 성공!");
				mv.addObject("talist",talist);
				mv.setViewName("redirect:/list.tp");
			}else {
				mv.addObject("errorMsg", "게시글 등록 실패!").setViewName("common/errorPage");
			}
				
		}else {//파일두개 등록할때
			int finalResult = boardService.insertTipBoard(tb,talist);
			
				if(finalResult>0) {
					System.out.println("등록완료");
					session.setAttribute("alertMsg", "게시글 등록 성공!");
					mv.setViewName("redirect:/list.tp");
				}else {
					mv.addObject("errorMsg", "게시글 등록 실패!").setViewName("common/errorPage");
				}
			}
		return mv;
	}



	 
	//게시글 상세보기
	@RequestMapping("detail.tbo")
	public ModelAndView detailBoard(@RequestParam(value="bno") int bno,
									ModelAndView mv) {
		
		//1.게시글 조회수 증가
		int result = boardService.increseCount(bno);
		
		//2.조회수 증가가 이루어지면 해당 게시글의 정보 조회
		if(result != 0) {
			TipBoard tb = boardService.selectBoard(bno);
			
			System.out.println("tb:"+tb);
			
			mv.addObject("tb", tb).setViewName("board/tipBoard/tipBoardDetailView");
		}else {
			mv.addObject("errorMsg", "게시글을 조회할 수 없습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	/*
	
	//게시글 수정페이지로 포워딩
	@RequestMapping("updateForm.ch")
	public String updateForm(Model model
							,int bno) {
		
		TipBoard cb = boardService.selectBoard(bno);
		
		model.addAttribute("cb", cb);
		
		return "board/tipBoard/tipBoardUpdateForm";
	}
	
	//게시글 수정
	@RequestMapping("update.tp")
	public ModelAndView updateBoard(TipBoard cb
							 ,MultipartFile upfile
							 ,HttpSession session
							 ,ModelAndView mv) {
							 
		//새로운 첨부파일이 있다면
		if(!upfile.getOriginalFilename().equals("")) {
			//기존 첨부파일이 있는경우 삭제
			if(cb.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(cb.getChangeName())).delete();
			}
			//새로운 첨부파일 등록
			String changeName = saveFile(upfile,session);
			cb.setTaOriginName(upfile.getOriginalFilename());
			cb.setTaChangeName("resources/tipBoardImg/" + changeName);
		}
		
		int result = boardService.updateBoard(cb);
		
		if(result != 0) {
			session.setAttribute("alertMsg", "게시글 수정 성공!");
			mv.setViewName("redirect:/detail.ch?bno=" + cb.getBoardNo() );
		}else {
			mv.addObject("errorMsg", "게시글 수정에 실패했습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	//게시글 삭제
	@RequestMapping("delete.tp")
	public String deleteBoard(int bno
							 ,String filePath
							 ,HttpSession session
							 ,Model model) {
		
		int result = boardService.deleteBoard(bno);
		
		if(result != 0) {
			
			if(!filePath.equals("")) {
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			session.setAttribute("alertMsg", "게시글 삭제 성공!");
			
		}else {
			model.addAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
			return "common/errorPage";
		}
		
		return "redirect:/list.tp";
	}
	
	
	//댓글 등록
	@ResponseBody
	@RequestMapping(value="insertReply.ch",produces="text/html; charset=UTF-8")
	public String insertReply(TipReply cr) {
		
		int result = boardService.insertReply(cr);
		
		return (result != 0) ? "NNNNY" : "NNNNN";
	}
	
	
	//댓글 리스트 조회
	@ResponseBody
	@RequestMapping(value="selectRlist.ch",produces="application/json; charset=UTF-8")
	public String selectReplyList(int boardNo) {
		
		ArrayList<TipReply> list = boardService.selectReplyList(boardNo);
		
		return new Gson().toJson(list);
	}
	
	
	//댓글 수정
	@ResponseBody
	@RequestMapping(value="updateReply.ch",produces="text/html; charset=UTF-8")
	public String updateReply(TipReply tr) {
		
		int result = boardService.updateReply(tr);
		
		return (result != 0) ? "NNNNY" : "NNNNN";
	}
	
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="deleteReply.tp",produces="text/html; charset=UTF-8")
	public String deleteReply(TipReply tr) {
		
		System.out.println(tr);
		
		int result = boardService.deleteReply(tr);
		
		return (result != 0) ? "NNNNY" : "NNNNN";
	}
	
	
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
