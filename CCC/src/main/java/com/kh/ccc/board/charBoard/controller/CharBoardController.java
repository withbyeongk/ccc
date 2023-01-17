package com.kh.ccc.board.charBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ccc.board.charBoard.model.service.CharBoardService;
import com.kh.ccc.board.charBoard.model.vo.CharAttach;
import com.kh.ccc.board.charBoard.model.vo.CharBoard;
import com.kh.ccc.board.charBoard.model.vo.CharLike;
import com.kh.ccc.board.charBoard.model.vo.CharReply;
import com.kh.ccc.board.charBoard.model.vo.Character;
import com.kh.ccc.common.model.vo.PageInfo;
import com.kh.ccc.common.model.vo.Ward;
import com.kh.ccc.common.template.Pagenation;
import com.kh.ccc.member.model.vo.Member;

@Controller
public class CharBoardController {

	@Autowired
	private CharBoardService boardService;
	
	//캐릭터 게시판 view로 이동
	@RequestMapping("list.ch")
	public String selectList(@RequestParam(value="currentPage",defaultValue="1") int currentPage,
							 Model model,HttpSession session) {
		
		//캐릭터 게시판 총 게시글 수 가져오기
		int listCount = boardService.selectListCount();
		int pageLimit = 10; //하단에 보여질 페이징바의 최대 개수
		int boardLimit = 6; //한 페이지에 보여질 게시글의 개수
		
		PageInfo pi = Pagenation.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
				
		//게시글 리스트 조회
		ArrayList<CharBoard> list = boardService.selectList(pi);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//로그인 유저가 있다면
		if( loginUser != null ) {
			int memberNo = loginUser.getMemberNo();
			//로그인 유저가 좋아요한 목록 조회
			ArrayList<CharLike> loginUserCheckLikeList = boardService.checkLikeList(memberNo);
			
			//조회해온 게시글 리스트와 로그인 유저가 좋아요한 목록의 좋아요 유무를 비교하고 (list의 게시글 번호 == loginUserCheckLikeList의 캐릭터 번호)
			//list에 좋아요 유무를 담아주는 로직
			for(int i=0; i<list.size(); i++) {
			    for(int j=0; j<loginUserCheckLikeList.size(); j++) {
			        if( list.get(i).getBoardNo() == loginUserCheckLikeList.get(j).getCharNo() ) {
			            list.get(i).setMemberLike(1);
			            break;
			        }
			    }
			}
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "board/charBoard/charBoardListView";	
			
		}//로그인 유저가 없다면
		else {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "board/charBoard/charBoardListView";			
		}
	}
	
	//캐릭터 게시판 글 등록 view로 이동
	@GetMapping("insert.ch")
	public String insertBoard() {
		return "board/charBoard/charBoardEnrollForm";
	}
	
	//캐릭터 게시판 글 등록
	@PostMapping("insert.ch")
	public ModelAndView insertCharBoard(CharBoard cb,ModelAndView mv,HttpSession session,
										@RequestParam(value="multifile", required=false) ArrayList<MultipartFile> upfileList) {
		//캐릭터 등록
		Character c = new Character();
		c.setMemberNo( cb.getBoardWriterNo() );
		c.setCharName( cb.getCharName() );
		c.setCharContent( cb.getBoardContent() );
		
		//첨부파일이 여러개 넘어올 수 있기 때문에 ArrayList에 담아주자
		ArrayList<CharAttach> caList = new ArrayList<>();
	
		//게시판 첨부파일 이미지 경로
		String charBoardFilePath = "resources/character/charBoardImg/";
		
		//등록 파일의 개수만큼 반복
		for(int i=0; i<upfileList.size(); i++) {
			
			//첨부파일 정보를 담을 객체 생성
			CharAttach ca = new CharAttach();
			
			//만약 첨부파일이 있다면 (파일명이 빈 문자열이 아니라면)
			if( !upfileList.get(i).getOriginalFilename().equals("") ) {
				//아래의 saveFile메서드 활용
				String boardFileChangeName = saveFile(upfileList.get(i), session, charBoardFilePath);
				
				//(아래에 이어)8.원본명,서버에 업로드한 경로를 Board객체에 담아주기
				ca.setOriginName( upfileList.get(i).getOriginalFilename() );
				ca.setChangeName( charBoardFilePath + boardFileChangeName );
				
				//level 1번 : 캐릭터 게시판 썸네일 / 이후 카운트되는 level은 sql에서 해당 게시글의 첨부파일 번호를 나타낸다 (파일번호와 다름)
				ca.setLevel(i+1);
				
				//게시글 첨부파일 리스트에 담기
				caList.add(ca);	
			}
		}
		//게시글 데이터,첨부파일 데이터,캐릭터 데이터 등록
		int result = boardService.insertCharBoard(cb,caList,c);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 등록 성공!");
			mv.setViewName("redirect:/list.ch");
		}else {
			mv.addObject("errorMsg", "게시글 등록 실패!").setViewName("common/errorPage");
		}
		return mv;
	}

	//글 등록시 넘어온 첨부파일 자체를 서버의 폴더에 저장시키는 메소드 (모듈)
	public String saveFile(MultipartFile upfile, HttpSession session, String filePath) {
		
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
		String savePath = session.getServletContext().getRealPath(filePath);
		
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
	
	//게시글 상세보기
	@RequestMapping("detail.ch")
	public ModelAndView detailBoard(@RequestParam(value="bno") int bno,
							ModelAndView mv) {
		
		//1.게시글 조회수 증가
		int result = boardService.increseCount(bno);
		
		//2.조회수 증가가 이루어지면 해당 게시글의 정보 조회
		if(result != 0) {
			CharBoard cb = boardService.selectBoard(bno);
			ArrayList<CharAttach> caList = boardService.selectAttach(bno);
		
			mv.addObject("cb", cb).addObject("caList", caList).setViewName("board/charBoard/charBoardDetailView");
		}else {
			mv.addObject("errorMsg", "게시글을 조회할 수 없습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//게시글 수정페이지로 포워딩
	@RequestMapping("updateForm.ch")
	public String updateForm(Model model
							,int bno) {
		
		CharBoard cb = boardService.selectBoard(bno);
		ArrayList<CharAttach> caList = boardService.selectAttach(bno);
		
		model.addAttribute("cb", cb);
		model.addAttribute("caList", caList);
		
		return "board/charBoard/charBoardUpdateForm";
	}
	
	//게시글 수정
	@RequestMapping("update.ch")
	public ModelAndView updateBoard(CharBoard updateCb, HttpSession session, ModelAndView mv,
		   @RequestParam(value="multifile", required=false) List<MultipartFile> upfileList,
		   @RequestParam(value="oldCa", required=false) List<Integer> oldCaList) {
		
		//게시글 번호를 이용해 해당 게시글의 기존 파일 정보를 가져온다
		int boardNo = updateCb.getBoardNo();
		ArrayList<CharAttach> caList = boardService.selectAttach(boardNo);
				
		//게시판 첨부파일 이미지 경로
		String charBoardFilePath = "resources/character/charBoardImg/";
 		
		//--------기존 첨부파일 수정 시작
		//기존 첨부파일이 없다면
		if( caList.isEmpty() ) {
			System.out.println("기존 첨부파일이 없습니다.");
		}
		else {
			//수정페이지에서 기존 파일 중 남겨놓은 첨부파일 빼고 삭제
			int delAttachResult = 0;
			int deleteAllOldAttach = 0;
			String realPath = "";
				//삭제 선택된 기존의 첨부파일 삭제 (수정페이지에서 기존 첨부파일을 지우지 않았다면==기존 파일이 있다면)
				if( oldCaList != null ) {
					for(CharAttach ca : caList) {
						//기존 파일의 레벨 번호가 없다면
						if(!oldCaList.contains(ca.getLevel())) { 
							CharAttach deleteCa = new CharAttach();
							deleteCa.setLevel(ca.getLevel());
							deleteCa.setRefBno(boardNo);
							
							//기존파일의 레벨과 게시글 번호를 가지고 기존 첨부파일을 삭제
							delAttachResult = boardService.deleteCharAttachByCaNo(deleteCa);
							
							realPath = session.getServletContext().getRealPath(ca.getChangeName());
							new File(realPath).delete();
							
							//기존 첨부파일 삭제에 실패했을 경우
							if(delAttachResult == 0) {
								mv.addObject("errorMsg", "기존 첨부파일 삭제 실패").setViewName("common/errorPage");
								return mv;
							}
						}
					}
				}else { //기존 첨부파일을 다 지웠으면 (null이면)
					//기존 첨부파일 모두 DB에서 제거 (게시글번호 이용)
					deleteAllOldAttach = boardService.deleteAllOldAttach(boardNo);
					//기존 첨부파일의 실제 파일 경로로 파일 제거
					for( CharAttach ca : caList ) {
						realPath = session.getServletContext().getRealPath(ca.getChangeName());
						new File(realPath).delete();						
					}
					
					if( deleteAllOldAttach == 0 ) {
						mv.addObject("errorMsg", "기존 첨부파일 모두 삭제 실패").setViewName("common/errorPage");
						return mv;
					}
					
				}
		}
		//--------기존 첨부파일 끝
		
		//캐릭터 수정내용 담기 (캐릭터 이름,캐릭터 설명 / 캐릭터의 번호를 조건으로 수정)
		Character updateCharacter = new Character();
		updateCharacter.setCharNo(updateCb.getCharNo());
		updateCharacter.setCharName(updateCb.getCharName());
		updateCharacter.setCharContent(updateCb.getBoardContent());
		
		//새롭게 추가된 첨부파일을 담기 위한 리스트 생성
		ArrayList<CharAttach> updateCaList = new ArrayList<>();
		//첨부파일 순서를 정하기 위한 리스트 생성
		List<Integer> checkList = new ArrayList<>(Arrays.asList(1, 2, 3, 4));
		
		//기존 첨부파일의 번호(레벨)중 1,2,3,4와 같은 번호가 있다면 체크 리스트의 번호를 삭제
		if( oldCaList != null ) {
			for (int i = 0; i < checkList.size(); i++) {
				if (oldCaList.contains(checkList.get(i))) {
					checkList.remove(i);
					i--;
				}
			}			
		}
		
		//--------새로운 첨부파일 시작
		int result = 0; //결과값을 담을 변수
		String changeName = "";
		if(upfileList != null) { //게시글 수정 시 새로운 첨부파일이 있다면
			for(int i=0; i<upfileList.size(); i++) {
				if(!upfileList.get(i).getOriginalFilename().equals("")) { //객체는 있지만 데이터가 존재하는지 한번 더 체크
					//새로 등록한 파일 정보를 담을 객체를 생성 
					CharAttach ca = new CharAttach();
					
					if( oldCaList != null ) { //기존 첨부파일중에 삭제하지않은 파일이 있다면
						ca.setLevel(checkList.get(i)); //새로운 첨부파일의 레벨 번호는 기존 번호의 다음 번호로 등록

						changeName = saveFile(upfileList.get(i),session,charBoardFilePath);
						ca.setRefBno(updateCb.getBoardNo()); //수정 게시글 번호
						ca.setOriginName(upfileList.get(i).getOriginalFilename()); //첨부파일 원본명
						ca.setChangeName(charBoardFilePath+changeName); //변경된 파일 이름
					}
					else { //기존 첨부파일을 모두 삭제했다면
						changeName = saveFile(upfileList.get(i),session,charBoardFilePath);
						ca.setRefBno(updateCb.getBoardNo()); //수정 게시글 번호
						ca.setOriginName(upfileList.get(i).getOriginalFilename()); //첨부파일 원본명
						ca.setChangeName(charBoardFilePath+changeName); //변경된 파일 이름
						ca.setLevel(i+1);
					}
					//새로운 파일 정보를 배열로 담는다
					updateCaList.add(ca);
				}
			}
			//게시글 수정 내용 (글 제목,캐릭터 이름,캐릭터 설명,새로운 첨부파일 등록)
			result = boardService.updateCharBoard(updateCb,updateCharacter,updateCaList);
			
			if(result != 0) {
				session.setAttribute("alertMsg", "게시글 수정 성공!");
				mv.setViewName("redirect:/detail.ch?bno=" + boardNo);
			}
			else {
				mv.addObject("errorMsg", "게시글 수정에 실패했습니다.").setViewName("common/errorPage");
			}
			return mv;
			
		}else { //기존의 첨부파일을 수정하지 않고 나머지를 수정한 경우
			//게시글 수정 내용 (글 제목,캐릭터 이름,캐릭터 설명 등록 / 첨부파일 제외)
			result = boardService.updateCharBoard(updateCb,updateCharacter);
			
			if(result != 0) {
				session.setAttribute("alertMsg", "게시글 수정 성공!");
				mv.setViewName("redirect:/detail.ch?bno=" + boardNo);
			}
			else {
				mv.addObject("errorMsg", "게시글 수정에 실패했습니다.").setViewName("common/errorPage");
			}
			return mv;
		}
		//--------새로운 첨부파일 끝
		
	}
			
	//게시글 삭제
	@RequestMapping("delete.ch")
	public String deleteBoard(int bno
							 ,HttpSession session
							 ,Model model) {
		
		//JSP에서 넘긴 글번호의 첨부파일 리스트를 받아오자
		ArrayList<CharAttach> caList = boardService.selectAttach(bno);
		//게시글 번호의 글과 첨부파일 삭제하는 메소드
		int result = boardService.deleteBoard(bno);
		
		if(result != 0) {
			for(int i=0; i<caList.size(); i++) {
				if(!caList.get(i).equals("")) {
					String realPath = session.getServletContext().getRealPath(caList.get(i).getChangeName());
					new File(realPath).delete();
				}
			}
			session.setAttribute("alertMsg", "게시글 삭제에 성공했습니다!");
		}
		else {
			model.addAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
			return "common/errorPage";
		}
		return "redirect:/list.ch";
	}
	
	//좋아요 조회
	@ResponseBody
	@RequestMapping(value="selectLike.ch",produces="text/html; charset=UTF-8")
	public String selectLike(CharLike cl) {
		
		CharLike clResult = boardService.selectLike(cl);
		
		return clResult.getCharLike()==0 ? "NNNNN" : "NNNNY";
		
	}
	
	//좋아요/좋아요 취소 (캐릭터)
	@ResponseBody
	@RequestMapping(value="insertLike.ch",produces="text/html; charset=UTF-8")
	public String insertLike(CharLike cl) {
	
		//좋아요 데이터가 있는지 조회
		CharLike clSelect = boardService.selectLike(cl);
			
		//좋아요가 없다면 좋아요 등록
		if( (clSelect.getCharLike() == 0) ) {
			//TB_CHARACTER_LIKE / TB_CHARACTER 테이블에 좋아요 추가
			int insertResult = boardService.insertLike(cl);
			
			return insertResult != 0 ? "NNNNY" : "NNNNN";
		}
		else {//좋아요가 있다면 좋아요 취소
			//TB_CHARACTER_LIKE / TB_CHARACTER 테이블에 좋아요 삭제
			int deleteResult = boardService.deleteLike(cl);
			
			return deleteResult != 0 ? "NNNNN" : "NNNNY";
		}
	}
	
	//게시판 리스트에서 좋아요/취소 (캐릭터)
	@ResponseBody
	@RequestMapping(value="boardListLike.ch",produces="text/html; charset=UTF-8")
	public String charBoardListLike(CharLike cl) {
		
		//좋아요 데이터가 있는지 조회
		CharLike clSelect = boardService.selectLike(cl);
		
		//좋아요가 없다면 좋아요 등록
		if( (clSelect.getCharLike() == 0) ) {
			//TB_CHARACTER_LIKE / TB_CHARACTER 테이블에 좋아요 추가
			int insertResult = boardService.insertLike(cl);
			
			return insertResult != 0 ? "NNNNY" : "NNNNN";
		}
		else {//좋아요가 있다면 좋아요 취소
			//TB_CHARACTER_LIKE / TB_CHARACTER 테이블에 좋아요 삭제
			int deleteResult = boardService.deleteLike(cl);
			
			return deleteResult != 0 ? "NNNNN" : "NNNNY";
		}
	}
	
	//댓글 등록
	@ResponseBody
	@RequestMapping(value="insertReply.ch",produces="text/html; charset=UTF-8")
	public String insertReply(CharReply cr) {
		
		int result = boardService.insertReply(cr);
		
		return (result != 0) ? "NNNNY" : "NNNNN";
	}
	
	//댓글 리스트 조회
	@ResponseBody
	@RequestMapping(value="selectRlist.ch",produces="application/json; charset=UTF-8")
	public String selectReplyList(int boardNo) {
		
		ArrayList<CharReply> list = boardService.selectReplyList(boardNo);
			
		return new Gson().toJson(list);
	}
	
	//댓글 수정
	@ResponseBody
	@RequestMapping(value="updateReply.ch",produces="text/html; charset=UTF-8")
	public String updateReply(CharReply cr) {
		
		int result = boardService.updateReply(cr);
		
		return (result != 0) ? "NNNNY" : "NNNNN";
	}
	
	//댓글 등록
	@ResponseBody
	@RequestMapping(value="replyAnswer.ch",produces="text/html; charset=UTF-8")
	public String insertReplyAnswer(CharReply cr, HttpSession session) {
		
		//int reWriterNo = session.getAttribute("회원번호"); //(ajax에서 넘어옴)
		int number = boardService.replyMaxNum();   //새 댓글 번호 생성, 참조댓글번호(reGroupNo)는 부모댓글번호(reNo)와 같다 (시퀀스가 필요없다)
		
		int reStep = 0, reLevel = 0; 		  //대댓글의 순서와 계층은 0으로 기본 세팅
		int refBno = cr.getRefBno(); 		  //댓글을 단 게시글 번호 (ajax에서 넘어옴)
		
		//어떤 댓글에 댓글을 남긴건지 (ajax에서 넘어옴)
		//처음 작성하는 부모댓글은 이 시점에서는 댓글 번호가 담기지 않는다
		int reNo = cr.getReNo();	 	  	  
		
		//부모댓글번호 -부모 자기 자신은 자신의 번호를 reParentNo로 갖는다
		//위의 maxNum 메소드로 댓글의 번호를 생성하지만 아직 댓글 번호를 넣지 않은 시점이기 때문에
		//댓글의 답글을 작성하는 경우에만 jsp에서 해당 부모 댓글번호를 가져와 reParentNo에 담긴다
		int reParentNo = cr.getReNo();
		
		String reContent = cr.getReContent(); //대댓글의 내용 (ajax에서 넘어옴)
		
		if(reNo != 0) { //댓글의 번호가 있다면 (댓글에 댓글을 다는 경우)
			
			CharReply cr1 = boardService.replySelect(reNo); //읽어온 댓글의 reStep과 re_level을 알기 위해서
		
			//대댓글의 첫 댓글일 때
			if(cr1.getReStep() == 0 && cr1.getReLevel() == 0) {
				cr.setReGroupNo(reNo); 	//대댓글끼리 그룹핑하기 위해 부모댓글의 번호로 참조댓글번호 세팅
				cr.setReParentNo(reNo);	//대댓글의 부모 번호를 세팅
				int maxStep = boardService.maxStep(cr1.getReGroupNo()); //새로운 대댓글을 작성하면 아래로 가도록 하기위해
				cr.setReStep(maxStep);
				cr.setReLevel(cr1.getReLevel() + 1);
			}
			else { //대댓글의 두번째 댓글 부터
				cr.setReGroupNo(cr1.getReGroupNo()); //대댓글끼리 뭉치기위해,부모댓글의 댓글번호로 reGroupNo세팅
				cr.setReParentNo(reNo);	//대댓글의 부모 번호를 세팅
				cr.setReStep(cr1.getReStep()); 		
				//새로운 댓글은 댓글 사이에 끼어야하기 때문에
				//새로 작성된 대댓글의 그룹번호(부모번호)가 같고 reStep(대댓의 순서)이 해당 댓글의 순서보다 크면 그 댓글보다 reStep + 1을 해준다
				boardService.updateStep(cr);
				
				cr.setReGroupNo(cr1.getReGroupNo());
				cr.setReStep(cr1.getReStep() + 1); 	 //부모댓글의 step보다 +1 증가
				cr.setReLevel(cr1.getReLevel() + 1); //부모댓글의 level보다 +1 증가
			}

		}else { //댓글의 번호가 없다면 (부모댓글의 경우)
			cr.setReGroupNo(number);
			cr.setReParentNo(number);//첫 댓글에는 자기 자신의 번호로 부모 번호를 세팅
			cr.setReStep(reStep); 	 //기본 댓글에는 0으로 세팅
			cr.setReLevel(reLevel);  //기본 댓글에는 0으로 세팅
		}
		cr.setReContent(reContent); 	//댓글 내용 담기
		cr.setReNo(number);				//새로 생성한 댓글의 번호 담기
		cr.setRefBno(refBno); 			//댓글이 작성된 게시글 번호 담기
		//cr.setReWriter(reWriter); 	//댓글 작성자 (아직 안넣음)
		
		int result = boardService.insertReply(cr);
		
		return (result != 0) ? "NNNNY" : "NNNNN";
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="deleteReply.ch",produces="text/html; charset=UTF-8")
	public String deleteReply(CharReply cr) {
		
		int result = boardService.deleteReply(cr);
		
		System.out.println("댓글의 삭제 데이터 : "+ cr);
			
		return (result != 0) ? "NNNNY" : "NNNNN";
	}
	
	//비속어 필터링
	@ResponseBody
	@RequestMapping(value="badLanguage.ch",produces="text/html; charset=UTF-8")
	public String badLanguage(CharBoard cb) {
		
		ArrayList<Ward> wList = boardService.badLanguage();
	
		for(int i=0; i<wList.size(); i++) {
			if( cb.getBoardTitle().contains(wList.get(i).getWardName()) ){
				return "NNNNY"; 
			}else if( cb.getCharName().contains(wList.get(i).getWardName()) ) {
				return "NNNNY";
			}else if( cb.getBoardContent().contains(wList.get(i).getWardName()) ) {
				return "NNNNY";
			}
		}
		return "NNNNN";
	}

	//캐릭터 게시판  리스트 검색기능
	@RequestMapping("search.ch")
	public ModelAndView searchList(@RequestParam(value="currentPage",defaultValue="1") int currentPage,
							 String condition, String keyword, ModelAndView mv) {
	
		HashMap<String,String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		//검색 결과의 총 개수를 조회하는 메소드
		int searchCount = boardService.searchCount(map);
		int pageLimit = 10;
		int boardLimit = 6;
		
		PageInfo pi = Pagenation.getPageinfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<CharBoard> searchList = boardService.charBoardSearch(map,pi);
		
		mv.addObject("list", searchList).addObject("pi", pi);
		mv.addObject("condition", condition).addObject("keyword", keyword);
		mv.setViewName("board/charBoard/charBoardListView");
		
		return mv;
	}
	
	//검색어 자동완성 기능
//	@ResponseBody
//	@RequestMapping(value="searchRecommend.ch", method = RequestMethod.GET, produces="text/plain; charset=UTF-8")
//	public String searchRecommend(Locale locale, Model model) {
//		
//		String[] array = {"폼폼푸린","열무","프랭크","킹냥","고먐미"};
//		
//		Gson gson = new Gson();
//		
//		return gson.toJson(array);
//	}
	
				
	

	
}
