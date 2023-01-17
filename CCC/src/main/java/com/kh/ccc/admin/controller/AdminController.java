package com.kh.ccc.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ccc.admin.model.service.AdminService;
import com.kh.ccc.admin.model.vo.Admin;
import com.kh.ccc.admin.model.vo.AdminAttach;
import com.kh.ccc.member.model.vo.Member;



@Controller
public class AdminController {
	
		@Autowired
		private AdminService adminService;
	
	
		//회원관리로 전달
		@RequestMapping("mainAdmin.ad")
		public String mainAdmin() {
		
		return "admin/mainAdmin";
		
		}
	
	
		//리스트 조회 + 회원수
		@RequestMapping("member.ad")
		public String memberList(Model model) {
		
		//회원수
		int listCount = adminService.selectListCount();
		
		model.addAttribute("listCount",listCount);
		
		//리스트조회
		ArrayList<Member> mList = adminService.memberList();
		
		model.addAttribute("mList",mList);
		
		//차트1
		LocalDate now = LocalDate.now();
		String today=LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		int year=Integer.parseInt(today.substring(8,10));
		//System.out.println("올해: "+year);
		//int Year1 =Integer.parseInt(year)-1;
		//System.out.println("작년: "+Year1);
		//int lastYearCount = adminService.lastYearChart(Year1);
		
		//ArrayList<Integer> iList = new ArrayList<>();
		//iList.add(30);
		//System.out.println("member.ad:: iList : " + iList);
		//model.addAttribute("iList",iList);

		ArrayList<Integer> yearList = new ArrayList<Integer>();
		//yearList.add(year-5);
		//yearList.add(year-4);
		//yearList.add(year-3);
		//yearList.add(year-2);
		//yearList.add(year-1);
		//yearList.add(year);
		
		for(int i=5; i>=0; i--) {
			yearList.add(year-i);	
		}
		
		//System.out.println("yearList:"+yearList);

		ArrayList<String> countList = adminService.thisYearChart(yearList);
		//System.out.println(countList);

		model.addAttribute("yearList",yearList);

		model.addAttribute("countList",countList);

		//barChart
		ArrayList<String> monthList = new ArrayList<String>();
		
		for(int i=12; i>=1; i--) {
			
			Calendar mon = Calendar.getInstance( );
			mon.add ( Calendar.MONTH, -i );
			String beforeMonth = new java.text.SimpleDateFormat("MM").format(mon.getTime());
			
			monthList.add(beforeMonth);
		}
		
		//System.out.println(monthList);
		
		ArrayList<String> countMonthList = adminService.monthChart(monthList);
		//System.out.println(countMonthList);
		
		model.addAttribute("monthList",monthList);
		model.addAttribute("countMonthList",countMonthList);
		
		//문의 답글필요
		int qCount = adminService.selectQcount();
		
		model.addAttribute("qCount",qCount);
		
		
		//누적 주문수량
		int countOrder = adminService.selectOrderCount();
		
		model.addAttribute("countOrder",countOrder);
		System.out.println(countOrder);
		
		
		
		return "admin/memberAdmin";
		
		
		}
	
		//엑셀
		@PostMapping("excelDownload.ad")
		public void textExcel(HttpServletResponse response) throws IOException {

		Workbook workbook= new SXSSFWorkbook();
		Sheet sheet = workbook.createSheet("회원리스트");
		int rowNo = 0;
		
		//색상
		CellStyle styleOfBoardFillFontRedBold14 = workbook.createCellStyle();
		styleOfBoardFillFontRedBold14.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
			
		int rowIndex = 0;  //헤더 생성
		Row headerRow = sheet.createRow(rowIndex++);
		Cell headerCell1 = headerRow.createCell(0);
		headerCell1.setCellValue("회원번호");	

		headerCell1.setCellStyle(styleOfBoardFillFontRedBold14); //색상
		
		
		Cell headerCell2 = headerRow.createCell(1);
		headerCell2.setCellValue("아이디");
		Cell headerCell3 = headerRow.createCell(2);
		headerCell3.setCellValue("이름");
		Cell headerCell4 = headerRow.createCell(3);
		headerCell4.setCellValue("성별");
		Cell headerCell5 = headerRow.createCell(4);
		headerCell5.setCellValue("회원등급");
		Cell headerCell6 = headerRow.createCell(5);
		headerCell6.setCellValue("회원점수");
			
		//list 돌려주기
		ArrayList<Member> mList = adminService.memberList();
		for (Member m : mList) {
		
		Row bodyRow = sheet.createRow(rowIndex++); //바디 생성
	    Cell bodyCell1 = bodyRow.createCell(0);
	    bodyCell1.setCellValue(m.getMemberNo());
	    Cell bodyCell2 = bodyRow.createCell(1);
	    bodyCell2.setCellValue(m.getMemberId());
	    Cell bodyCell3 = bodyRow.createCell(2);
	    bodyCell3.setCellValue(m.getMemberName());
	    Cell bodyCell4 = bodyRow.createCell(3);
	    bodyCell4.setCellValue(m.getMemberGender());
	    Cell bodyCell5 = bodyRow.createCell(4);
	    bodyCell5.setCellValue(m.getMemberGradeNo());
	    Cell bodyCell6 = bodyRow.createCell(5);
	    bodyCell6.setCellValue(m.getMemberPoint());
		
		}

	 	response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=CCC_memberList.xlsx");
 
        try {
			workbook.write(response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    
	
		}
		
		
		
		
		//일반회원 check회원들 차단삭제
		@ResponseBody
		@RequestMapping("deleteClickMember.ad")
		public String deleteClick(HttpServletRequest request,@RequestParam(value="checkBoxArr[]") List<String> checkBoxArr) throws Exception {
			
			System.out.println(checkBoxArr);
			
			//String.join사용 안함 -> String names = String.join(",", checkBoxArr);
			
			//차단삭제
			int result = adminService.deleteMemberList(checkBoxArr);
			
			//ArrayList<Member> mList = adminService.memberList();
			//System.out.println("삭제후 list: "+mList);
			
			
			return result>0? "yes" : "no";
		
		}
		
		
	

		
		//일반회원상세보기
		@RequestMapping("memberDetail.ad")
		public String selectDetailMember(int mno,Model model) {
			
			//System.out.println("번호는:"+mno);
			
			Member m = adminService.detailMember(mno);
			
			model.addAttribute("m",m);	
			
			return "admin/memberDetail";

			
		}
		

		//관리자등록 페이지로 이동
		@GetMapping("insert.ad")
		public String insertAdmin() {

			return "admin/adminEnrollForm";

		}

		//관리자등록(첨부파일)
		@PostMapping("insert.ad")
		public ModelAndView insertAdmin(Admin a,ModelAndView mv, HttpSession session,
				@RequestParam(value="multifile", required=true) ArrayList<MultipartFile> upfileList) {
			
			//System.out.println(a);
			//System.out.println(upfileList);
			
			//암호화하기
			String encPwd = bcryptpasswordEncoder.encode(a.getaPwd());
			a.setaPwd(encPwd);
			System.out.println("암호화 패스워드 : "+encPwd);
			
			//------첨부파일 start------//
			
			//첨부파일이 여러개 혹은 빈값으로 넘어올 수 있기 때문에 ArrayList에 다시 담아주자
			ArrayList<AdminAttach> adminAttach = new ArrayList<AdminAttach>();
			
			if(upfileList != null) {//첨부파일 있을시
				
				for(int i=0; i<upfileList.size(); i++) {
					//System.out.println("i:"+i);
					
					if(!upfileList.get(i).getOriginalFilename().equals("")) { //i번째 첨부 있으면
						
						//아래 saveFile메소드 이용하여 resources/adminUpload 저장하고 파일명 수정하여 반환저장
						AdminAttach aa = new AdminAttach();
						
						String changeName= saveFile(upfileList.get(i),session);
						aa.setAdminOriginName(upfileList.get(i).getOriginalFilename());
						aa.setAdminChangeName(changeName);
						aa.setAdminChangeFile("resources/adminUpload/");
						aa.setAdminLevel(i+1);
						
						adminAttach.add(aa);
						
						//System.out.println(adminAttach);
						//System.out.println("길이:"+ adminAttach.size());
						//System.out.println("첨부:"+ aa);
						
					}
				} 
				
			} //------첨부파일 end------//
		
			
			int result = adminService.insertAdmin(a, adminAttach);
			//System.out.println("result는 : "+ result);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "관리자를 등록했습니다");
				mv.setViewName("admin/memberAdmin");
			}else {
				mv.addObject("errorMsg", "관리자 등록 실패했습니다").setViewName("common/errorPage");
			}
			return mv;
		}
			
		
			
	
			// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 메소드 (모듈)
			public String saveFile(MultipartFile upfile, HttpSession session) {
		
				// 1. 원본파일명 뽑기
				String originName = upfile.getOriginalFilename();
		
				// 2. 시간형식을 문자열로 뽑기
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
				// 3. 뒤에 붙일 랜덤값 뽑기
				int ranNum = (int) (Math.random() * 90000 + 10000); // 5자리 랜덤값
		
				// 4. 원본 파일명으로부터 확장자명 뽑아오기
				String ext = originName.substring(originName.lastIndexOf("."));
		
				// 5. 뽑아놓은 값 전부 붙여서 파일명 만들기
				String changeName = currentTime + ranNum + ext;
		
				// 6. 업로드 하고자 하는 실제 위치 경로 지정해주기 (실제 경로. 8번 changeName이랑 비교)
				String savePath = session.getServletContext().getRealPath("/resources/adminUpload/");
		
				// 7. 경로와 수정파일명 합쳐서 파일을 업로드해주기
				try {
					upfile.transferTo(new File(savePath + changeName));
		
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
				return changeName;
			}
		
		
	
		//관리자리스트 조회 (특수관리자페이지)
		@RequestMapping("adminList.ad")
		public String selectAdmin(Model model) {
			
		ArrayList<Admin> aList = adminService.adminList();
			
		model.addAttribute("aList",aList);	
		
		//관리자 사진 조회
		ArrayList<AdminAttach> adList = adminService.adminAttachmentList();
		
		model.addAttribute("adList",adList);	
		
		//System.out.println(adList);
			
		return "admin/adminListConfirm";

		}
			

		//관리자 사진 클릭 후 상세조회 (특수관리자페이지)
		@RequestMapping("adminDetail.ad")
		public String detailAdmin(int ano,Model model) {
			
		//System.out.println("번호는:"+ano);
		
		//관리자상세
		Admin a = adminService.detailAdmin(ano);
		//System.out.println("관리자:"+a);
		
		
		//첨부상세
		ArrayList<AdminAttach> at = adminService.selectATList(ano);
		//System.out.println("첨부:"+at);
		
		model.addAttribute("a",a);	
		model.addAttribute("at",at);	

		return "admin/adminDetailConfirm";

		}	
			
	
		//로그인 BCryptPasswordEncoder
		@Autowired
		private BCryptPasswordEncoder bcryptpasswordEncoder;
		
		//메인에서 로그인폼 전달
		@RequestMapping("loginAdmin.ad")
		public String adminLoginForm() {

			return "admin/adminLogin";

		}
		
		
		//로그인
		@GetMapping("login.ad")
		public String adminLogin() {

			return "admin/adminLogin";

		}
		
		@RequestMapping("login.ad")
		public ModelAndView loginAdmin(String aId,String aPwd,
								 HttpSession session,
								 ModelAndView mv) {
			
			//System.out.println(aId);
			//System.out.println(aPwd);
				
			Admin loginAdmin = adminService.loginAdmin(aId); // loginAdmin는 아이디로 조회해온 회원정보 (aPwd는 암호화됨)
			
			if(loginAdmin != null && bcryptpasswordEncoder.matches(aPwd, loginAdmin.getaPwd())) {
				session.setAttribute("loginAdmin", loginAdmin);
				mv.setViewName("redirect:/mainAdmin.ad");
			}else {
				mv.addObject("errorMsg", "로그인 실패");
				mv.setViewName("common/errorPage");
			}
				
			return mv;
		}
		
		
		//로그아웃
		@RequestMapping("logout.ad")
		public String logoutMember(HttpSession session) {
			
			session.removeAttribute("loginAdmin");
			
			return "admin/mainAdmin";
		}
		
		
		
		
}
