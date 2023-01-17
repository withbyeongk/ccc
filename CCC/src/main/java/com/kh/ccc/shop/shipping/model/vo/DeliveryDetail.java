package com.kh.ccc.shop.shipping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class DeliveryDetail{
	
	//Order 테이블의 주문택배영역이 main 
	private String orderInvoidNo;	  //O_INVOICE_NO	VARCHAR2(20 BYTE) 송장번호
	private String orderReceiverName; //O_RECEIVER_NAME	VARCHAR2(20 BYTE) 수신자명
	private String orderAddress;     //O_ADDRESS	VARCHAR2(100 BYTE) 배송주소
	private String orderAddressDetail;//O_ADDRESS_DETAIL	VARCHAR2(100 BYTE) 배송상세주소
	private String orderZipCode;	  //O_ZIP_CODE	VARCHAR2(10 BYTE) 우편번호
	private String orderComment;	  //O_COMMENT	VARCHAR2(100 BYTE)배송메세지
	private String orderPhone;	      //O_PHONE	VARCHAR2(50 BYTE)전화번호
	private String orderPackage;	  //O_PA	NUMBER 택배회사명
	private String orderDeliveryStatus; //O_DELIVERY_STATUS	VARCHAR2(20 BYTE) 배송상태(미도착:N, 도착:Y)
	private String orderStatus;       //O_STATUS	VARCHAR2(1 BYTE) 주문상태(Y:주문진행, N:취소)
	
	
	//join 배송비
	private int deliveryNo; //	D_NO	NUMBER 배송비 번호
	private String deliveryName; //	D_NAME	VARCHAR2(20 BYTE) 배송지역
	private int deliveryFee;//	D_FEE	NUMBER 배송비
	
	
    //join 주문 상세 
    private int orderDetailNo;//	OD_NO	NUMBER  주문상세번호
    
	
}
