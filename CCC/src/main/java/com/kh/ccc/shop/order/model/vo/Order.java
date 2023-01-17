package com.kh.ccc.shop.order.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Order {
	
	//주문
	private int orderNo;	  		  //O_NO	NUMBER 주문번호 *
	private int memberNo;	  		  //M_NO	NUMBER 사용자번호 *
	private int deliveryNo;	    	  //D_NO	NUMBER 배송비번호  *
	private Date orderDate;	    	  //O_DATE	DATE 주문일자
	private int orderFinalAmount;	  //O_FINAL_AMOUNT NUMBER 최종결제금액
	private String orderInvoiceNo;	  //O_INVOICE_NO	VARCHAR2(20 BYTE) 송장번호
	private String orderReceiverName; //O_RECEIVER_NAME	VARCHAR2(20 BYTE) 수신자명
	private String orderAddress;     //O_ADDRESS	VARCHAR2(100 BYTE) 배송주소
	private String orderAddressDetail;//O_ADDRESS_DETAIL	VARCHAR2(100 BYTE) 배송상세주소
	private String orderZipCode;	  //O_ZIP_CODE	VARCHAR2(10 BYTE) 우편번호
	private String orderComment;	  //O_COMMENT	VARCHAR2(100 BYTE)배송메세지
	private String orderPhone;	      //O_PHONE	VARCHAR2(50 BYTE)전화번호
	private String orderPackage;	  //O_PA	NUMBER 택배회사명
	private String orderDetailStatus; //O_DELIVERY_STATUS	VARCHAR2(20 BYTE) 배송상태(미도착:N, 도착:Y)
	private String orderStatus;       //O_STATUS	VARCHAR2(1 BYTE) 주문상태(Y:주문진행, N:취소)
	
	
    //  join  배송비영역	
	private	int delveryNo;	//	D_NO	NUMBER
	private	String deliveryName;	//	D_NAME	VARCHAR2(20 BYTE)
	private	int deliveryFee;	//	D_FEE	NUMBER
}
