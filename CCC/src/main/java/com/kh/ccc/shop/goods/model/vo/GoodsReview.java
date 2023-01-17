package com.kh.ccc.shop.goods.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class GoodsReview {
	private int grNo;
	private int memberNo;
	private int goodsNo;
	private String memberName;
	private int grScore;
	private String grContent;
	private Date grCreateDate;
	private String grStatus;
	private String originName;
	private String changeName;
}