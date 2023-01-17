
package com.kh.ccc.shop.goods.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class Goods {

	private int goodsNo;				//	G_NO	NUMBER
	private int characterNo;			//	C_NO	NUMBER
	private String characterName;
	private String goodsName;			//	G_NAME	VARCHAR2(100 BYTE)
	private String goodsBrand;
	private	String goodsCategory;		//	G_CATEGORY	VARCHAR2(100 BYTE)
	private	int goodsStock;				//	G_STOCK	NUMBER
	private	int goodsPrice;				//	G_PRICE	NUMBER
	private	String goodsContent;		//	G_CONTENT	VARCHAR2(400 BYTE)
	private	String goodsOriginName1;	//	G_ORIGIN_NAME1	VARCHAR2(500 BYTE)
	private	String goodsChangeName1;	//	G_CHANGE_NAME1	VARCHAR2(500 BYTE)
	private	String goodsOriginName2;	//	G_ORIGIN_NAME2	VARCHAR2(500 BYTE)
	private	String goodsChangeName2;	//	G_CHANGE_NAME2	VARCHAR2(500 BYTE)
	private	String goodsOriginName3;	//	G_ORIGIN_NAME3	VARCHAR2(500 BYTE)
	private	String goodsChangeName3;	//	G_CHANGE_NAME3	VARCHAR2(500 BYTE)
	private	String goodsOriginName4; 	//	G_ORIGIN_NAME4	VARCHAR2(500 BYTE)
	private	String goodsChangeName4;	//	G_CHANGE_NAME4	VARCHAR2(500 BYTE)
	private	String goodsFilePath;		//	G_FILE_PATH	VARCHAR2(500 BYTE)
	private	Date goodsEnrollDate; 		//	G_ENROLL_DATE	DATE
	private	String goodsStatus;			//	G_STATUS	VARCHAR2(1 BYTE)
	
}

