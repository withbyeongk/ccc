package com.kh.ccc.board.charBoard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CharLike {

	private int 	memberNo;	//회원 번호
	private int 	charNo;		//캐릭터 번호
	private int		refBno;		//참조게시글 번호 (테이블에는 없음)
	private int 	charLike;	//좋아요 유무
	
}
