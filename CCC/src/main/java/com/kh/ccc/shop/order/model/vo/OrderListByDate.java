package com.kh.ccc.shop.order.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

//기간별 조회용 주문객체
public class OrderListByDate {

	//시작일 객체
	//마지막일 객체
	
	//사용자번호 
	Date startDate;
	Date endDate;
	 
	int memberNo;
	
}
