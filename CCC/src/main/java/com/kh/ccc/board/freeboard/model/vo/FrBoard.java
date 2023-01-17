package com.kh.ccc.board.freeboard.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class FrBoard {
	////
	 private int	fNo;		//자유게시판 글번호			
	 private int	fWriterNo;	//자유게시판 작성자번호
	 private String mId;//자유게시판 작성자아이디
	 private int 	fType;		//자유게시판 유형
	 private String fTitle;		//자유게시판 제목		
	 private String fContent;	//자유게시판 내용	
	 private int	fCount;		//자유게시판 조회수	
	 private Date	fCreateDate;//자유게시판 작성일			
	 private Date	fUpdateDate;//자유게시판 수정일	
	 private Date	fDeleteDate;//자유게시판 삭제일			
	 private String fStatus;	//자유게시판 상태			
	 private String fTitleimg;  //자유게시판 파일이미지
	 
public FrBoard() {
	super();
}

public FrBoard(int fNo, int fWriterNo, String mId, int fType, String fTitle, String fContent, int fCount,
		Date fCreateDate, Date fUpdateDate, Date fDeleteDate, String fStatus, String fTitleimg) {
	super();
	this.fNo = fNo;
	this.fWriterNo = fWriterNo;
	this.mId = mId;
	this.fType = fType;
	this.fTitle = fTitle;
	this.fContent = fContent;
	this.fCount = fCount;
	this.fCreateDate = fCreateDate;
	this.fUpdateDate = fUpdateDate;
	this.fDeleteDate = fDeleteDate;
	this.fStatus = fStatus;
	this.fTitleimg = fTitleimg;
}

public int getfNo() {
	return fNo;
}

public void setfNo(int fNo) {
	this.fNo = fNo;
}

public int getfWriterNo() {
	return fWriterNo;
}

public void setfWriterNo(int fWriterNo) {
	this.fWriterNo = fWriterNo;
}

public String getmId() {
	return mId;
}

public void setmId(String mId) {
	this.mId = mId;
}

public int getfType() {
	return fType;
}

public void setfType(int fType) {
	this.fType = fType;
}

public String getfTitle() {
	return fTitle;
}

public void setfTitle(String fTitle) {
	this.fTitle = fTitle;
}

public String getfContent() {
	return fContent;
}

public void setfContent(String fContent) {
	this.fContent = fContent;
}

public int getfCount() {
	return fCount;
}

public void setfCount(int fCount) {
	this.fCount = fCount;
}

public Date getfCreateDate() {
	return fCreateDate;
}

public void setfCreateDate(Date fCreateDate) {
	this.fCreateDate = fCreateDate;
}

public Date getfUpdateDate() {
	return fUpdateDate;
}

public void setfUpdateDate(Date fUpdateDate) {
	this.fUpdateDate = fUpdateDate;
}

public Date getfDeleteDate() {
	return fDeleteDate;
}

public void setfDeleteDate(Date fDeleteDate) {
	this.fDeleteDate = fDeleteDate;
}

public String getfStatus() {
	return fStatus;
}

public void setfStatus(String fStatus) {
	this.fStatus = fStatus;
}

public String getfTitleimg() {
	return fTitleimg;
}

public void setfTitleimg(String fTitleimg) {
	this.fTitleimg = fTitleimg;
}

@Override
public String toString() {
	return "FrBoard [fNo=" + fNo + ", fWriterNo=" + fWriterNo + ", mId=" + mId + ", fType=" + fType + ", fTitle="
			+ fTitle + ", fContent=" + fContent + ", fCount=" + fCount + ", fCreateDate=" + fCreateDate
			+ ", fUpdateDate=" + fUpdateDate + ", fDeleteDate=" + fDeleteDate + ", fStatus=" + fStatus + ", fTitleimg="
			+ fTitleimg + "]";
}



 
}
