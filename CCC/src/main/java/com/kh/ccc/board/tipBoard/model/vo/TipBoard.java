package com.kh.ccc.board.tipBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class TipBoard {
	
	private int 	tNo;			// 팁 글 번호
	private String 	tWriter;		// 팁 작성자
	private String 	tType;			// 팁 유형
	private String 	tTitle;			// 팁 글 제목
	private String 	tContent;		// 팁 글 내용
	private int 	count;			// 팁 글 조회수
	private Date	tCreateDate;	// 팁 글 작성일
	private Date	tUpdateDate;	// 팁 글 수정일
	private Date	tDeleteDate;	// 팁 글 삭제일
	private String 	status;			// 팁 글 상태
	
	public TipBoard() {
		super();
	}

	public TipBoard(int tNo, String tWriter, String tType, String tTitle, String tContent, int count, Date tCreateDate,
			Date tUpdateDate, Date tDeleteDate, String status) {
		super();
		this.tNo = tNo;
		this.tWriter = tWriter;
		this.tType = tType;
		this.tTitle = tTitle;
		this.tContent = tContent;
		this.count = count;
		this.tCreateDate = tCreateDate;
		this.tUpdateDate = tUpdateDate;
		this.tDeleteDate = tDeleteDate;
		this.status = status;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public String gettWriter() {
		return tWriter;
	}

	public void settWriter(String tWriter) {
		this.tWriter = tWriter;
	}

	public String gettType() {
		return tType;
	}

	public void settType(String tType) {
		this.tType = tType;
	}

	public String gettTitle() {
		return tTitle;
	}

	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}

	public String gettContent() {
		return tContent;
	}

	public void settContent(String tContent) {
		this.tContent = tContent;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date gettCreateDate() {
		return tCreateDate;
	}

	public void settCreateDate(Date tCreateDate) {
		this.tCreateDate = tCreateDate;
	}

	public Date gettUpdateDate() {
		return tUpdateDate;
	}

	public void settUpdateDate(Date tUpdateDate) {
		this.tUpdateDate = tUpdateDate;
	}

	public Date gettDeleteDate() {
		return tDeleteDate;
	}

	public void settDeleteDate(Date tDeleteDate) {
		this.tDeleteDate = tDeleteDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TipBoard [tNo=" + tNo + ", tWriter=" + tWriter + ", tType=" + tType + ", tTitle=" + tTitle
				+ ", tContent=" + tContent + ", count=" + count + ", tCreateDate=" + tCreateDate + ", tUpdateDate="
				+ tUpdateDate + ", tDeleteDate=" + tDeleteDate + ", status=" + status + "]";
	}
	
	
	
}
