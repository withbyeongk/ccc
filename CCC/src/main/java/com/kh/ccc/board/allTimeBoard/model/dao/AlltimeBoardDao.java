package com.kh.ccc.board.allTimeBoard.model.dao;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.ccc.board.charBoard.model.vo.Character;
import com.kh.ccc.board.charBoard.model.vo.CharAttach;

@Repository
public class AlltimeBoardDao {
	
	//아래는 역대 수상작 

	public ArrayList<Character> allTimeSelectList(SqlSessionTemplate sqlSession) {
	
		ArrayList<Character> calist=(ArrayList)sqlSession.selectList("allTimeBoardMapper.allTimeSelectList");
		System.out.println("calist Dao는?: "+calist);
		return calist;
	}
	
	//아래는 db에서 첨부파일 이미지 불러오려고 ! 
	public ArrayList<CharAttach> myAllTimeBoard(SqlSessionTemplate sqlSession) {
		
		ArrayList<CharAttach> myca=(ArrayList)sqlSession.selectList("allTimeBoardMapper.myAllTimeBoard");
		System.out.println("myca dao는?"+myca);
		return myca;
	}
	
	//이번년도 좋아요 
	public ArrayList<Character> allTimeYearList(SqlSessionTemplate sqlSession) {
		ArrayList<Character> caYearlist=(ArrayList)sqlSession.selectList("allTimeBoardMapper.allTimeYearList");
		System.out.println("calist Dao는?: "+caYearlist);
		return caYearlist;
	}

}
