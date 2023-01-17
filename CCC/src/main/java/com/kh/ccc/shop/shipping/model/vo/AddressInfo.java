package com.kh.ccc.shop.shipping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AddressInfo {
//	AI_ADDRESS_NO	NUMBER
//	M_NO	NUMBER
//	AI_RECEIVER_NAME	VARCHAR2(20 BYTE)
//	AI_ADDRESS_NAME	VARCHAR2(20 BYTE)
//	AI_ADDRESS	VARCHAR2(100 BYTE)
//	AI_ADDRESS_DETAIL	VARCHAR2(100 BYTE)
//	AI_ZIP_CODE	VARCHAR2(10 BYTE)
//	AI_COMMENT	VARCHAR2(100 BYTE)
//	AI_PHONE	VARCHAR2(50 BYTE)
//	AI_STATUS	VARCHAR2(1 BYTE)
	
	private int addressNo;
	private int memberNo;
	private String memberName;
	private String receiverName;
	private String addressName;
	private String address;
	private String addressDetail;
	private String zipCode;
	private String comment;
	private String phone;
	private String status;
}
