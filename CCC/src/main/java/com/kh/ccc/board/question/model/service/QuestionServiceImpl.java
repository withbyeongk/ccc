package com.kh.ccc.board.question.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.board.notice.model.vo.Notice;
import com.kh.ccc.board.question.model.dao.QuestionDao;
import com.kh.ccc.board.question.model.vo.Question;
import com.kh.ccc.board.question.model.vo.QuestionAttach;
import com.kh.ccc.common.model.vo.PageInfo;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	QuestionDao questionDao = new QuestionDao();
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		int listCount = questionDao.selectListCount(sqlSession);
		
		return listCount;
	}

	@Override
	public ArrayList<Question> selectList(PageInfo pi) {
		ArrayList<Question> list = questionDao.selectList(sqlSession, pi); 
		
		return list;
	}

	@Override
	public ArrayList<Question> selectMyList(int memberNo, PageInfo pi) {
		ArrayList<Question> list = questionDao.selectMyList(sqlSession, memberNo, pi); 
		
		return list;
	}

	@Override
	public int insertQuestion(Question q, ArrayList<QuestionAttach> qaList) {
		int result = questionDao.insertQuestion(sqlSession, q, qaList);
		
		return result;
	}

	@Override
	public int increaseCount(int qno) {
		int result = questionDao.increaseCount(sqlSession, qno);
		
		return result;
	}

	@Override
	public Question selectQuestion(int qno) {
		Question q = questionDao.selectQuestion(sqlSession, qno);
		return q;
	}

	@Override
	public ArrayList<QuestionAttach> selectQAList(int qno) {
		ArrayList<QuestionAttach> qaList = questionDao.selectQAList(sqlSession, qno);
		return qaList;
	}

	@Override
	public int deleteQuestionAttachByQaNo(int questionAttachNo) {
		int result = questionDao.deleteQuestionAttachByQaNo(sqlSession, questionAttachNo);
		return result;
	}

	@Override
	public int updateQuestion(Question q, ArrayList<QuestionAttach> newQaList) {
		int result = questionDao.updateQuestion(sqlSession, q, newQaList);
		return result;
	}

	@Override
	public int deleteQuestionAttachByQno(int qno) {
		int result = questionDao.deleteQuestionAttachByQno(sqlSession, qno);
		return result;
	}

	@Override
	public int deleteQuestion(int qno) {
		int result = questionDao.deleteQuestion(sqlSession, qno);
		return result;
	}

	@Override
	public int responseQuestion(Question q) {
		int result = questionDao.responseQuestion(sqlSession, q);
		return result;
	}

	@Override
	public int deleteGroup(int[] deleteNoArr) {
		int result = questionDao.deleteGroup(sqlSession, deleteNoArr);
		return result;
	}

}
