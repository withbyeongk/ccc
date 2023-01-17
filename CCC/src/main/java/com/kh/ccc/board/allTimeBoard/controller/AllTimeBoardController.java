package com.kh.ccc.board.allTimeBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ccc.board.allTimeBoard.model.service.AlltimeBoardService;
import com.kh.ccc.board.charBoard.model.vo.CharAttach;
import com.kh.ccc.board.charBoard.model.vo.Character;

@Controller
public class AllTimeBoardController {

	@Autowired
	private AlltimeBoardService AlltimeBoardService;
	
	
	//역대수상작 리스트로 이동 ..! 
	@RequestMapping("list.alltimelistgo")
	public ModelAndView alltimelistgo(ModelAndView mv){
		
		System.out.println("============여기는 리스트로 이동  ==========");

		mv.setViewName("board/allTimeBoard/AlltimeBoardListView2");
		return mv;
	}
	
	
	//리스트 뿌려주기 
	@ResponseBody
	@RequestMapping(value="list.alltimech",produces="application/json; charset=UTF-8")
	public String allTimeBoard(){

		ArrayList<Character> altimelist = AlltimeBoardService.allTimeSelectList();

		
		System.out.println("============여기는 리스트 뿌리기로 이동  ==========");

		//비어있으면 NNNNN 반환 , 내용이 들어있으면 YYY
		return new Gson().toJson(altimelist);
//		return altimelist.isEmpty() ? "NNNNN" : "YYY";
	}
	
	//아래는 이번달 좋아요 
	@ResponseBody
	@RequestMapping(value="ThisMonthLikes.li",produces="application/json; charset=UTF-8")
	public String ThisMonthLikes() {
		
		// 캐릭터 vo 조회 
		ArrayList<Character> allTimelist = AlltimeBoardService.allTimeSelectList();

		System.out.println("altimelist는??"+allTimelist);
		System.out.println("============여기는 이번달 좋아요 ==========");

		return new Gson().toJson(allTimelist);
		
	}
	
	//아래는 이번년도 좋아요 리스트 
	@ResponseBody
	@RequestMapping(value="ThisYearLikes.li",produces="application/json; charset=UTF-8")

	public String ThisYearLikes() {
		
		// 캐릭터 vo 조회 
		ArrayList<Character> altimelist = AlltimeBoardService.allTimeYearList();
		
		System.out.println("올해꺼 좋아요 altimelist는??"+altimelist);
		System.out.println("============여기는 올해꺼 좋아요 ==========");
		
		return new Gson().toJson(altimelist);
	}
	
}
