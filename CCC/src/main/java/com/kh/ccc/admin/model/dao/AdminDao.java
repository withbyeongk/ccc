package com.kh.ccc.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ccc.admin.model.vo.Admin;
import com.kh.ccc.admin.model.vo.AdminAttach;
import com.kh.ccc.member.model.vo.Member;


@Repository
public class AdminDao {

	
	//회원 전체 리스트 조회
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession) {

		
		ArrayList<Member> mList =(ArrayList)sqlSession.selectList("memberMapper.memberList");
		
		return mList;
		
	}

	//회원수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		int listCount =sqlSession.selectOne("memberMapper.selectListCount");
		
		return listCount;
	}

	
	//관리자리스트 조회 (특수관리자페이지)
	public ArrayList<Admin> adminList(SqlSessionTemplate sqlSession) {

		ArrayList<Admin> aList =(ArrayList)sqlSession.selectList("adminMapper.adminList");
		
		return aList;
		

	}
	
	
	//관리자 사진조회
	public ArrayList<AdminAttach> adminAttachmentList(SqlSessionTemplate sqlSession) {

		ArrayList<AdminAttach> adList =(ArrayList)sqlSession.selectList("adminMapper.adminAttachmentList");
		
		return adList;
		
		
	}
	

	//관리자 상세조회 (특수관리자페이지)
	public Admin detailAdmin(SqlSessionTemplate sqlSession, int ano) {

		return sqlSession.selectOne("adminMapper.detailAdmin", ano);
		
	
	}
	
	
	//관리자첨부 상세
	public ArrayList<AdminAttach> selectATList(SqlSessionTemplate sqlSession, int ano) {

		return (ArrayList)sqlSession.selectList("adminMapper.selectATList", ano);
		
	}

	
	

	//일반회원 check회원들 차단삭제
	public int deleteMemberList(SqlSessionTemplate sqlSession, List<String> checkBoxArr) {
		
		
		return sqlSession.update("memberMapper.deleteMemberList", checkBoxArr);
	}

	
	//회원상세보기
	public Member detailMember(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("memberMapper.detailMember", mno);
	}

	/*
	//차트 올해
	public ArrayList<Integer> thisYearChart(SqlSessionTemplate sqlSession,ArrayList<Integer> list) {
		
		ArrayList<Integer> resultList = new ArrayList<>();
		for(int i=0; i<list.size(); i++) {
			resultList.add(sqlSession.selectOne("adminMapper.thisYearChart",list.get(i)));
		}
		
		
		return resultList;
		
	}
	*/
	
	//차트
	public ArrayList<String> thisYearChart(SqlSessionTemplate sqlSession, ArrayList<Integer> yearList) {
			
		return (ArrayList)sqlSession.selectList("adminMapper.thisYearChart", yearList);
	}

	//차트지난달
	public ArrayList<String> monthChart(SqlSessionTemplate sqlSession, ArrayList<String> monthList) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.monthChart", monthList);
	}

	
	//관리자등록(첨부파일)
	public int insertAdmin(SqlSessionTemplate sqlSession, Admin a, ArrayList<AdminAttach> adminAttach) {

		int adminResult = sqlSession.insert("adminMapper.insertAdmin", a);
		
		//게시글 실패해서 0이면  1 곱했을때 return값 0 이니까
		int atadminResult = 1;
		
		
		if(adminResult>0) {
			for(AdminAttach aa : adminAttach) {
				atadminResult *= sqlSession.insert("adminMapper.insertAttach", aa);
			}
		
		}
		
		return adminResult*atadminResult;

	}

	//로그인
	public Admin loginAdmin(SqlSessionTemplate sqlSession, String aId) {

			return sqlSession.selectOne("adminMapper.loginAdmin",aId);
		}

	
	//문의 답글필요
	public int selectQcount(SqlSessionTemplate sqlSession) {

		int qCount =sqlSession.selectOne("adminMapper.selectQcount");
		
		return qCount;
		
	}

	
	//누적 주문수량
	public int selectOrderCount(SqlSessionTemplate sqlSession) {

		int countOrder =sqlSession.selectOne("adminMapper.selectOrderCount");
		
		return countOrder;
		
	}
		
		
	
	
	
}	
