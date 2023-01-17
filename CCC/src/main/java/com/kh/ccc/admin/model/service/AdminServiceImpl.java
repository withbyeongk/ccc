package com.kh.ccc.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccc.admin.model.dao.AdminDao;
import com.kh.ccc.admin.model.vo.Admin;
import com.kh.ccc.admin.model.vo.AdminAttach;
import com.kh.ccc.member.model.vo.Member;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	//회원 전체 리스트 조회
	@Override
	public ArrayList<Member> memberList() {

		ArrayList<Member> mList = adminDao.memberList(sqlSession);
		
		return mList;
	}



	//회원수
	@Override
	public int selectListCount() {
		
		int listCount = adminDao.selectListCount(sqlSession);
		
		return listCount;
	}


	
	//관리자리스트 조회 (특수관리자페이지)
	@Override
	public ArrayList<Admin> adminList() {
		
		ArrayList<Admin> aList = adminDao.adminList(sqlSession);
		
		return aList;
	}

	
	//관리자 사진조회
	@Override
	public ArrayList<AdminAttach> adminAttachmentList() {
		
		ArrayList<AdminAttach> adList = adminDao.adminAttachmentList(sqlSession);
		
		return adList;
		
	}


	//관리자 상세조회 (특수관리자페이지)
	@Override
	public Admin detailAdmin(int ano) {
		
		Admin a =adminDao.detailAdmin(sqlSession,ano);
		
		return a;
	}

	
	//첨부상세
	@Override
	public ArrayList<AdminAttach> selectATList(int ano) {
		
		ArrayList<AdminAttach> at = adminDao.selectATList(sqlSession, ano);
		
		return at;
	}
	
	
	//일반회원 check회원들 차단삭제
	@Override
	public int deleteMemberList(List<String> checkBoxArr) {

		int result = adminDao.deleteMemberList(sqlSession,checkBoxArr);

		return result;
	}


	//회원상세보기
	@Override
	public Member detailMember(int mno) {
		
		Member m = adminDao.detailMember(sqlSession,mno);

		return m;
	}


	
	//차트 올해
	@Override
	public ArrayList<String> thisYearChart(ArrayList<Integer> yearList) {
		
		ArrayList<String> countList = adminDao.thisYearChart(sqlSession, yearList);
		
		return countList;
	}
	
	//차트지난달
	@Override
	public ArrayList<String> monthChart(ArrayList<String> monthList) {
		
		ArrayList<String> countMonthList = adminDao.monthChart(sqlSession,monthList);
		
		return countMonthList;
	}



	//관리자등록(첨부파일)
	@Override
	public int insertAdmin(Admin a, ArrayList<AdminAttach> adminAttach) {
		
		int result = adminDao.insertAdmin(sqlSession,a,adminAttach);

		return result;
	}



	//로그인
	@Override
	public Admin loginAdmin(String aId) {

		Admin loginAdmin = adminDao.loginAdmin(sqlSession,aId);
		return loginAdmin;
	}


	//문의 답글필요
	@Override
	public int selectQcount() {

		int qCount = adminDao.selectQcount(sqlSession);
		
		return qCount;
		
	}


	//누적 주문수량
	@Override
	public int selectOrderCount() {

		int countOrder = adminDao.selectOrderCount(sqlSession);
		
		return countOrder;
		
		
	}






	

	


}
