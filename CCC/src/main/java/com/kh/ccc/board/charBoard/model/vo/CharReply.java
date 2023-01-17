package com.kh.ccc.board.charBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CharReply {
	
	private int 	reNo;			//댓글 번호
	private int 	refBno;			//참조게시글 번호
	private String 	reContent; 		//댓글 내용
	private int 	reWriterNo;		//작성자 회원번호
	private String	reWriterName;	//작성자 아이디
	private int		reGroupNo;		//참조댓글번호
	private int		reParentNo;		//부모댓글번호
	private int		reStep;			//대댓글의 순서
	private int		reLevel;		//댓글계층
	private Date 	reCreateDate;	//작성일
	private String 	reStatus;		//상태값(Y/N)
	
}
