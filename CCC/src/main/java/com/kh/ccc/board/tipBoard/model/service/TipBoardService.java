package com.kh.ccc.board.tipBoard.model.service;

import java.util.ArrayList;

import com.kh.ccc.board.tipBoard.model.vo.TipAttach;
import com.kh.ccc.board.tipBoard.model.vo.TipBoard;
import com.kh.ccc.board.tipBoard.model.vo.TipReply;
import com.kh.ccc.common.model.vo.PageInfo;

public interface TipBoardService {
	
	//1.게시글의 총 개수
	int selectListCount();
	
	//2.게시글 리스트 조회
	ArrayList<TipBoard> selectList(PageInfo pi);
	
	//게시글 상세조회 및 조회수 증가
	//1.게시글 조회수 증가
	int increseCount(int bno);
	
	//2.게시글 상세 조회
	TipBoard selectBoard(int bno);

	//게시글 등록
	int insertTipBoard(TipBoard tb);
		
	//게시글 등록
	int insertTipBoard(TipBoard tb, ArrayList<TipAttach> talist);
	

	
	//게시글 수정
	int updateBoard(TipBoard cb);
	
	//게시글 삭제
	int deleteBoard(int bno);
	
	//댓글 리스트 출력
	ArrayList<TipReply> selectReplyList(int boardNo);
	
	//댓글 등록
	int insertReply(TipReply cr);
	
	//댓글 수정
	int updateReply(TipReply cr);
	
	//댓글 삭제
	int deleteReply(TipReply cr);
	
}
