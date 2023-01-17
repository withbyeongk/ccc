package com.kh.ccc.board.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.board.notice.model.dao.NoticeDao;
import com.kh.ccc.board.notice.model.vo.Notice;
import com.kh.ccc.board.notice.model.vo.NoticeAttach;
import com.kh.ccc.common.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeDao noticeDao = new NoticeDao();
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		int listCount = noticeDao.selectListCount(sqlSession);
		
		return listCount;
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		ArrayList<Notice> list = noticeDao.selectList(sqlSession, pi); 
		
		return list;
	}

	@Override
	public int insertNotice(Notice n, ArrayList<NoticeAttach> naList) {
		int result = noticeDao.insertNotice(sqlSession, n, naList);
		
		return result;
	}

	@Override
	public int increaseCount(int nno) {
		int result = noticeDao.increaseCount(sqlSession, nno);
		
		return result;
	}

	@Override
	public Notice selectNotice(int nno) {
		Notice n = noticeDao.selectNotice(sqlSession, nno);
		return n;
	}

	@Override
	public ArrayList<NoticeAttach> selectNAList(int nno) {
		ArrayList<NoticeAttach> naList = noticeDao.selectNAList(sqlSession, nno);
		return naList;
	}

	@Override
	public int deleteNoticeAttachByNaNo(int noticeAttachNo) {
		int result = noticeDao.deleteNoticeAttachByNaNo(sqlSession, noticeAttachNo);
		return result;
	}

	@Override
	public int updateNotice(Notice n, ArrayList<NoticeAttach> newNaList) {
		int result = noticeDao.updateNotice(sqlSession, n, newNaList);
		return result;
	}

	@Override
	public int deleteNoticeAttachByNno(int nno) {
		int result = noticeDao.deleteNoticeAttachByNno(sqlSession, nno);
		return result;
	}

	@Override
	public int deleteNotice(int nno) {
		int result = noticeDao.deleteNotice(sqlSession, nno);
		return result;
	}
}
