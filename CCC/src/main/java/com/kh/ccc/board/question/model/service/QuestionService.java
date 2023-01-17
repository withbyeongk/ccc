package com.kh.ccc.board.question.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ccc.board.question.model.vo.Question;
import com.kh.ccc.board.question.model.vo.QuestionAttach;
import com.kh.ccc.common.model.vo.PageInfo;

@Service
public interface QuestionService {
	
	// 문의글 전체 글 수 조회
	int selectListCount();

	// 해당 페이지의 문의 글 조회
	ArrayList<Question> selectList(PageInfo pi);
	
	// 내 문의글만 조회 
	ArrayList<Question> selectMyList(int memberNo, PageInfo pi);
	
	// 문의 글 추가
	int insertQuestion(Question n, ArrayList<QuestionAttach> qaList);

	// 조회수 증가
	int increaseCount(int qno);

	// 문의글 하나 조회
	Question selectQuestion(int qno);
	
	// 문의글 번호로 첨부파일 리스트 조회
	ArrayList<QuestionAttach> selectQAList(int qno);
	
	// 첨부파일 번호로 문의글 첨부파일 하나 삭제
	int deleteQuestionAttachByQaNo(int questionAttachNo);
	
	// 문의글 수정(문의글 내용 수정 + 수정 시 추가되는 첨부파일 목록 추가)
	int updateQuestion(Question q, ArrayList<QuestionAttach> newQaList);

	// 문의글 번호로 첨부파일 전부 삭제
	int deleteQuestionAttachByQno(int qno);

	// 문의글 글 하나 삭제
	int deleteQuestion(int qno);

	// 문의글에 답변 작성
	int responseQuestion(Question q);

	// 문의글 그룹 삭제
	int deleteGroup(int[] deleteNoArr);

}
