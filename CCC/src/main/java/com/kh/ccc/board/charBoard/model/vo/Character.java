package com.kh.ccc.board.charBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Character {
	
	private int 	charNo;			//캐릭터 번호
	private int 	memberNo;		//창작자 번호
	private int 	refBno;			//참조게시글 번호
	private String 	charName;		//캐릭터 이름
	private String	charContent;	//캐릭터 간단 설명
	private int 	like;			//좋아요
	private Date 	createDate;		//캐릭터 등록일
	private String 	status;			//캐릭터 상태
	private String  changeName; 	//첨부파일명    
	
}
