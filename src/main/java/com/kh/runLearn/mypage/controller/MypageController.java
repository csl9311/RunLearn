package com.kh.runLearn.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.mypage.model.service.MypageService;
import com.kh.runLearn.product.model.service.ProductService;

@SessionAttributes("loginUser")
@Controller

public class MypageController {

	@Autowired
	private MemberService mService;


	@Autowired
	private LectureService lService;

	@Autowired
	private ProductService pService;
	
	@Autowired
	private MypageService myService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping(value = "mypage.do")
	public ModelAndView myPage(@RequestParam(value="page", required=false ) Integer page, HttpSession session, ModelAndView mv, @RequestParam("cate") String cate
			) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getM_id();
		int currentPage = 1;
		int boardLimit = 5;
		int lCount = myService.selectLectureCount(userId);
		int nPayLcount = myService.selectNopayLectureCount(userId);
		int nPayPcount = myService.selectPlistCount(userId);
		int count = 1;
		if(page != null) {  
			currentPage = page;
		}
		
		String m_grade = "";
	
		if(loginUser.getM_grade().equals("M")) {
			m_grade = "튜터";

		}else if(loginUser.getM_grade().equals("U")) {
			m_grade = "유저";
		}
		
		if(cate.equals("튜터")) {
			int listCount = myService.selectLectureCount(userId);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			ArrayList<Map<String, String>> tLectureList = myService.selectTuterLecturePageView(userId, pi);
			mv.addObject("pi",pi);
			mv.addObject("tLectureList", tLectureList);
			
		}
		
	
	
		if(cate.equals("수강목록")) {
			int listCount = myService.selectLectureCount(userId);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			ArrayList<Map<String, String>> lList = myService.selectLectureView(userId, pi); // 수강목록	
			mv.addObject("lList", lList);
			mv.addObject("listCount", listCount);
			mv.addObject("pi",pi);
			mv.addObject("count",count);	
		
		}

		
		if(cate.equals("강의찜목록")) {
			int listCount = myService.selectNopayLectureCount(userId);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			ArrayList<Map<String, String>> noPaylList = myService.selectNoPayLectureView(userId, pi); //강의 찜목록
			mv.addObject("noPaylList", noPaylList);
			mv.addObject("listCount", listCount);
			mv.addObject("pi",pi);		
			
		}
		
		if(cate.equals("상품찜목록")) {
			int listCount =  myService.selectPlistCount(userId); //상품 찜 목록수
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			ArrayList<Map<String, String>> pList = myService.selectProductView(userId, pi); // 상품 찜목록
			mv.addObject("pList", pList);
			mv.addObject("listCount", listCount);
			mv.addObject("pi", pi);
			
		}
		
		
		
		mv.addObject("m_grade", m_grade);
		mv.addObject("lCount", lCount);
		mv.addObject("nPayLcount", nPayLcount);
		mv.addObject("nPayPcount", nPayPcount);
		mv.addObject("cate", cate);
		mv.setViewName("/mypage/mypage");
		return mv;
	}
	
	@RequestMapping(value = "memberUpdate.do") // id하고 name값은 변경 불가하니 첨부터 값불러오게끔
	public String mUpdateView() {
		return "mypage/memberUpdate";

	}

	@RequestMapping(value = "mUpdate.do", method = RequestMethod.POST) // 정보수정
	public String updateMember(@ModelAttribute Member m, @ModelAttribute Member_Image mi,
		@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpSession session, HttpServletRequest request, Model model) {

		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(m.getM_pw().equals("")) {
			m.setM_pw(loginUser.getM_pw());
			
		}else {
			String encpwd = bcryptPasswordEncoder.encode(m.getM_pw());
			m.setM_pw(encpwd);
		}
		
		

		int result = myService.updateMember(m);
		
		
		
		if(uploadFile != null && !uploadFile.isEmpty()) {

			String renameFileName = saveFile(uploadFile, request);

			if(renameFileName != null) {
				mi.setM_origin_name(uploadFile.getOriginalFilename());
				mi.setM_changed_name(renameFileName);
			}
			myService.updateMember_Image(mi);

		}

		if (result > 0) {
			loginUser.setM_pw(m.getM_pw());
			loginUser.setM_email(m.getM_email());
			loginUser.setM_phone(m.getM_phone());
			loginUser.setPostnum(m.getPostnum());
			loginUser.setG_address(m.getG_address());
			loginUser.setR_address(m.getR_address());
			loginUser.setD_address(m.getD_address());

			session.setAttribute("loginUser", loginUser);
		}
		
		model.addAttribute("cate", "수강목록");
		return "redirect:mypage.do?";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root
			= request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\muploadFiles";

		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath)); // 전달 받은 file이 rename명으로 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return renameFileName;

	}
	
	
	
}
