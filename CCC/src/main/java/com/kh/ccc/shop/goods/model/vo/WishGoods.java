package com.kh.ccc.shop.goods.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class WishGoods {
	
	//wish영역
	private int memberNo; //M_NO NUMBER 멤버넘버

	
	//join goods영역
	private int goodsNo;
	private int characterNo;	//	C_NO	NUMBER 캐릭터번호
	private String goodsName;	//	G_NAME	VARCHAR2(100 BYTE) 굿즈명
	private	String goodsCategory;//	G_CATEGORY	VARCHAR2(100 BYTE) 굿즈카테
	private	int goodsStock;//	G_STOCK	NUMBER 굿즈재고
	private	int goodsPrice;//	G_PRICE	NUMBER 굿즈가격
	private	String goodsContent;//	G_CONTENT	VARCHAR2(400 BYTE) 굿즈설명
	private	String goodsOriginName1;//	G_ORIGIN_NAME1	VARCHAR2(500 BYTE) 썸네일원본명
	private	String goodsChangeName1;//	G_CHANGE_NAME1	VARCHAR2(500 BYTE) 썸네일 수정명
	private	String goodsFilePath;//	G_FILE_PATH	VARCHAR2(500 BYTE)파일경로
	private	String goodsStatus;//	G_STATUS	VARCHAR2(1 BYTE) 굿즈상태
	
}
