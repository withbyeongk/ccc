package com.kh.ccc.board.question.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Question {
//	Q_NO	NUMBER
//	Q_LEVEL	NUMBER
//	Q_WRITER	NUMBER
//	Q_TYPE	NUMBER
//	Q_TITLE	VARCHAR2(100 BYTE)
//	Q_CONTENT	VARCHAR2(3000 BYTE)
//	Q_RESPONSE	VARCHAR2(3000 BYTE)
//	Q_COUNT	NUMBER
//	Q_CREATE_DATE	DATE
//	Q_UPDATE_DATE	DATE
//	Q_DELETE_DATE	DATE
//	Q_STATUS	VARCHAR2(1 BYTE)
	
	private int questionNo;
	private int questionLevel;
	private int questionWriterNo; 
	private String questionWriter;
	private int questionTypeNo;
	private String questionType;
	private String questionTitle;
	private String questionContent;
	private String questionResponse;
	private int questionCount;
	private Date questionCreateDate;
	private Date questionUpdateDate;
	private Date questionDeleteDate;
	private String questionStatus;
}
