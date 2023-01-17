package com.kh.ccc.board.charBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.board.charBoard.model.dao.CharBoardDao;
import com.kh.ccc.board.charBoard.model.vo.CharAttach;
import com.kh.ccc.board.charBoard.model.vo.CharBoard;
import com.kh.ccc.board.charBoard.model.vo.CharLike;
import com.kh.ccc.board.charBoard.model.vo.CharReply;
import com.kh.ccc.board.charBoard.model.vo.Character;
import com.kh.ccc.common.model.vo.PageInfo;
import com.kh.ccc.common.model.vo.Ward;

@Service
public class CharBoardServiceImpl implements CharBoardService {

	@Autowired
	private CharBoardDao boardDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//1.게시글의 총 개수
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}
	//2.게시글 리스트 조회
	@Override
	public ArrayList<CharBoard> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}
	
	//게시글 등록 (캐릭터 -> 게시글 -> 첨부파일순으로 / 게시글이 캐릭터의 번호를 참조하기 때문)
	@Override
	public int insertCharBoard(CharBoard cb, ArrayList<CharAttach> list, Character c) {
		
		int boardResult = 1;
		int attachResult = 1;

		//1.캐릭터 등록
		int characterResult = boardDao.insertCharacter(sqlSession,c);
	
		if( characterResult>0 ) {
			//2.게시글 글 정보 등록
			boardResult = boardDao.insertBoard(sqlSession,cb);			
		}
		if( (characterResult*boardResult)>0 ) {
			//3.게시글 첨부파일 등록
			attachResult = boardDao.insertAttach(sqlSession,list);			
		}	
		return (characterResult * boardResult * attachResult) > 0 ? 1 : 0;
	}
	//캐릭터 번호 생성
	@Override
	public int characterMaxNum() {
		return boardDao.characterMaxNum(sqlSession);
	}
	
	//1.게시글 조회수 증가
	@Override
	public int increseCount(int bno) {
		return boardDao.increaseCount(sqlSession, bno);
	}
	//2.게시글 상세 조회 (글)
	@Override
	public CharBoard selectBoard(int bno) {		
		return boardDao.selectBoard(sqlSession, bno);
	}
	//3.게시글 상세조회 (첨부파일)
	public ArrayList<CharAttach> selectAttach(int bno){
		return boardDao.selectAttach(sqlSession, bno);
	}
		
	//게시글 삭제 (캐릭터 등록 내용은 삭제되지 않는다 / 캐릭터는 마이페이지에서만 삭제 가능)
	@Override
	public int deleteBoard(int bno) {
		//게시글 내용 삭제
		int result = boardDao.deleteBoard(sqlSession, bno);
		//게시글 첨부파일 삭제
		int result2 = boardDao.deleteAttach(sqlSession, bno);
	
		return result * result2;
	}
	
	//댓글 리스트 조회
	@Override
	public ArrayList<CharReply> selectReplyList(int boardNo) {
		return boardDao.selectReplyList(sqlSession, boardNo);
	}
	
	//댓글 등록
	@Override
	public int insertReply(CharReply cr) {
		return boardDao.insertReply(sqlSession, cr);
	}
	
	//댓글 수정
	@Override
	public int updateReply(CharReply cr) {
		return boardDao.updateReply(sqlSession, cr);
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(CharReply cr) {
		return boardDao.deleteReply(sqlSession, cr);
	}
	
	//댓글 번호 생성
	@Override
	public int replyMaxNum() {
		return boardDao.replyMaxNum(sqlSession);
	}

	//대댓글 (부모댓글의 그룹번호와 계층 알아오기)
	@Override
	public CharReply replySelect(int reNo) {
		return boardDao.replySelect(sqlSession, reNo);
	}
	
	//대댓글 (댓글중에서 새로운 댓글을 달때 맨 아래로 가기 위한 로직)
	@Override
	public int maxStep(int reGroupNo) {
		return boardDao.maxStep(sqlSession, reGroupNo);
	}
	
	//대댓글 (댓글의 계층을 업데이트하기 위한 로직)
	@Override
	public void updateStep(CharReply cr) {
		boardDao.updateStep(sqlSession, cr);
	}
	
	//좋아요 조회
	@Override
	public CharLike selectLike(CharLike cl) {
		return boardDao.selectLike(sqlSession, cl);
	}

	//좋아요 등록
	@Override
	public int insertLike(CharLike cl) {
		//TB_CHARACTER_LIKE에 좋아요 등록
		int insertTbCharLike = boardDao.insertTbCharLike(sqlSession, cl);
		//TB_CHARACTER에 좋아요 등록
		int insertTbChar = boardDao.insertTbChar(sqlSession, cl);
		//TB_CHARACTER_BOARD 좋아요 등록
		int insertTbCharBoard = boardDao.insertTbCharBoard(sqlSession, cl);
	
		return insertTbCharLike * insertTbChar * insertTbCharBoard > 0 ? 1 : 0;
	}
	
	//좋아요 삭제
	@Override
	public int deleteLike(CharLike cl) {
		//TB_CHARACTER_LIKE에 좋아요 취소
		int deleteTbCharLike = boardDao.deleteTbCharLike(sqlSession, cl);
		//TB_CHARACTER에 좋아요 취소
		int deleteTbChar = boardDao.deleteTbChar(sqlSession, cl);
		//TB_CHARACTER_BOARD 좋아요 취소
		int deleteTbCharBoard = boardDao.deleteTbCharBoard(sqlSession, cl);
		
		return deleteTbCharLike * deleteTbChar * deleteTbCharBoard > 0 ? 1 : 0;
	}

	//비속어 필터링
	@Override
	public ArrayList<Ward> badLanguage() {
		return boardDao.badLanguage(sqlSession);
	}
	
	//1.게시글 수정 (기존 첨부파일 삭제)
	@Override
	public int deleteCharAttachByCaNo(CharAttach deleteCa) {
		return boardDao.deleteCharAttachByCaNo(sqlSession, deleteCa);
	}
	
	//2.수정된 게시글 내용 등록(게시글,캐릭터 이름,캐릭터 소개,새로운 첨부파일 등록)
	@Override
	public int updateCharBoard(CharBoard updateCb, Character updateCharacter, ArrayList<CharAttach> updateCaList) {
		
		int updateCbResult = boardDao.updateCb(sqlSession, updateCb);
		int updateCharacterResult = boardDao.updateCharacter(sqlSession, updateCharacter);
		int updateCaListResult = boardDao.updateCaList(sqlSession, updateCaList);
			
		return updateCbResult * updateCharacterResult * updateCaListResult > 0 ? 1 : 0;
	}
	
	//3.수정된 게시글 내용 등록(게시글,캐릭터 이름,캐릭터 소개)
	@Override
	public int updateCharBoard(CharBoard updateCb, Character updateCharacter) {
		
		int updateCbResult = boardDao.updateCb(sqlSession, updateCb);
		int updateCharacterResult = boardDao.updateCharacter(sqlSession, updateCharacter);

		return updateCbResult * updateCharacterResult > 0 ? 1 : 0;
	}
	
	//4.게시글 수정 (기존 첨부파일 모두 삭제하는 경우)
	@Override
	public int deleteAllOldAttach(int boardNo) {
		return boardDao.deleteAllOldAttach(sqlSession,boardNo);
	}
	
	//로그인 유저가 좋아요한 목록 조회
	@Override
	public ArrayList<CharLike> checkLikeList(int memberNo) {
		return boardDao.checkLikeList(sqlSession, memberNo);
	}
	
	//1.검색 게시글의 총 개수 반환
	@Override
	public int searchCount(HashMap<String, String> map) {
		return boardDao.searchCount(sqlSession, map);
	}
	
	//2.검색 게시글의 리스트 반환
	@Override
	public ArrayList<CharBoard> charBoardSearch(HashMap<String, String> map,PageInfo pi) {
		return boardDao.charBoardSearch(sqlSession, map, pi);
	}

}
