package com.kh.ccc.board.notice.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ccc.board.notice.model.vo.Notice;
import com.kh.ccc.board.notice.model.vo.NoticeAttach;
import com.kh.ccc.common.model.vo.PageInfo;

@Service
public interface NoticeService {
	
	// 공지사항 전체 글 수 조회
	int selectListCount();

	// 해당 페이지의 공지사항 글 조회
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 공지사항 글 추가
	int insertNotice(Notice n, ArrayList<NoticeAttach> naList);

	// 조회수 증가
	int increaseCount(int nno);

	// 공지사항 하나 조회
	Notice selectNotice(int nno);
	
	// 공지사항 번호로 첨부파일 리스트 조회
	ArrayList<NoticeAttach> selectNAList(int nno);

	// 첨부파일 번호로 공지사항 첨부파일 하나 삭제
	int deleteNoticeAttachByNaNo(int noticeAttachNo);
	
	// 공지사항 수정(공지사항 내용 수정 + 수정 시 추가되는 첨부파일 목록 추가)
	int updateNotice(Notice n, ArrayList<NoticeAttach> newNaList);

	// 공지사항 번호로 첨부파일 전부 삭제
	int deleteNoticeAttachByNno(int nno);

	// 공지사항 글 하나 삭제
	int deleteNotice(int nno);
	
}
