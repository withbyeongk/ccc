package com.kh.ccc.board.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class NoticeAttach {
//	NA_NO	NUMBER
//	N_NO	NUMBER
//	NA_ORIGIN_NAME	VARCHAR2(500 BYTE)
//	NA_CHANGE_NAME	VARCHAR2(500 BYTE)
//	NA_FILE_PATH	VARCHAR2(500 BYTE)
//	NA_STATUS	VARCHAR2(1 BYTE)
	private int noticeAttachNo;
	private int noticeNo;
	private String noticeAttachOriginName;
	private String noticeAttachChangeName;
	private String noticeAttachFilePath;
	private String noticeAttachStatus;
}
