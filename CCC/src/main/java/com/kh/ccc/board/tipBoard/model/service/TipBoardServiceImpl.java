package com.kh.ccc.board.tipBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.board.tipBoard.model.dao.TipBoardDao;
import com.kh.ccc.board.tipBoard.model.vo.TipAttach;
import com.kh.ccc.board.tipBoard.model.vo.TipBoard;
import com.kh.ccc.board.tipBoard.model.vo.TipReply;
import com.kh.ccc.common.model.vo.PageInfo;

@Service
public class TipBoardServiceImpl implements TipBoardService {

	@Autowired
	private TipBoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//1.게시글의 총 개수
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}
	
	//2.게시글 리스트 조회
	@Override
	public ArrayList<TipBoard> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}

	
	//조회수
	@Override
	public int increseCount(int bno) {
		return boardDao.increaseCount(sqlSession, bno);
	}
	
	//상세 조회
	@Override
	public TipBoard selectBoard(int bno) {
		return boardDao.selectBoard(sqlSession, bno);
	}
	
	
	
	//게시글 등록 (게시글,첨부파일)
		@Override
		public int insertTipBoard(TipBoard tb) {
			
			int result = boardDao.insertBoard(sqlSession,tb);
			
			return result;
		}
	
	
	
	//게시글 등록 (게시글,첨부파일)
	@Override
	public int insertTipBoard(TipBoard tb, ArrayList<TipAttach> list) {
		
		int result = boardDao.insertBoard(sqlSession,tb);
		int result2 = boardDao.insertAttach(sqlSession,list);
		int finalResult = result * result2;
		
		return finalResult;
	}
	
	
	
	//게시글 수정
	@Override
	public int updateBoard(TipBoard cb) {
		//게시글 내용 수정
		int result = boardDao.updateBoard(sqlSession, cb);
		//게시글 첨부파일 수정
		int result2 = boardDao.updateAttach(sqlSession, cb);
		
		int finalResult = result * result2;
		
		return finalResult;
	}
	
	//게시글 삭제
	@Override
	public int deleteBoard(int bno) {
		//게시글 내용 삭제
		int result = boardDao.deleteBoard(sqlSession, bno);
		//게시글 첨부파일 삭제
		int result2 = boardDao.deleteAttach(sqlSession, bno);
		
		int finalResult = result * result2;
		
		return finalResult;
	}
	
	//댓글 리스트 조회
	@Override
	public ArrayList<TipReply> selectReplyList(int boardNo) {
		return boardDao.selectReplyList(sqlSession, boardNo);
	}
	
	//댓글 등록
	@Override
	public int insertReply(TipReply cr) {
		return boardDao.insertReply(sqlSession, cr);
	}
	
	//댓글 수정
	@Override
	public int updateReply(TipReply cr) {
		return boardDao.updateReply(sqlSession, cr);
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(TipReply cr) {
		return boardDao.deleteReply(sqlSession, cr);
	}

}
