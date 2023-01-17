package com.kh.ccc.board.charBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.board.charBoard.model.vo.CharAttach;
import com.kh.ccc.board.charBoard.model.vo.CharBoard;
import com.kh.ccc.board.charBoard.model.vo.CharLike;
import com.kh.ccc.board.charBoard.model.vo.CharReply;
import com.kh.ccc.board.charBoard.model.vo.Character;
import com.kh.ccc.common.model.vo.PageInfo;
import com.kh.ccc.common.model.vo.Ward;

@Repository
public class CharBoardDao {

	//게시글 총 개수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("charBoardMapper.selectListCount");
	}
	//게시글 조회
	public ArrayList<CharBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit(); //게시글 몇개를 조회할 건지
		int offset = (pi.getCurrentPage()-1) * limit; //몇개의 게시글을 건너뛰고 조회할 것인지에 대한 값
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		//매개변수 3개짜리 selectList사용
		return (ArrayList)sqlSession.selectList("charBoardMapper.selectList", null, rowBounds);
	}
	//1.게시글 등록 (글)
	public int insertBoard(SqlSessionTemplate sqlSession, CharBoard cb) {
		return sqlSession.insert("charBoardMapper.insertBoard", cb);
	}
	//2.게시글 등록 (첨부파일)
	public int insertAttach(SqlSessionTemplate sqlSession, ArrayList<CharAttach> list) {
		return sqlSession.insert("charBoardMapper.insertAttach", list);
	}
	//3.캐릭터 번호 생성
	public int characterMaxNum(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("charBoardMapper.characterMaxNum");
	}
	//4.게시글 등록 (캐릭터)
	public int insertCharacter(SqlSessionTemplate sqlSession, Character c) {
		return sqlSession.insert("charBoardMapper.insertCharacter", c);
	}
	//게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("charBoardMapper.increaseCount", bno);	
	}
	//게시글 상세정보 조회 (글)
	public CharBoard selectBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("charBoardMapper.selectBoard", bno);
	}
	//게시글 상세정보 조회 (첨부파일)
	public ArrayList<CharAttach> selectAttach(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("charBoardMapper.selectAttach", bno);
	}	
	//1.게시글 수정 (글)
	public int updateBoard(SqlSessionTemplate sqlSession, CharBoard cb) {
		return sqlSession.update("charBoardMapper.updateBoard", cb);
	}
	//2.게시글 수정 (첨부파일)
	public int updateAttach(SqlSessionTemplate sqlSession, ArrayList<CharAttach> newCaList) {
		return sqlSession.update("charBoardMapper.updateAttach", newCaList);
	}
	//1.게시글 삭제 (글)
	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("charBoardMapper.deleteBoard", bno);
	}
	//2.게시글 삭제 (첨부파일)
	public int deleteAttach(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("charBoardMapper.deleteAttach", bno);
	}
	//댓글 리스트 조회
	public ArrayList<CharReply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("charBoardMapper.selectReplyList", boardNo);
	}
	//댓글 등록
	public int insertReply(SqlSessionTemplate sqlSession, CharReply cr) {
		return sqlSession.insert("charBoardMapper.insertReply", cr);
	}
	//댓글 수정
	public int updateReply(SqlSessionTemplate sqlSession, CharReply cr) {
		return sqlSession.update("charBoardMapper.updateReply", cr);
	}
	//댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, CharReply cr) {
		return sqlSession.update("charBoardMapper.deleteReply", cr);
	}
	//댓글 번호 생성
	public int replyMaxNum(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("charBoardMapper.replyMaxNum");
	}
	//대댓글 (부모댓글의 그룹번호와 계층 알아오기)
	public CharReply replySelect(SqlSessionTemplate sqlSession, int reNo) {
		return sqlSession.selectOne("charBoardMapper.replySelect", reNo);
	}
	//대댓글 (댓글중에서 새로운 댓글을 달때 맨 아래로 가기 위한 로직)
	public int maxStep(SqlSessionTemplate sqlSession, int reGroupNo) {
		return sqlSession.selectOne("charBoardMapper.maxStep", reGroupNo);
	}
	//대댓글 (댓글의 계층을 업데이트하기 위한 로직)
	public void updateStep(SqlSessionTemplate sqlSession, CharReply cr) {
		sqlSession.update("charBoardMapper.updateStep", cr);
	}
	//1.좋아요 조회(TB_CHARACTER_LIKE)
	public CharLike selectLike(SqlSessionTemplate sqlSession, CharLike cl) {	
		return sqlSession.selectOne("charBoardMapper.selectLike", cl);
	}
	//2.좋아요 추가(CHARACTER_LIKE)
	public int insertTbCharLike(SqlSessionTemplate sqlSession, CharLike cl) {
		return sqlSession.insert("charBoardMapper.insertTbCharLike", cl);
	}
	//3.좋아요 추가 (CHARACTER)
	public int insertTbChar(SqlSessionTemplate sqlSession, CharLike cl) {
		return sqlSession.update("charBoardMapper.insertTbChar", cl);
	}
	//4.좋아요 추가 (CHARACTER_BOARD)
	public int insertTbCharBoard(SqlSessionTemplate sqlSession, CharLike cl) {
		return sqlSession.update("charBoardMapper.insertTbCharBoard", cl);
	}
	//1.좋아요 삭제 (CHARACTER_LIKE)
	public int deleteTbCharLike(SqlSessionTemplate sqlSession, CharLike cl) {
		return sqlSession.delete("charBoardMapper.deleteTbCharLike", cl);
	}
	//2.좋아요 삭제 (CHARACTER)
	public int deleteTbChar(SqlSessionTemplate sqlSession, CharLike cl) {
		return sqlSession.update("charBoardMapper.deleteTbChar", cl);
	}
	//3.좋아요 삭제 (CHARACTER_BOARD)
	public int deleteTbCharBoard(SqlSessionTemplate sqlSession, CharLike cl) {
		return sqlSession.update("charBoardMapper.deleteTbCharBoard", cl);
	}
	//비속어 필터링
	public ArrayList<Ward> badLanguage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("charBoardMapper.badLanguage");
	}
	//1.게시글 수정 (기존 첨부파일 삭제)
	public int deleteCharAttachByCaNo(SqlSessionTemplate sqlSession, CharAttach deleteCa) {
		return sqlSession.delete("charBoardMapper.deleteCharAttachByCaNo", deleteCa);
	}
	//2.게시글 수정 (게시글 정보)
	public int updateCb(SqlSessionTemplate sqlSession, CharBoard updateCb) {
		return sqlSession.update("charBoardMapper.updateCb", updateCb);
	}
	//3.캐릭터 수정 (캐릭터 정보)
	public int updateCharacter(SqlSessionTemplate sqlSession, Character updateCharacter) {
		return sqlSession.update("charBoardMapper.updateCharacter", updateCharacter);
	}
	//4.게시판 수정 (첨부파일)
	public int updateCaList(SqlSessionTemplate sqlSession, ArrayList<CharAttach> updateCaList) {
		return sqlSession.insert("charBoardMapper.updateCaList", updateCaList);
	}
	//4.게시글 수정 (기존 첨부파일 모두 삭제하는 경우)
	public int deleteAllOldAttach(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("charBoardMapper.deleteAllOldAttach", boardNo);
	}	
	//1.검색 게시글의 총 개수 반환
	public int searchCount(SqlSessionTemplate sqlSession, HashMap<String,String> map) {
		return sqlSession.selectOne("charBoardMapper.searchCount", map);
	}
	//2.검색 게시글의 리스트 반환
	public ArrayList<CharBoard> charBoardSearch(SqlSessionTemplate sqlSession, HashMap<String,String> map, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("charBoardMapper.charBoardSearch", map, rowBounds);
	}
	
	//로그인 유저가 좋아요한 목록 조회
	public ArrayList<CharLike> checkLikeList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("charBoardMapper.checkLikeList", memberNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
