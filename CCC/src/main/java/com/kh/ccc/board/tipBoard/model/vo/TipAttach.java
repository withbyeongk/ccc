package com.kh.ccc.board.tipBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class TipAttach {

	private int 	taNo;			// 팁 첨부파일 번호
	private int 	refBno;			// 참조게시글 번호
	private String 	taOriginName;	// 첨부파일 수정 전 파일
	private String 	taChangeName;	// 첨부파일 수정 후 파일
	private String 	taFilePath;		// 첨부 파일 경로
	private String 	status;			// 첨부파일 상태
	
	public TipAttach() {
		super();
	}

	public TipAttach(int taNo, int refBno, String taOriginName, String taChangeName, String taFilePath, String status) {
		super();
		this.taNo = taNo;
		this.refBno = refBno;
		this.taOriginName = taOriginName;
		this.taChangeName = taChangeName;
		this.taFilePath = taFilePath;
		this.status = status;
	}

	public int getTaNo() {
		return taNo;
	}

	public void setTaNo(int taNo) {
		this.taNo = taNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getTaOriginName() {
		return taOriginName;
	}

	public void setTaOriginName(String taOriginName) {
		this.taOriginName = taOriginName;
	}

	public String getTaChangeName() {
		return taChangeName;
	}

	public void setTaChangeName(String taChangeName) {
		this.taChangeName = taChangeName;
	}

	public String getTaFilePath() {
		return taFilePath;
	}

	public void setTaFilePath(String taFilePath) {
		this.taFilePath = taFilePath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TipAttach [taNo=" + taNo + ", refBno=" + refBno + ", taOriginName=" + taOriginName + ", taChangeName="
				+ taChangeName + ", taFilePath=" + taFilePath + ", status=" + status + "]";
	}
	
	
	
	
}
