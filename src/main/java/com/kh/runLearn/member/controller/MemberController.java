package com.kh.runLearn.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.product.model.vo.Product;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	
	@Autowired
	private BCryptPasswordEncoder BCryptPasswordEncoder;
	
	
	@RequestMapping("minsertView.do")
	public String memberInsertView() {
		return "/member/signUp";
	}

	@RequestMapping("form.do")
	public String memberInsertForm() {
		return "/member/signUpForm";
	}

	@RequestMapping(value = "mypage.do")
	public ModelAndView myPage(HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userId = "nakcom06a";
		

		ArrayList<Lecture> lList = mService.selectLectureMember(userId); // 수강목록 
		ArrayList<Lecture> noPaylList = mService.selectNoPayLecture(userId); //찜한 수강목록
		ArrayList<Product> pList = mService.selectItemMember(userId); // 찜상품목록
		
		int lListCount = mService.selectLectureCount(userId); //수강목록 수
		int noPayLectureListCount = mService.selectNoPayLectureCount(userId); // 찜한강의 수

		
		
		
		

		mv.addObject("lList", lList);
		mv.addObject("pList", pList);
		mv.addObject("noPaylList", noPaylList);
		
		mv.addObject("noPayLectureListCount", noPayLectureListCount);
		mv.addObject("lListCount", lListCount);
		mv.setViewName("mypage/mypage");

		
			
		return mv;
	}

	@RequestMapping(value = "memberUpdate.do") // id하고 name값은 변경 불가하니 첨부터 값불러오게끔
	public String mUpdateView() {
		return "mypage/memberUpdate";

	}

	@RequestMapping(value = "mUpdate.do", method = RequestMethod.POST) // 정보수정
	public String updateMember(@ModelAttribute Member m, @ModelAttribute Member_Image mi,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpSession session, HttpServletRequest request) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(m.getM_pw().equals("")) {
			m.setM_pw(loginUser.getM_pw());
		}
		
		int result = mService.updateMember(m);
		if(uploadFile != null && !uploadFile.isEmpty()) {
			
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				mi.setM_origin_name(uploadFile.getOriginalFilename());
				mi.setM_changed_name(renameFileName);
			}
			mService.insertMemberImage(mi);
			
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
		
		
		return "redirect:mypage.do";
	}

	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs(); //폴더가 없으면 만들어줘
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1); //확장자 까지 붙여서 넣어줌
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
