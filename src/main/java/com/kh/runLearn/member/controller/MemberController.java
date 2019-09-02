package com.kh.runLearn.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile; 
import org.springframework.web.bind.annotation.RequestMapping; 

import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@RequestMapping("minsertView.do")
	public String memberInsertView() {
		return "/member/signUp";
	}
	@RequestMapping("form.do")
	public String memberInsertForm() {
		return "/member/signUpForm";
	}

	@RequestMapping(value = "mypage.do")
	public String myPage() {
		return "mypage/mypage";
	}

	@RequestMapping(value = "memberUpdate.do") // id하고 name값은 변경 불가하니 첨부터 값불러오게끔
	public String mUpdateView() {
		return "mypage/memberUpdate";

	}

	@RequestMapping(value = "mUpdate.do", method=RequestMethod.POST) // 정보수정
	public String updateMember(@ModelAttribute Member m, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile, HttpSession session, Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(m);
		int result = mService.updateMember(m);
		System.out.println(result);
		
		if (result > 0) {
			loginUser.setM_pw(m.getM_pw());
			loginUser.setM_email(m.getM_email());
			loginUser.setM_phone(m.getM_phone());
			loginUser.setPostnum(m.getPostnum());
			loginUser.setG_address(m.getG_address());
			loginUser.setR_address(m.getR_address());
			loginUser.setD_address(m.getD_address());
			
			model.addAttribute("loginUser", loginUser);
		}
		
		System.out.println(loginUser);
		return "redirect:mypage.do";
	}

//	@RequestMapping("mUpdate.do")
//	public String boardInsert(@ModelAttribute Member_Image mi, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile, HttpServletRequest request) {
//		
//		System.out.println(uploadFile);
//		System.out.println(uploadFile.getOriginalFilename());
//		// 파일을 넣지 않은 경우 파일 이름은 ""로 들어감
//		
//		if(!uploadFile.getOriginalFilename().equals("")) {
//		if(uploadFile != null && !uploadFile.isEmpty()) {
//			// 저장할 경로를 지정하는 savaFile()메소드 생성
//			String renameFileName = saveFile(uploadFile, request);
//			
//			if(renameFileName != null) {
//				mi.setM_origin_name(uploadFile.getOriginalFilename());
//				mi.setM_changed_name(renameFileName);
//			}
//			
//		}
//		System.out.println(mi);
//		int result = mService.updateMemberImage(mi);
//		
//		}
//		return "redirect:mypage.do";
//		
//		
//	}

//	public String saveFile(MultipartFile file, HttpServletRequest request) {
//
//		String root = request.getSession().getServletContext().getRealPath("resources");
//
//		String savePath = root + "\\buploadFiles";
//
//		File folder = new File(savePath);
//		if (!folder.exists()) {
//			folder.mkdirs(); // 폴더가 없으면 만들어줘
//		}
//
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//		String originalFileName = file.getOriginalFilename();
//		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
//				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1); // 확장자 까지 붙여서 넣어줌
//		String renamePath = folder + "\\" + renameFileName;
//
//		try {
//			file.transferTo(new File(renamePath));
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return renameFileName;
//	}

}
