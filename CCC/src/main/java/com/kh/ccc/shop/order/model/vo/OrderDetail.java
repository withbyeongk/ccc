package com.kh.ccc.shop.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

//여러 상품리스트가 들어갈 영역
//굿즈리스트(굿즈+상세주문 join 리스트로 출력)
public class OrderDetail {

	private int orderDetailNo; //OD_NO	NUMBER 주문상세번호
	private int orderNo;       //O_NO	NUMBER 주문번호
	private int goodsNo;       //G_NO	NUMBER 굿즈번호
	private int goodsPrice;    //G_PRICE	NUMBER 굿즈가격
	private int quantity;      //QUANTITY NUMBER 굿즈구매수량
	private int option1;       //OPTION1	NUMBER 굿즈옵션1
	private int option2;      //OPTION2	NUMBER 굿즈옵션2
	
    //굿즈영역
	private String goodsName; //	G_NAME	VARCHAR2(100 BYTE) 굿즈명
	private String goodsOriginName;//	G_ORIGIN_NAME1	VARCHAR2(500 BYTE) 썸네일원본명
	private String goodsChangeName; //	G_CHANGE_NAME1	VARCHAR2(500 BYTE) 썸네일수정명
	private String goodsFilePath; //	G_FILE_PATH	VARCHAR2(500 BYTE) 썸네일파일경로
	private String goodsStatus; //굿즈상태
	
}