package com.kh.runLearn.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.runLearn.member.model.service.MemberService;

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
	@RequestMapping("aAemberList.do")
	public String adminMemberList() {
		
		return "";
	} 

}
