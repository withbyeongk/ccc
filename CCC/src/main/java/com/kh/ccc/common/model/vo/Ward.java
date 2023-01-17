package com.kh.ccc.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Ward {

	private int 	wardNo;		//금지어번호
	private String 	wardName;	//금지어
	private int 	penalty;	//패널티점수
	private Date 	createDate;	//금지어 등록일
	private Date 	updateDate;	//금지어 수정일
	private Date 	deleteDate;	//금지어 삭제일
	private String 	status;		//상태
	
}
