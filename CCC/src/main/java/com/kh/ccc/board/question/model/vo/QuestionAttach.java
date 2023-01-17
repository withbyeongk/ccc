package com.kh.ccc.board.question.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QuestionAttach {
//	QA_NO	NUMBER
//	Q_NO	NUMBER
//	QA_ORIGIN_NAME	VARCHAR2(500 BYTE)
//	QA_CHANGE_NAME	VARCHAR2(500 BYTE)
//	QA_FILE_PATH	VARCHAR2(500 BYTE)
//	QA_STATUS	VARCHAR2(1 BYTE)
	
	private int questionAttachNo;
	private int questionNo;
	private String questionAttachOriginName;
	private String questionAttachChangeName;
	private String questionAttachFilePath;
	private String questionAttachStatus;
	
}
