package com.kh.ccc.shop.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Cart {
//	CART_NO	NUMBER
//	M_NO	NUMBER
//	G_NO	NUMBER
//	QUANTITY NUMBER
//	OPTION1	VARCHAR2(30 BYTE)
//	OPTION2	VARCHAR2(30 BYTE)
	private int cartNo;
	private int memberNo;
	private String memberName;
	private int goodsNo;
	private int quantity;
	private String option1;
	private String option2;
	
	private String goodsName;
	private int goodsPrice;
	private int goodsStock;
	
	private String goodsAttachOriginName;
	private String goodsAttachChangeName;
	private String goodsAttachFilePath;
	
	private String goodsStatus;
	
}
