package com.kh.ccc.member.model.service;

import com.kh.ccc.member.model.vo.Member;

public interface MemberService {

	// 로그인 서비스 select
	Member loginMember(Member m);
	
	//회원가입  insert
	int insertMember(Member m);
	
    //아이디 중복체크
	int idCheck(String userId);
}
