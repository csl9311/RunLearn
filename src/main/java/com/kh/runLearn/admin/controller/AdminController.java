package com.kh.runLearn.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.admin.model.service.AdminService;
import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.common.Exception;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.common.model.service.SearchService;
import com.kh.runLearn.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	@Autowired
	SearchService sService;
	@RequestMapping("adminMain.do")
	public String adminMain() {//어드민 메인페이지로 이동
		return "admin/adminMain";
	}
	//어드민 회원조회
	@RequestMapping("adminUser.do")
	public ModelAndView adminUser(@RequestParam(value="page",required=false)Integer page,@RequestParam(value="i",required=false,defaultValue = "0")Integer i,
											ModelAndView mv) {//어드민 회원 조회
		int currentPage=1;
		if(page != null) {
			currentPage= page;
		}
		int allUserCount= aService.allUserCount();
		int tutorUserCount= aService.tutorUserCount();
		int tuteeUserCount= aService.tuteeUserCount();
		int blackUserCount= aService.blackUserCount();
		int leaveUserCount= aService.leaveUserCount();
		int adminUserCount= aService.adminUserCount();
		int boardListCount= aService.boardListCount();
		int boardListCountA= aService.boardListCountA();
		
		PageInfo bla= Pagination.getPageInfo(currentPage, boardListCountA, 20);
		PageInfo blc= Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo pia= Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor= Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee= Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib= Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil= Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad= Pagination.getPageInfo(currentPage, adminUserCount, 20);
		ArrayList<Member> userList=aService.allUserList(pia);//모든회원 조회
		ArrayList<Board> boardList=aService.boardListA(blc);//모든보드 조회
			
		System.out.println(i);
		mv.addObject("boardList",boardList);
		mv.addObject("bla",bla);
		mv.addObject("i",i)		;
		mv.addObject("userList",userList);
		mv.addObject("pia",pia);
		mv.addObject("pitor",pitor);
		mv.addObject("pitee",pitee);
		mv.addObject("pib",pib);
		mv.addObject("pil",pil);
		mv.addObject("piad",piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}
	
	//회원 아이디 검색
	@RequestMapping("adminUserSearchId.do")
	public ModelAndView adminUserSearchId(@RequestParam(value="page",required=false)Integer page,@RequestParam(value="i",required=false,defaultValue = "0")Integer i,
											@RequestParam(value="search",required=false)String search,
											ModelAndView mv) {//어드민 아이디 조회
		int currentPage=1;
		if(page != null) {
			currentPage= page;
		}
		int allUserCount= aService.allUserCount();
		int tutorUserCount= aService.tutorUserCount();
		int tuteeUserCount= aService.tuteeUserCount();
		int blackUserCount= aService.blackUserCount();
		int leaveUserCount= aService.leaveUserCount();
		int adminUserCount= aService.adminUserCount();
		PageInfo pia= Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor= Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee= Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib= Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil= Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad= Pagination.getPageInfo(currentPage, adminUserCount, 20);
			ArrayList<Member> userList=aService.allUserList(pia);//모든회원 조회
		System.out.println(i);
				System.out.println(userList);
		mv.addObject("i",i)		;
		mv.addObject("userList",userList);
		mv.addObject("pia",pia);
		mv.addObject("pitor",pitor);
		mv.addObject("pitee",pitee);
		mv.addObject("pib",pib);
		mv.addObject("pil",pil);
		mv.addObject("piad",piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}
	
	//  /회원 조회
	
	//회원 수정
	@RequestMapping(value="targetUserUpdate.do", method = RequestMethod.POST)
	public String targetTrInsert(@ModelAttribute Member m,@RequestParam("page") Integer page,HttpServletRequest request) {//해당회원 정보수정
		int result = aService.targetUserUpdate(m);
		if(result>0) {
			
			return "redirect:adminUser.do";
		} else { 
			throw new Exception("회원수정에 실패하였습니다");
		}
	}
	
	@RequestMapping("adminPayManage.do")
	public String adminPayManage() {//어드민 결제관리
		return "admin/adminPayManage";
	}
	//어드민 고객 센터
	@RequestMapping("adminNoticeAdmin.do")
	public ModelAndView adminNoticeAdmin(@RequestParam(value="page",required=false)Integer page,@RequestParam(value="i",required=false,defaultValue = "0")Integer i,
			ModelAndView mv) {

			int currentPage=1;
			if(page != null) {
				currentPage= page;
			}
			int boardListCount= aService.boardListCount();
			int boardListCountNot= aService.boardListCountNot();
			int boardListCountQe= aService.boardListCountQe();
			int boardListCountSug= aService.boardListCountSug();
			int boardListCountDecl= aService.boardListCountDecl();
		
			PageInfo blc= Pagination.getPageInfo(currentPage, boardListCount, 20);
			PageInfo blcn= Pagination.getPageInfo(currentPage, boardListCountNot, 20);
			PageInfo blcq= Pagination.getPageInfo(currentPage, boardListCountQe, 20);
			PageInfo blcs= Pagination.getPageInfo(currentPage, boardListCountSug, 20);
			PageInfo blcd= Pagination.getPageInfo(currentPage, boardListCountDecl, 20);
			ArrayList<Board> boardList=aService.boardList(blc);//모든보드 조회
		
		
		mv.addObject("boardList",boardList);
		mv.addObject("blcd",blcd);
		mv.addObject("blcs",blcs);
		mv.addObject("blcq",blcq);
		mv.addObject("blcn",blcn);
		mv.addObject("blc",blc);
		mv.setViewName("admin/adminNoticeAdmin");
		return mv;
	}

	@RequestMapping("adminBoardDetailView.do")
	public String adminBoardDetailView() {//어드민 게시판 보는형식
		return "admin/adminBoardDetailView";
	}
	@RequestMapping("adminBoardInsertForm.do")
	public String adminBoardInsertForm() {//어드민 게시판 작성 형식
		return "admin/adminBoardInsertForm";
	}
	@RequestMapping("adminInsertNotice.do")
	public String adminInsertNotice() {//공지사항 작성 할때 넘기기

		return "admin/adminBoardInsertForm";
	}
	@RequestMapping("adminInsertFna.do")
	public String adminInsertFna() {//Fna 작성 할때 넘기기
		return "admin/adminBoardInsertForm";
	}
	@RequestMapping("adminToHome.do")
	public String adminToHome() {//홈으로가기
		return "home";
	}
}
