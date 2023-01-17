package com.kh.ccc.common.template;

import com.kh.ccc.common.model.vo.PageInfo;

public class Pagenation {
	
	public static PageInfo getPageinfo(int listCount,  int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)(Math.ceil(((double)listCount / boardLimit)));
		
		int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
				
		int endPage = startPage + pageLimit - 1;
		
		//startPage가 11일때 endPage는 20으로 된다 (만약 maxPage가 13이라면?)
		//endPage를 maxPage로 변경
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
	}
}
