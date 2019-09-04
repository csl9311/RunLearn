package com.kh.runLearn.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;

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
	//규범어드민관련
	@RequestMapping("getAllUserCount.do")
	public int getAllUserCount() {//모든 회원수조회(블랙포함)
		int uCount= mService.getAllUserCount();
		
		return uCount;
	}
	@RequestMapping("ulist.do")//모든회원조회
	public ModelAndView boardList(@RequestParam(value="userList",required=false)Integer page, ModelAndView mv) {
														//페이지가 없으면 빼라는 것false일때
		int currentPage=1;
		if(page != null) {
			currentPage= page;
		}
		int listCount = mService.getAllUserCount();
	
		PageInfo pi= Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list=mService.selectAllMember(pi);
		
		
		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			/* mv.setViewName("admin/adminMain") */;//어드민메인 분할한다면 다른걸로 바꿔줘야함
		}
		/*    exception페이지 만들어지면 사용
		 * else { throw new BoardException("게시글 전 체 조회에 실패 하였습니다."); }
		 */
		
		return mv;
	}

}
