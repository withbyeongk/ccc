package com.kh.ccc.board.question.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.board.question.model.vo.Question;
import com.kh.ccc.board.question.model.vo.QuestionAttach;
import com.kh.ccc.common.model.vo.PageInfo;

@Repository
public class QuestionDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("questionMapper.selectListCount");
	}

	public ArrayList<Question> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
//		System.out.println("BoardList::Dao:: pi : " + pi);
//		System.out.println("QuestionList::Dao:: limit : " + limit);
//		System.out.println("QuestionList::Dao:: offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("questionMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Question> selectMyList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
//		System.out.println("BoardList::Dao:: pi : " + pi);
//		System.out.println("QuestionList::Dao:: limit : " + limit);
//		System.out.println("QuestionList::Dao:: offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("questionMapper.selectMyList", memberNo, rowBounds);
	}

	public int insertQuestion(SqlSessionTemplate sqlSession, Question q, ArrayList<QuestionAttach> qaList) {
		int qResult = sqlSession.insert("questionMapper.insertQuestion", q);
		
		int qaResult = 1;
		
		if(qResult>0) {
			for(QuestionAttach qa : qaList) {
				qaResult *= sqlSession.insert("questionMapper.insertQuestionAttach", qa);
			}
		}
		
		return qResult*qaResult;
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.update("questionMapper.increaseCount", qno);
	}

	public Question selectQuestion(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("questionMapper.selectQuestion", qno);
	}

	public ArrayList<QuestionAttach> selectQAList(SqlSessionTemplate sqlSession, int qno) {
		return (ArrayList)sqlSession.selectList("questionMapper.selectQAList", qno);
	}

	public int deleteQuestionAttachByQaNo(SqlSessionTemplate sqlSession, int questionAttachNo) {
		return sqlSession.update("questionMapper.deleteQuestionAttachByQaNo", questionAttachNo);
	}

	public int updateQuestion(SqlSessionTemplate sqlSession, Question q, ArrayList<QuestionAttach> newQaList) {
		int qResult = sqlSession.update("questionMapper.updateQuestion", q);
		
		int qaResult = 1;
		
		if(qResult>0) {
			for(QuestionAttach qa : newQaList) {
				qaResult *= sqlSession.insert("questionMapper.updateQuestionAttach", qa);
			}
		}
		
		return qResult*qaResult;
	}

	public int deleteQuestionAttachByQno(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.update("questionMapper.deleteQuestionAttachByQno", qno);
	}

	public int deleteQuestion(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.update("questionMapper.deleteQuestion", qno);
	}

	public int responseQuestion(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.update("questionMapper.updateResponse", q);
		
	}

	public int deleteGroup(SqlSessionTemplate sqlSession, int[] deleteNoArr) {
		int result = 1;
		
		for(int i=0; i<deleteNoArr.length; i++) {
			result *= sqlSession.update("questionMapper.deleteQuestion", deleteNoArr[i]);
		}
		
		return result;
	}

}
