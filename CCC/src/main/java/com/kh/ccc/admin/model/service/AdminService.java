package com.kh.ccc.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ccc.admin.model.vo.Admin;
import com.kh.ccc.admin.model.vo.AdminAttach;
import com.kh.ccc.member.model.vo.Member;


public interface AdminService {
	
	//회원 전체 리스트 조회
	ArrayList<Member> memberList();
	
	//회원수
	int selectListCount();

	//관리자리스트 조회 (특수관리자페이지)
	ArrayList<Admin> adminList();
	
	//관리자 사진 조회
	ArrayList<AdminAttach> adminAttachmentList();

	//관리자 상세조회 (특수관리자페이지)
	Admin detailAdmin(int ano);
	
	//관리자 첨부상세
	ArrayList<AdminAttach> selectATList(int ano);

	//일반회원 check회원들 차단삭제
	int deleteMemberList(List<String> checkBoxArr);

	//회원상세보기
	Member detailMember(int mno);

	//차트 올해
	ArrayList<String> thisYearChart(ArrayList<Integer> yearList);
	
	//차트 이번달
	ArrayList<String> monthChart(ArrayList<String> monthList);

	//관리자등록(첨부파일)
	int insertAdmin(Admin a, ArrayList<AdminAttach> adminAttach);

	//로그인
	Admin loginAdmin(String aId);

	//문의 답글필요
	int selectQcount();

	//누적 주문수량
	int selectOrderCount();








	


}
