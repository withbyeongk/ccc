package com.kh.ccc.board.notice.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.ccc.common.model.vo.PageInfo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data

// Notice 에서 페이징을 변경할 때 사용하는 vo
public class ChangeBoardLimit {
	private ArrayList<Notice> nlist;
	private PageInfo pi;
}
