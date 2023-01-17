package com.kh.ccc.board.tipBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class TipReply {
	
	private int 	reNo;			//댓글 번호
	private int 	refBno;			//참조게시글 번호
	private String 	reContent; 		//댓글 내용
	private int 	reWriter;		//작성자 회원번호
	private int		reParentNo;		//참조댓글번호
	private int		reStep;			//대댓글의 순서
	private int		reLevel;		//댓글계층
	private Date 	reCreateDate;	//작성일
	private String 	reStatus;		//상태값(Y/N)
	
	public TipReply() {
		super();
	}

	public TipReply(int reNo, int refBno, String reContent, int reWriter, int reParentNo, int reStep, int reLevel,
			Date reCreateDate, String reStatus) {
		super();
		this.reNo = reNo;
		this.refBno = refBno;
		this.reContent = reContent;
		this.reWriter = reWriter;
		this.reParentNo = reParentNo;
		this.reStep = reStep;
		this.reLevel = reLevel;
		this.reCreateDate = reCreateDate;
		this.reStatus = reStatus;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public int getReWriter() {
		return reWriter;
	}

	public void setReWriter(int reWriter) {
		this.reWriter = reWriter;
	}

	public int getReParentNo() {
		return reParentNo;
	}

	public void setReParentNo(int reParentNo) {
		this.reParentNo = reParentNo;
	}

	public int getReStep() {
		return reStep;
	}

	public void setReStep(int reStep) {
		this.reStep = reStep;
	}

	public int getReLevel() {
		return reLevel;
	}

	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}

	public Date getReCreateDate() {
		return reCreateDate;
	}

	public void setReCreateDate(Date reCreateDate) {
		this.reCreateDate = reCreateDate;
	}

	public String getReStatus() {
		return reStatus;
	}

	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}

	@Override
	public String toString() {
		return "TipReply [reNo=" + reNo + ", refBno=" + refBno + ", reContent=" + reContent + ", reWriter=" + reWriter
				+ ", reParentNo=" + reParentNo + ", reStep=" + reStep + ", reLevel=" + reLevel + ", reCreateDate="
				+ reCreateDate + ", reStatus=" + reStatus + "]";
	}
	
	
	
}
