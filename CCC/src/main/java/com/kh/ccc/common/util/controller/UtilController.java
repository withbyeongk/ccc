package com.kh.ccc.common.util.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ccc.common.util.model.service.UtilService;
import com.kh.ccc.board.charBoard.model.vo.Character;

@Controller
public class UtilController {
	
	@Autowired
	private UtilService utilService;
	
	@RequestMapping("createFileDummy.do")
	public String createFileDummy(HttpSession session) {
		
		System.out.println("파일 생성 시작");
		
//		String originPath = "D:\\spring-w\\git\\CCC\\CCC\\src\\main\\webapp\\resources\\dummy\\origin";
		String originPath = "D:\\final-workspace\\git\\CCC\\CCC\\src\\main\\webapp\\resources\\dummy\\origin";
//		String changePath = "D:\\spring-w\\git\\CCC\\CCC\\src\\main\\webapp\\resources\\dummy\\change\\";
		String changePath = "D:\\final-workspace\\git\\CCC\\CCC\\src\\main\\webapp\\resources\\dummy\\change\\";
		File rw = new File(originPath);
		File[] fList = rw.listFiles();
		
//		System.out.println("경로 : "+rw.getPath());
//		System.out.println(fList.length);
		
		if(fList!=null) {
			
			for(File file : fList) {
				
				if(file.isFile()) {
					
					String originName = file.getName();
					System.out.println("변경 전 파일명 : "+originName);
					
					// 파일명 생성
					String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
					String ext = originName.substring(originName.lastIndexOf("."));
					int ranNum = (int)(Math.random() * 90000 + 10000);
					String changeName = currentTime+ranNum+ext;
					System.out.println("변경 후 파일명 : "+changeName);
					
					// 파일 이동 및 파일명 변경
					File afterFile = new File(changePath+changeName);
					boolean result = file.renameTo(afterFile);
					if(!result) {
						System.out.println("실패한 파일 : "+afterFile);
					}
					
					// DB에 캐릭터 더미 등록
					
				}
				
			}
		}
		return"";
	}
	
	@RequestMapping(value="worldCupForm.ut")
	public String goWorldCupForm() {
		
		return "board/playground/worldCupForm";
	}
	
	@RequestMapping(value="worldCup.ut")
	public String goWorldCup(HttpSession session, Model model, int no) {
		// 랜덤으로 이미지를 N개 뽑아야 함.
		
		// 하지만 지금은 더미가 없으므로 임의로 데이터만 넣어서 개발
		ArrayList<Character> clist = new ArrayList<>();
	
		Character c1 = new Character();
		c1.setCharNo(1);
		c1.setCharName("캐릭터 이름 "+(1));
		c1.setCharContent("캐릭터 설명"+(1));
		c1.setMemberNo(1);
		c1.setChangeName("resources/worldCup/img/WC1.jpeg");
		clist.add(c1);
		
		Character c2 = new Character();
		c2.setCharNo(1);
		c2.setCharName("캐릭터 이름 "+(2));
		c2.setCharContent("캐릭터 설명"+(2));
		c2.setMemberNo(2);
		c2.setChangeName("resources/worldCup/img/WC2.jpg");
		clist.add(c2);
		
		Character c3 = new Character();
		c3.setCharNo(1);
		c3.setCharName("캐릭터 이름 "+(3));
		c3.setCharContent("캐릭터 설명"+(3));
		c3.setMemberNo(3);
		c3.setChangeName("resources/worldCup/img/WC3.jpg");
		clist.add(c3);
		
		Character c4 = new Character();
		c4.setCharNo(1);
		c4.setCharName("캐릭터 이름 "+(4));
		c4.setCharContent("캐릭터 설명"+(4));
		c4.setMemberNo(4);
		c4.setChangeName("resources/worldCup/img/WC4.jpg");
		clist.add(c4);
		
		Character c5 = new Character();
		c5.setCharNo(1);
		c5.setCharName("캐릭터 이름 "+(5));
		c5.setCharContent("캐릭터 설명"+(5));
		c5.setMemberNo(5);
		c5.setChangeName("resources/worldCup/img/WC5.jpg");
		clist.add(c5);
		
		Character c6 = new Character();
		c6.setCharNo(6);
		c6.setCharName("캐릭터 이름 "+(6));
		c6.setCharContent("캐릭터 설명"+(6));
		c6.setMemberNo(6);
		c6.setChangeName("resources/worldCup/img/WC6.jpg");
		clist.add(c6);
		
		Character c7 = new Character();
		c7.setCharNo(7);
		c7.setCharName("캐릭터 이름 "+(7));
		c7.setCharContent("캐릭터 설명"+(7));
		c7.setMemberNo(7);
		c7.setChangeName("resources/worldCup/img/WC7.gif");
		clist.add(c7);
		
		Character c8 = new Character();
		c8.setCharNo(1);
		c8.setCharName("캐릭터 이름 "+(8));
		c8.setCharContent("캐릭터 설명"+(8));
		c8.setMemberNo(8);
		c8.setChangeName("resources/worldCup/img/WC8.gif");
		clist.add(c8);
		
		
		System.out.println("캐릭터리스트 : "+clist);
		model.addAttribute("clist", clist);
		
		return "board/playground/worldCup";
	}
	
	@RequestMapping(value="contest.go")
	public String goCompetition(Model model) {
		
		
		return "common/infoCompetition";
	}

}
