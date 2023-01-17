package com.kh.ccc.board.charBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CharAttach {

	private int 	fileNo;		//파일번호
	private int 	refBno;		//참조게시글 번호
	private String 	originName;	//원본파일명
	private String 	changeName;	//바뀐파일명
	private int 	level;		//파일레벨 (1:대표/2:일반)
	private Date 	createDate;	//파일등록일
	private String 	status;		//상태값(Y/N)
	
}
