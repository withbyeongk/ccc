package com.kh.ccc.mypage.model.vo;

import java.sql.Date;

public class MyCharacterData {
	private int	charNo; //	C_NO	NUMBER	  캐릭터번호
	private	int memberNo;//	M_NO	NUMBER	 사용자번호
	private	String charName;//	C_NAME	VARCHAR2 캐릭터명
	private	int charLike;//	C_LIKE	NUMBER	 좋아요 수
	private	String charContent;//	C_CONTENT VARCHAR2 캐릭터 간단설명
	private	Date charCreateDate;//	C_CREATE_DATE DATE등록일
	private	String charStatus;//	C_STATUS VARCHAR2(1 BYTE)캐릭터 상태	
	
}
