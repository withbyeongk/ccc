package com.kh.ccc.board.freeboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import com.kh.ccc.board.freeboard.model.vo.FrBoard;
import com.kh.ccc.board.freeboard.model.vo.FrBoardAttach;
import com.kh.ccc.board.freeboard.model.vo.FrBoardReply;
import com.kh.ccc.common.model.vo.PageInfo;

public interface FrBoardService {

	//게시글 리스트 조회 + 페이징처리 
	
		// 아래는 게시글 총개수
		int selectListCount();
		
		
		//게시글 리스트 조회 
		ArrayList<FrBoard> selectList(PageInfo pi);


		//아래는 게시글 조회수 증가 
		int increaseCount(int fno);

		//아래는 게시글 상세보기 
		ArrayList<FrBoard> frboardDetailView(int fno);

		//아래는 게시글 상세보기 (파일)
		ArrayList<FrBoardAttach> frboardAttDetailView(int fno);
	
		//글쓰기 파일두개일때 (사진,글)
		int insertFrBoard(FrBoard fb, ArrayList<FrBoardAttach> falist);

		//글만 등록할떄
		int insertFrBoardOnlyWrite(FrBoard fb);
		
		//아래는 자유게시판 글 삭제 
		int frboardDelete(int fno);

		//아래는 db데이터 삭제 
		int frboardDbDelete(int fno);
		
		//댓글 조회 
		ArrayList<FrBoardReply> detailFrBoardReviewSelect(int fno);

		//댓글등록
		int insertFrReply(FrBoardReply refb);

		//아래는 자유게시판 수정하기(글만)
		int updateFrboard1(FrBoard fb);

		//아래는 자유게시판 수정하기(파일)
		int updateFrboard2(ArrayList<FrBoardAttach> frba);
		
		//아래는 자유게시판 댓글 수정하기
		int frReplyModify(FrBoardReply refb);

		//아래는 체크된거 삭제 
		int deleteClickFrboard(List<String> checkBoxArr);

		//첨부파일 삭제(병철이형 부분)
//		int deleteFrFile(ArrayList<FrBoardAttach> frba);

		int deleteReply(FrBoardReply refb);

		//글 수정  (파일 둘다있을때 ) 
		int updateFrboard3(ArrayList<FrBoardAttach> newfrba);

		//검색어 조회결과 개수 
		int searchCount(HashMap<String, String> map);
		
		//검색어를 이용한 목록 조회 + 페이징처리 
		ArrayList<FrBoard> frSearchList(HashMap<String, String> map, PageInfo pi);

		//리플에 답글 달기 
		int frReReplyEnroll(FrBoardReply refb);

		//첨부파일 삭제(병철이형 부분)
		int deleteFrFile(int getfNo);
	}
