package com.kh.ccc.mypage.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
//마이페이지 내 캐릭터
public class MyCharacter {

				
	private int characterNo;		 //	C_NO	NUMBER
	private int memberNo;		//	M_NO	NUMBER
	private String characterName;		//	C_NAME	VARCHAR2(30 BYTE)
	private int characterLike;		//	C_LIKE	NUMBER
	private String characterContent; //	C_CONTENT	VARCHAR2(2000 BYTE)	
	private Date characterCreateDate;		//	C_CREATE_DATE	DATE
	private String characterStatus;		//	C_STATUS	VARCHAR2(1 BYTE)
	
	//파일join용 추가 필드 
	private int myCharAttachNo;		//	MCA_NO	NUMBER
	private	String originName; //	MCA_ORIGIN_NAME	VARCHAR2(300 BYTE)
	private	String changeName; //	MCA_CHANGE_NAME	VARCHAR2(300 BYTE)
	private	int	myCharAttachLevel; //	MCA_CA_LEVEL	NUMBER
	private	Date myCharAttachCreateDate;//	MCA_CREATE_DATE	DATE
	private	String myCharAttachStatus;//	MCA_STATUS	VARCHAR2(1 BYTE)
	
}
