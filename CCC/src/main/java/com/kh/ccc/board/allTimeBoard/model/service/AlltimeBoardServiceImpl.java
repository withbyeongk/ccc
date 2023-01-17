package com.kh.ccc.board.allTimeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.ccc.board.charBoard.model.vo.Character;
import com.kh.ccc.board.allTimeBoard.model.dao.AlltimeBoardDao;
import com.kh.ccc.board.charBoard.model.vo.CharAttach;

@Service
public class AlltimeBoardServiceImpl implements AlltimeBoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AlltimeBoardDao AlltimeBoardDao;
	
	
	//아래는 역대 수상작 
	@Override
	public ArrayList<Character> allTimeSelectList() {
		
		ArrayList<Character> aclist = AlltimeBoardDao.allTimeSelectList(sqlSession);
		
		return aclist;
	}

	//아래는 db에서 첨부파일 이미지 불러오려고 ! 
	@Override
	public ArrayList<CharAttach> myAllTimeBoard() {
		
		ArrayList<CharAttach> myca = AlltimeBoardDao.myAllTimeBoard(sqlSession);
		System.out.println("myca 서비스"+myca);
		return myca;
	}
	
	//아래는 이번년도 좋아요
	@Override
	public ArrayList<Character> allTimeYearList() {
		
		ArrayList<Character> acYearlist = AlltimeBoardDao.allTimeYearList(sqlSession);
		System.out.println("alltime서비스impo acYearlist:"+acYearlist);
		return acYearlist;
	}

}
