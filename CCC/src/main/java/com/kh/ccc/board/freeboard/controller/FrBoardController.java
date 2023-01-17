package com.kh.ccc.board.freeboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ccc.admin.model.vo.Admin;
import com.kh.ccc.board.freeboard.model.service.FrBoardService;
import com.kh.ccc.board.freeboard.model.vo.FrBoard;
import com.kh.ccc.board.freeboard.model.vo.FrBoardAttach;
import com.kh.ccc.board.freeboard.model.vo.FrBoardReply;
import com.kh.ccc.common.model.vo.PageInfo;
import com.kh.ccc.common.template.Pagenation;
import com.kh.ccc.member.model.vo.Member;

@Controller
public class FrBoardController {

	@Autowired
	private FrBoardService FrBoardService;
	

	
	
	
	
	//view 페이지 포워딩 
		@RequestMapping("list.fr")
		public ModelAndView selectList(@RequestParam(value="currentPage",defaultValue="1")int currentPage,
													ModelAndView  mv,HttpSession session) {


	//		작업중
//			Member loginUser = (Member)session.getAttribute("loginUser");
//			int fWriterNo =loginUser.getmNo();
	
		
			int listCount = FrBoardService.selectListCount(); //총 게시글 개수  db에서 조회해오기 .
			
			int pageLimit = 10;	//하단에 페이징바 갯수
			int boardLimit =5; //한페이지에 몇개씩 띄울껀지!
			
			PageInfo pi=Pagenation.getPageinfo(listCount, currentPage, pageLimit, boardLimit);
			
			//아래는 게시글 조회 
			ArrayList<FrBoard> list = FrBoardService.selectList(pi);
				
			mv.addObject("list", list);
			mv.addObject("pi",pi);  //페이징바 처리해줄 
			
			mv.setViewName("board/freeBoard/freeBoardListView");

			return mv;
		}
	
		//아래는 게시물 상세보기 
		@RequestMapping("detail.fbo")
		public ModelAndView boardDetailView(int fno,ModelAndView mv,HttpSession session) {
			System.out.println("fno"+fno);
			
			//아래는 조회수 증가 
			int result=FrBoardService.increaseCount(fno);
			if(result>0) {
				//아래는 조회 
				ArrayList<FrBoard> fb=FrBoardService.frboardDetailView(fno);
				
				//아래는 파일만 가져오기 
				
				ArrayList<FrBoardAttach> frba= FrBoardService.frboardAttDetailView(fno);
				
				mv.addObject("frba",frba);
				mv.addObject("fb",fb);
				mv.setViewName("board/freeBoard/freeBoardDetailView"); //한줄작성가능
				
			}else {
				mv.addObject("errorMsg","쉴패").setViewName("common/errorPage");
			}
			
			return mv;
		}
		//////.//글쓰기
		//아래는 글쓰기 누르면 글작성 폼으로 이동 
		@GetMapping("insert.fpom")
		public String insertFrPomBoard() {
			return "board/freeBoard/frBoardEnrollForm";
		}
		
		
		//아래는 게시글 등록 (사진포함)
				
				@RequestMapping("insert.frbo")
				public ModelAndView insertFrBoard(ModelAndView mv,FrBoard fb,
						@RequestParam(value="upfile", required=false) List<MultipartFile> upfile
						,HttpSession session) {
					System.out.println("fb : "+fb);
					
					Member loginUser = (Member)session.getAttribute("loginUser");
					System.out.println("upfile"+upfile);
					//ArrayList로  첨부파일들을 담음.
					ArrayList<FrBoardAttach> falist = new ArrayList<>();
					
					
					/////////////////////////////////병철이형 부분 시작 
					/////////////////////////////////병철이형 부분 시작 
					/////////////////////////////////병철이형 부분 시작 
//					// 파일 갯수만큼 
//					for(int i=0; i<upfile.size(); i++) {
//						//아래는 파일이 있으면 
//						if (!upfile.get(i).getOriginalFilename().equals("")) {
//							//saveFile 메소드에   올린 파일을 담아서  changename 변수에 담아준다.(saveFile을 아래 153줄 참고)
//							String changeName = saveFile(upfile.get(i),session);
//							
//							FrBoardAttach fab= new FrBoardAttach();
//							
//							fab.setFaOrginName(upfile.get(i).getOriginalFilename());
//							fab.setFaChangeName("resources/freeBoard/uploadFiles/"+changeName);
//							
//							falist.add(fab);
//							}
//						}
//				
//					if(falist.isEmpty()) { //글만 작성할때
//						int result1=FrBoardService.insertFrBoardOnlyWrite(fb);
//						
//							if(result1>0) {
//								session.setAttribute("alertMsg", "게시글 등록 성공!");
//								mv.setViewName("redirect:/list.fr");
//							}else {
//								mv.addObject("errorMsg", "게시글 등록 실패!").setViewName("common/errorPage");
//								}
//					}else {//파일두개 등록할때
//						int finalResult=FrBoardService.insertFrBoard(fb,falist);
//							if(finalResult>0) {
//								System.out.println("finalResult"+finalResult);
//								session.setAttribute("alertMsg", "게시글 등록 성공!");
//								mv.setViewName("redirect:/list.fr");
//								
//							}else {
//								mv.addObject("errorMsg", "게시글 등록 실패!").setViewName("common/errorPage");
//							}
//						}
					
					/////////////////////////////////병철이형 부분 끝
					/////////////////////////////////병철이형 부분 끝
					/////////////////////////////////병철이형 부분 끝
					/////////////////////////////////병철이형 부분 끝
					
					
					
					
					// 여기아래는 내가 했던부분  시작 
					// * 
					
			
					
					//아래는 파일 갯수만큼  반복문을 돌려줌
					for(int i=0; i<upfile.size(); i++) {
							//아래는 파일이 있으면 
						if (!upfile.get(i).getOriginalFilename().equals("")) {
							//saveFile 메소드에   올린 파일을 담아서  changename 변수에 담아준다.(saveFile을 아래 153줄 참고)
							String changeName = saveFile(upfile.get(i),session);
							
							FrBoardAttach fab= new FrBoardAttach();
							
							fab.setFaOrginName(upfile.get(i).getOriginalFilename());
							fab.setFaChangeName("resources/freeBoard/uploadFiles/"+changeName);
							
							falist.add(fab);
							System.out.println("컨트롤러 falist 는 ? "+falist);
						}
					}
					
					
					if(falist.isEmpty()) { //글만 작성할때
						int result1=FrBoardService.insertFrBoardOnlyWrite(fb);
						
							if(result1>0) {
								session.setAttribute("alertMsg", "게시글 등록 성공!");
								mv.setViewName("redirect:/list.fr");
							}else {
								mv.addObject("errorMsg", "게시글 등록 실패!").setViewName("common/errorPage");
								}
					}else {//파일두개 등록할때
						int finalResult=FrBoardService.insertFrBoard(fb,falist);
						
							if(finalResult>0) {
								session.setAttribute("alertMsg", "게시글 등록 성공!");
								mv.setViewName("redirect:/list.fr");
							}else {
								mv.addObject("errorMsg", "게시글 등록 실패!").setViewName("common/errorPage");
							}
						}
					
					return mv;
				}
					
					
					
					
		// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 메소드 (모듈)
			public String saveFile(MultipartFile upfile, HttpSession session) {
				// 1. 원본파일명 뽑기
				String originName = ((MultipartFile) upfile).getOriginalFilename();
				// 2. 시간형식을 문자열로 뽑기
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				// 3. 뒤에 붙일 랜덤값 뽑기
				int ranNum = (int) (Math.random() * 90000 + 10000); // 5자리 랜덤값
				
				// 4. 아래는 원본 파일명으로부터 확장자명 뽑아오기
				String ext=null; //StringIndexOutOfBoundsException 가 뜨기 때문에 아래는 파일이 있는지 없는지 확인해준다 
				
				ext = originName.substring(originName.lastIndexOf("."));
				
				// 5. 뽑아놓은 값 전부 붙여서 파일명 만들기				
				String changeName = currentTime + ranNum + ext;
				// 6. 업로드 하고자 하는 실제 위치 경로 지정해주기 (실제 경로. 8번 changeName이랑 비교)
				String savePath = session.getServletContext().getRealPath("/resources/freeBoard/uploadFiles/");
				// 7. 경로와 수정파일명 합쳐서 파일을 업로드해주기
				try {
					((MultipartFile) upfile).transferTo(new File(savePath + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return changeName;
			}
		
			
			//아래는 지유게시판 글 삭제하기 
			@RequestMapping("delete.frbo")
			public String frboardDelete(int fno, String filePath, ModelAndView mv, HttpSession session) {

							int result = FrBoardService.frboardDelete(fno);
			
							if (result > 0) {
								if (!filePath.equals("")) {
									// 파일이 있는경우 삭제
									// 물리적인 경로 찾기
									String realPath = session.getServletContext().getRealPath(filePath);
			
									// 해당 경로와 연결시켜 파일객체 생성후 삭제 메소드(해당 파일 삭제)
									new File(realPath).delete();
									
									//DB에 DATA 도 삭제 
									int deResult=FrBoardService.frboardDbDelete(fno);
									if(deResult>0) {
										session.setAttribute("alertMsg", "삭제성공!");
										mv.setViewName("freeBoard/freeBoardListView");
									}else {
										session.setAttribute("alertMsg", "삭제실패!");
									}
									session.setAttribute("alertMsg", "삭제성공!");
									mv.setViewName("freeBoard/freeBoardListView");
							}else {
								//파일이 비어있으면
								mv.setViewName("freeBoard/freeBoardListView");
							}
					}else { //물리경로 삭제 실패했으면
						session.setAttribute("alertMsg", "삭제실패!");
						mv.setViewName("common/errorPage");
				}
							return "redirect:/list.fr";
			}
					
			//아래는 수정하기 누르면 폼으로 가는거
		
			@RequestMapping(value="update.frbo")
			public ModelAndView updateFrboardForm(int fno,ModelAndView mv) {
				
				//아래는 글번호로 가져온 fb들 
				ArrayList<FrBoard> fb=FrBoardService.frboardDetailView(fno);
				
				//아래는 글번호로 가져온 frba
				ArrayList<FrBoardAttach> frba= FrBoardService.frboardAttDetailView(fno);
				
				mv.addObject("fb",fb);
				mv.addObject("frba",frba);
				mv.setViewName("board/freeBoard/freeBoardUpdateForm");
				
				return mv;
			}
			
			//아래는 수정 폼에서 등록하기 누르면~
			@RequestMapping("update.frboen")
//			public ModelAndView updateFrboard(ArrayList<MultipartFile> upfile,FrBoard fb,ModelAndView mv
//												,HttpSession session)
			
			public ModelAndView updateFrboard(ModelAndView mv
											 ,FrBoard fb
											 ,@RequestParam(value="upfile" ,required=false) List<MultipartFile> upfile
											 ,@RequestParam(value="oldNa", required=false) ArrayList<Integer> oldNaList
											 ,HttpSession session) {
				// view에서 전달받은 데이터 확인
			    System.out.println("update.frboen :: CTRL :: fb = " + fb);
			    System.out.println("update.frboen :: CTRL :: upfile = " + upfile);
				int fno = fb.getfNo();
				
				// 해당 글의 기존 첨부파일이 있을 경우 삭제 --------------Start
				
				// 아래는 게시판 글번호를 이용해서 게시글의 파일 정보를 가져온다 . 기존 글 첨부파일 
				ArrayList<FrBoardAttach> frba= FrBoardService.frboardAttDetailView(fno);
			
				// 새로 올릴 파일 리스트
				ArrayList<FrBoardAttach> newfrba = new ArrayList<>();
				
				
				
				
				
				
				//여기는아래는  병철이형 부분 
				//여기는아래는  병철이형 부분 
				//여기는아래는  병철이형 부분 
				// 기존 첨부파일이 비어있으면 
				
				/*
				if(frba.isEmpty()) {
					System.out.println("기존 첨부파일 없음.");
					
					int result1 =FrBoardService.updateFrboard1(fb);
					if(result1>0) {
						mv.addObject("fb",fb);
						//여기 아래에서 fb.getfno 를 가져가는 이유가 뭘까 ..
						mv.setViewName("redirect:/detail.fbo?fno="+fb.getfNo());
					}else {
						mv.addObject("errorMsg", "게시글  글 수정 실패!").setViewName("common/errorPage");
					}
					
					
					for(int j=0; j<upfile.size(); j++) {
						if(!upfile.get(j).getOriginalFilename().equals("")) { // 비어있지않으면!
							//새로운 첨부파일 업로드 
							String changeName = saveFile(upfile.get(j),session);//아래에서 작업한 saveFile메소드 사용 
							//아래는 attach 빈거 하나 만들고 ! 
							FrBoardAttach fat = new FrBoardAttach();
							//빈 attach 에  경로 붙여진+changename
							fat.setfNo(fno);
							fat.setFaNo(frba.get(j).getFaNo());
							fat.setFaChangeName("resources/freeBoard/uploadFiles/"+changeName);
							fat.setFaOrginName(upfile.get(j).getOriginalFilename());
	//						System.out.println("update.frboen :: CTRL :: 담기전 fat = : " + fat);
							newfrba.add(fat);
						}
					}
					
				}else if(!frba.isEmpty()){
					//파일이 있으면 삭제 후 insert
					//현재 남아있는것을 제외하고 첨부파일 삭제 
					int delAttachResult = 0 ;
					for(int k=0; k<frba.size(); k++) {
						//아래는 만약 올린파일이 있으면 삭제 
						if(frba.get(k).getFaOrginName()!=null) {
							// 물리아래는  경로에서 삭제
							new File(session.getServletContext().getRealPath(frba.get(k).getFaChangeName())).delete();
							
							// 아래는 DB에서 삭제
							
						}
					}
				
				//여기는위에는  병철이형 부분 
				//여기는위에는  병철이형 부분 
				//여기는위에는  병철이형 부분 
				
				*/
				
				
				// 내가올린 파일이있으면 반복문 돌려  내가 올린 파일 사이즈만큼!
				// 그리고 지워. 기존꺼 전부 삭제
				
					for(int k=0; k<frba.size(); k++) {
						//아래는 만약 올린파일이 있으면 삭제 
						if(frba.get(k).getFaOrginName()!=null) {
							//아래는 물리 경로에서 삭제
							new File(session.getServletContext().getRealPath(frba.get(k).getFaChangeName())).delete();
							// DB에서 삭제
							System.out.println("frba에 fNo 있는지 확인"+frba);
							
						}
					}
					int result=FrBoardService.deleteFrFile(frba.get(0).getfNo());
				
					if(result>0) {
						System.out.println("db삭제 성공");
					}else {
						System.out.println("db삭제 실패");
					}
					
					//아래는 이제 새로운 첨부파일 업로드 할껀데  업로드 파일 몇개야 ?
					for(int j=0; j<upfile.size(); j++) {
						if(!upfile.get(j).getOriginalFilename().equals("")) { // 비어있지않으면!
							//새로운 첨부파일 업로드 
							String changeName = saveFile(upfile.get(j),session);//아래에서 작업한 saveFile메소드 사용 
							
							//아래는 attach 빈거 하나 만들고 ! 
							FrBoardAttach fat = new FrBoardAttach();
							//빈 attach 에  경로 붙여진+changename
							fat.setfNo(fno);
							fat.setFaNo(frba.get(j).getFaNo());
							fat.setFaChangeName("resources/freeBoard/uploadFiles/"+changeName);
							fat.setFaOrginName(upfile.get(j).getOriginalFilename());
	//						System.out.println("update.frboen :: CTRL :: 담기전 fat = : " + fat);
							newfrba.add(fat);
							System.out.println("newfrba?????????"+newfrba);
						}
					}
				
					System.out.println("update.frboen :: 파일삭제 후. 글 수정 전");
					//파일이 있으면
					if(!frba.isEmpty()) {
						//아래는 글만 변경 (첨부파일은 없고) 
						int result1 =FrBoardService.updateFrboard1(fb);
						//아래는 첨부파일만 변경
						// 새 첨부파일 insert
						int result2 = FrBoardService.updateFrboard2(newfrba);
						int result3=result1+result2;
						
						if(result3>0) {
							mv.addObject("fb",fb);
							mv.addObject("frba",newfrba);
							
			
							mv.setViewName("redirect:/detail.fbo?fno="+fb.getfNo());
						}else {
							mv.addObject("errorMsg", "게시글 글,첨부 수정 실패!").setViewName("common/errorPage");
						}
						
					}else {
						//글만변경
						int result1 =FrBoardService.updateFrboard1(fb);
						if(result1>0) {
							mv.addObject("fb",fb);
							//여기 아래에서 fb.getfno 를 가져가는 이유가 뭘까 ..
							mv.setViewName("redirect:/detail.fbo?fno="+fb.getfNo());
						}else {
							mv.addObject("errorMsg", "게시글  글 수정 실패!").setViewName("common/errorPage");
						}
					}
					//상세보기로 이동
					return mv;
				}
		
			
			//아래는 게시판 detail 뷰 댓글 전체조회 
			@ResponseBody
			@RequestMapping(value="frlist.fbo",produces="application/json; charset=UTF-8")
			public String detailFrBoardReviewSelect(int fno, ModelAndView mv,HttpSession session) {
				ArrayList<FrBoardReply> rlist=FrBoardService.detailFrBoardReviewSelect(fno);
				System.out.println("디테일 댓글조회 : rlist는????"+rlist);

				return new Gson().toJson(rlist);
			}
			
			//아래는 댓글 등록 
			@ResponseBody
			@RequestMapping(value="frInsert.fbo",produces="text/html; charset=UTF-8")
			public String insertFrReply(FrBoardReply refb) {
				System.out.println("refb 댓글1"+refb);
				int result = FrBoardService.insertFrReply(refb);
				System.out.println("refb 댓글2"+refb);
				System.out.println("댓글등록 성공했으면1: "+result); 
				return result>0 ? "yes" : "no";
			}
			
			//아래는 댓글 수정 
			@ResponseBody
			@RequestMapping(value="updateFrReply.fr",produces="text/html; charset=UTF-8")
			public String frReplyModify(ModelAndView mv,FrBoardReply refb) {
				System.out.println("refb는..?? "+refb);
				int result=FrBoardService.frReplyModify(refb);
				System.out.println("수정"+result);
				//아래 결과가  0이면 N  , 1이면 Y 
				return (result == 0) ? "NNNNN" : "NNNNY";
				
			}
			
			//아래는 체크한 글 삭제 
			@ResponseBody
			@RequestMapping("deleteClickFrboard.ad")
			public String deleteClickFrboard(HttpServletRequest request,@RequestParam(value="checkBoxArr[]") List<String> fNo) throws Exception {
					
				
				int result = FrBoardService.deleteClickFrboard(fNo);
				
				return result>0 ? "yes":"no";
				
			}
			
			
			//아래는 댓글 삭제 
			@ResponseBody
			@RequestMapping("deleteFrReply.fr")
			public String deleteReply(HttpServletRequest request
									  ,FrBoardReply refb) {
					
				System.out.println("refb"+refb);
				
				int result = FrBoardService.deleteReply(refb);
				System.out.println("댓글 삭제 컨트롤러 result"+result);
				return result>0 ? "yes":"no";
				
			}
			
			//아래는 검색기능 
//			@ResponseBody
//			@RequestMapping(value="search.fr",produces="application/json; charset=UTF-8")
			@RequestMapping("search.fr")
			public ModelAndView frSearchList(HttpSession session,HttpServletRequest request
												,@RequestParam(value="currentPage",defaultValue="1")int currentPage
												,ModelAndView mv,Model mo) {
				
				String category = request.getParameter("category");
				String keyword = request.getParameter("keyword");
				
				
				//이제 키와 벨류값을 담아서 전달하자  (hashmap)
				HashMap<String,String> map = new HashMap<>();
				map.put("category",category);
				map.put("keyword",keyword);
				
				int searchCount = FrBoardService.searchCount(map); //검색 결과의 총 개수를 알아와야함 
				
				int pageLimit = 10;	//하단에 페이징바 갯수
				int boardLimit =5; //한페이지에 몇개씩 띄울껀지!
				
				PageInfo pi=Pagenation.getPageinfo(searchCount, currentPage, pageLimit, boardLimit);
				
				
				ArrayList<FrBoard> list=FrBoardService.frSearchList(map,pi);
				mv.addObject("list",list);
				mv.setViewName("board/freeBoard/freeBoardListView");
				System.out.println("컨트롤러 임 searchList은 ? : "+list);
				return mv;
//				return new Gson().toJson(list);
			}
			
			
			//아래는 리플에  답글 기능 
			@RequestMapping("frReReplyEnroll.fr")
			public String frReReplyEnroll(ModelAndView mv,FrBoardReply refb) {
				
				int result =FrBoardService.frReReplyEnroll(refb);
				
				//만약 결과가 0보다 크냐?  
				//아래 결과가  0이면 N  , 1이면 Y 
				return (result == 0) ? "NNNNN" : "NNNNY";
			}
			
}	
