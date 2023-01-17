package com.kh.ccc.mypage.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyCharacterAttach {

	//파일	
	private int myCharAttachNo;		//	MCA_NO	NUMBER
	private	int	characterNo; //	C_NO	NUMBER
	private	String originName; //	MCA_ORIGIN_NAME	VARCHAR2(300 BYTE)
	private	String changeName; //	MCA_CHANGE_NAME	VARCHAR2(300 BYTE)
	private	int	myCharAttachLevel; //	MCA_CA_LEVEL	NUMBER
	private	Date myCharAttachCreateDate;//	MCA_CREATE_DATE	DATE
	private	String myCharAttachStatus;//	MCA_STATUS	VARCHAR2(1 BYTE)
	
}
