package com.kh.ccc.board.playground.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


	@Controller
	public class PlayGround {
		//놀이터
		@RequestMapping("playground.fr")
		public ModelAndView wouldCup(ModelAndView mv) {
			mv.setViewName("board/playground/playGround");
			return mv;
			
		}
//		
//		
//		@RequestMapping("worldCup.fr")
//		public ModelAndView wouldCup2(ModelAndView mv) {
//			
//			
//			WorldCup.main(null);
//			mv.setViewName("board/playground/playGround");
//			return mv;
//			
//		}
		
		
	}
