package com.kh.ccc.board.question.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QuestionReply {
//	QR_NO	NUMBER
//	Q_NO	NUMBER
//	QR_WRITER	NUMBER
//	QR_CONTENT	VARCHAR2(500 BYTE)
//	QR_PARENT_NO	NUMBER
//	QR_LEVEL	NUMBER
//	QR_CREATE_DATE	DATE
//	QR_UPDATE_DATE	DATE
//	QR_DELETE_DATE	DATE
//	QR_STATUS	VARCHAR2(1 BYTE)
	
	private int questionReplyNo;
	private int questionNo;
	private int questionReplyWriterNo;
	private String questionReplyWriter;
	private String questionReplyContent;
	private int questionReplyParentNo;
	private int questionReplyLevel;
	private Date questionReplyCreateDate;
	private Date questionReplyUpdateDate;
	private Date questionReplyDeleteDate;
	private String questionReplyStatus;
}
