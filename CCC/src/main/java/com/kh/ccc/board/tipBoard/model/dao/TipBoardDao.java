package com.kh.ccc.board.tipBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.board.tipBoard.model.vo.TipAttach;
import com.kh.ccc.board.tipBoard.model.vo.TipBoard;
import com.kh.ccc.board.tipBoard.model.vo.TipReply;
import com.kh.ccc.common.model.vo.PageInfo;

@Repository
public class TipBoardDao {

	//게시글 총 개수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("tipBoardMapper.selectListCount");
	}
	
	
	//게시글 리스트 조회
	public ArrayList<TipBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit(); //게시글 몇개를 조회할 건지
		int offset = (pi.getCurrentPage()-1) * limit; //몇개의 게시글을 건너뛰고 조회할 것인지에 대한 값
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		//매개변수 3개짜리 selectList사용
		return (ArrayList)sqlSession.selectList("tipBoardMapper.selectList", null, rowBounds);
	}
	
	
	//게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("tipBoardMapper.increaseCount", bno);	
	}
	
	
	//게시글 상세정보 조회 (게시글 1개)
	public TipBoard selectBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("tipBoardMapper.selectBoard", bno);
	}

		
	//게시글 등록 (글)
	public int insertBoard(SqlSessionTemplate sqlSession, TipBoard tb) {
		return sqlSession.insert("tipBoardMapper.insertBoard", tb);
	}
	
	//게시글 첨부파일 등록
	public int insertAttach(SqlSessionTemplate sqlSession, ArrayList<TipAttach> list) {
		return sqlSession.insert("tipBoardMapper.insertAttach", list);
	}
	
	
	
	
	//게시글 수정
	public int updateBoard(SqlSessionTemplate sqlSession, TipBoard cb) {
		return sqlSession.update("tipBoardMapper.updateBoard", cb);
	}
	
	//게시글 첨부파일 수정
	public int updateAttach(SqlSessionTemplate sqlSession, TipBoard cb) {
		return sqlSession.update("tipBoardMapper.updateAttach", cb);
	}
	
	//게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("tipBoardMapper.deleteBoard", bno);
	}
	
	//게시글 첨부파일 삭제
	public int deleteAttach(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("tipBoardMapper.deleteAttach", bno);
	}
	
	//댓글 리스트 조회
	public ArrayList<TipReply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("tipBoardMapper.selectReplyList", boardNo);
	}
	
	//댓글 등록
	public int insertReply(SqlSessionTemplate sqlSession, TipReply tr) {
		return sqlSession.insert("tipBoardMapper.insertReply", tr);
	}
	
	//댓글 수정
	public int updateReply(SqlSessionTemplate sqlSession, TipReply cr) {
		return sqlSession.update("tipBoardMapper.updateReply", cr);
	}
	
	//댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, TipReply cr) {
		return sqlSession.update("tipBoardMapper.deleteReply", cr);
	}
}
