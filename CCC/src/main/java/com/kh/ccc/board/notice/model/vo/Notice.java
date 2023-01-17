package com.kh.ccc.board.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Notice {
//	N_NO	NUMBER
//	N_WRITER	NUMBER
//	N_TYPE	NUMBER
//	N_TITLE	VARCHAR2(100 BYTE)
//	N_CONTENT	VARCHAR2(3000 BYTE)
//	N_COUNT	NUMBER
//	N_CREATE_DATE	DATE
//	N_UPDATE_DATE	DATE
//	N_DELETE_DATE	DATE
//	N_STATUS	VARCHAR2(1 BYTE)
	
	private int noticeNo;
	private int noticeWriterNo; 
	private String noticeWriter;
	private int noticeTypeNo;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private int noticeCount;
	private Date noticeCreateDate;
	private Date noticeUpdateDate;
	private Date noticeDeleteDate;
	private String noticeStatus;
	
}
