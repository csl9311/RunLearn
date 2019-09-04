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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.member.model.exception.MemberException;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	private int phoneCheck;
	
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
	
	@RequestMapping(value = "minsert.do", method = RequestMethod.POST )
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
		
		String encPwd = bcryptPasswordEncoder.encode(m.getM_pw());
		m.setM_pw(encPwd);
		System.out.println(encPwd);
		int result = mService.insertMember_Image(mi);
		
		if(result > 0) {
			int result2 = mService.insertMember(m);
			if(result2 > 0) {
				return ;
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
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete(); 
		return "home";
	}
	
	// 암호화 후 로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {

		Member loginUser = mService.login(m);
			
		if(bcryptPasswordEncoder.matches(m.getM_pw(), loginUser.getM_pw())) {
			model.addAttribute("loginUser",loginUser);

		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
			
		return "home";
			
	}

	@RequestMapping("checkPhone.do")
	public ModelAndView  checkPhone(ModelAndView mv, Member m) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		boolean isUsable = mService.checkPhone(m) == 0 ? true : false;
		int random = (int)(Math.random() * 10000);
		phoneCheck = random;
		System.out.println(phoneCheck);

		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	//10분 3번
	@RequestMapping("checkNum.do")
	public ModelAndView checkNum(ModelAndView mv, String num) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		System.out.println("염병" + phoneCheck);
		boolean isUsable;
		int num1 = Integer.parseInt(num);
		if(phoneCheck == num1) {
			isUsable = true;
		} else {
			isUsable = false;
		}
		
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		
		return mv;
	}
}
