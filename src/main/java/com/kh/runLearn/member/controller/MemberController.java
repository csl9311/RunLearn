package com.kh.runLearn.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.member.model.exception.MemberException;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("minsertView.do")
	public String memberInsertView() {
		return "/member/signUp";
	}
	@RequestMapping("form.do")
	public String memberInsertForm() {
		return "/member/signUpForm";
	}
	
	@RequestMapping("checkId.do")
	public ModelAndView checkId(ModelAndView mv, String id) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		boolean isUsable = mService.checkId(id) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("checkNick.do")
	public ModelAndView checkNick(ModelAndView mv, String nick) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		boolean isUsable = mService.checkNick(nick) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("minsert.do")
	public void memberInsert(@ModelAttribute Member m,
							 @ModelAttribute Member_Image mi,
							 @RequestParam(value="profileImg", required=false) MultipartFile profileImg,
							 HttpServletRequest request) {
		System.out.println(profileImg.getOriginalFilename());
		if(profileImg != null && !profileImg.isEmpty()) {
			String renameFileName = saveFile(profileImg, request);
			
			if(renameFileName != null) {
				mi.setM_origin_name(profileImg.getOriginalFilename());
				mi.setM_changed_name(renameFileName);
			}
		}
		
		String mid = m.getM_id();
		mi.setM_id(mid);
		
		int result = mService.insertMember_Image(mi);
		
		if(result > 0) {
			int result2 = mService.insertMember(m);
			if(result2 > 0) {
				return "home";
			} else {
				throw new MemberException("회원가입에 실패하였습니다.");
			}
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
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
