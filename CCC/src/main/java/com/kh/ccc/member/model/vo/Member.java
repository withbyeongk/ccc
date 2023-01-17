package com.kh.ccc.member.model.vo;

import java.sql.Date;

import com.kh.ccc.shop.goods.model.vo.Wish;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	
	private int memberNo;		//	M_NO	NUMBER
	private String memberId;		//	M_ID	VARCHAR2(20 BYTE)
	private String memberPwd;		//	M_PWD	VARCHAR2(20 BYTE)
	private String memberName;		//	M_NAME	VARCHAR2(30 BYTE)
	private int memberGradeNo;		//	MG_NO	NUMBER
	private String memberEmail; 	//	M_EMAIL	VARCHAR2(30 BYTE)
	private String memberPhone;	//	M_PHONE	VARCHAR2(20 BYTE)
	private String memberAddress; //	M_ADDRESS	VARCHAR2(100 BYTE)
	private String memberGender;		//	M_GENDER	VARCHAR2(20 BYTE)
	private int memberAge;		//	M_AGE	NUMBER
	private Date memberCreateDate;	//	M_CREATE_DATE	DATE
	private Date memberUpdateDate;	//	M_UPDATE_DATE	DATE
	private Date memberDeleteDate;	//	M_DELETE_DATE	DATE
	private int memberPoint;		//	M_POINT	NUMBER
	private String memberStatus;	 //M_STATUS	VARCHAR2(1 BYTE)	
	
}
