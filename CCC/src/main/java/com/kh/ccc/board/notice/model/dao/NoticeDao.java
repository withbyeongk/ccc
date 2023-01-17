package com.kh.ccc.board.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.board.notice.model.vo.Notice;
import com.kh.ccc.board.notice.model.vo.NoticeAttach;
import com.kh.ccc.common.model.vo.PageInfo;

@Repository
public class NoticeDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
//		System.out.println("BoardList::Dao:: pi : " + pi);
		System.out.println("NoticeList::Dao:: limit : " + limit);
		System.out.println("NoticeList::Dao:: offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n, ArrayList<NoticeAttach> naList) {
		int nResult = sqlSession.insert("noticeMapper.insertNotice", n);
		
		int naResult = 1;
		
		if(nResult>0) {
			for(NoticeAttach na : naList) {
				naResult *= sqlSession.insert("noticeMapper.insertNoticeAttach", na);
			}
		}
		
		return nResult*naResult;
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.increaseCount", nno);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nno);
	}

	public ArrayList<NoticeAttach> selectNAList(SqlSessionTemplate sqlSession, int nno) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNAList", nno);
	}

	public int deleteNoticeAttachByNaNo(SqlSessionTemplate sqlSession, int noticeAttachNo) {
		return sqlSession.update("noticeMapper.deleteNoticeAttachByNaNo", noticeAttachNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n, ArrayList<NoticeAttach> newNaList) {
		int nResult = sqlSession.update("noticeMapper.updateNotice", n);
		
		int naResult = 1;
		
		if(nResult>0) {
			for(NoticeAttach na : newNaList) {
				naResult *= sqlSession.insert("noticeMapper.updateNoticeAttach", na);
			}
		}
		
		return nResult*naResult;
	}

	public int deleteNoticeAttachByNno(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.deleteNoticeAttachByNno", nno);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.deleteNotice", nno);
	}
	
}
