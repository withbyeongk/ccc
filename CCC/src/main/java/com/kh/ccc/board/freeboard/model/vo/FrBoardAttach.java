package com.kh.ccc.board.freeboard.model.vo;

public class FrBoardAttach {
	private int faNo;				//자유글 첨부파일 번호	FA_NO	NUMBER
	private int fNo;				//참조 자유글 번호	F_NO	NUMBER
	private String faOrginName;		//첨부파일 수정전 파일명	FA_ORIGIN_NAME	VARCHAR2(500 BYTE)
	private String faChangeName;	//첨부파일 수정후 파일명	FA_CHANGE_NAME	VARCHAR2(500 BYTE)
	private String faFilePath;		//첨부파일 경로	FA_FILE_PATH	VARCHAR2(500 BYTE)
	private String faStatus;		//	FA_STATUS	VARCHAR2(1 BYTE)
	//
	public FrBoardAttach() {
		super();
	}

	public FrBoardAttach(int faNo, int fNo, String faOrginName, String faChangeName, String faFilePath,
			String faStatus) {
		super();
		this.faNo = faNo;
		this.fNo = fNo;
		this.faOrginName = faOrginName;
		this.faChangeName = faChangeName;
		this.faFilePath = faFilePath;
		this.faStatus = faStatus;
	}

	public int getFaNo() {
		return faNo;
	}

	public void setFaNo(int faNo) {
		this.faNo = faNo;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getFaOrginName() {
		return faOrginName;
	}

	public void setFaOrginName(String faOrginName) {
		this.faOrginName = faOrginName;
	}

	public String getFaChangeName() {
		return faChangeName;
	}

	public void setFaChangeName(String faChangeName) {
		this.faChangeName = faChangeName;
	}

	public String getFaFilePath() {
		return faFilePath;
	}

	public void setFaFilePath(String faFilePath) {
		this.faFilePath = faFilePath;
	}

	public String getFaStatus() {
		return faStatus;
	}

	public void setFaStatus(String faStatus) {
		this.faStatus = faStatus;
	}

	@Override
	public String toString() {
		return "FrBoardAttach [faNo=" + faNo + ", fNo=" + fNo + ", faOrginName=" + faOrginName + ", faChangeName="
				+ faChangeName + ", faFilePath=" + faFilePath + ", faStatus=" + faStatus + "]";
	}
	
	
}
