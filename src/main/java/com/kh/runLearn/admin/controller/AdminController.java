package com.kh.runLearn.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.board.model.service.BoardService;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.common.model.service.SearchService;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.admin.model.service.AdminService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.payment.model.service.PaymentService;
import com.kh.runLearn.product.model.service.ProductService;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	@Autowired
	private BoardService bService;
	@Autowired
	SearchService sService;
	@Autowired
	private LectureService lService;
	@Autowired
	private MemberService mService;
	@Autowired
	private PaymentService payService;
	@Autowired
	private ProductService pService;
	
	@RequestMapping("adminMain.do")
	public String adminMain() {//어드민 메인페이지로 이동
		return "admin/adminMain";
	}
	@RequestMapping("adminUser.do")
	public ModelAndView adminUser(@RequestParam(value="page",required=false)Integer page,
											ModelAndView mv) {//어드민 회원 조회
		
		int currentPage=1;
		if(page != null) {
			currentPage= page;
		}
		int allUserCount= aService.allUserCount();
		int tutorUserCount= aService.tutorUserCount();
		int tuteeUserCount= aService.tuteeUserCount();
		int blackUserCount= aService.blackUserCount();
		
		
		PageInfo pia= Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor= Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee= Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib= Pagination.getPageInfo(currentPage, blackUserCount, 20);
		
		ArrayList<Member> userList=aService.allUserList(pia);//모든회원 조회
				
		mv.addObject("userList",userList);
		mv.addObject("pia",pia);
		mv.addObject("pitor",pitor);
		mv.addObject("pitee",pitee);
		mv.addObject("pib",pib);
		mv.setViewName("admin/adminUser");
		
		return mv;
	}
	@RequestMapping("adminPayManage.do")
	public String adminPayManage() {//어드민 결제관리
		
		
		return "admin/adminPayManage";
	}
	@RequestMapping("adminNoticeAdmin.do")
	public String adminNoticeAdmin() {//어드민 고객센터 공지사항 작성부분
		
		
		return "admin/adminNoticeAdmin";
	}
	@RequestMapping("adminNoticeUser.do")
	public String adminNoticeUser() {//어드민 고객센터 유저가 한거
		
		
		return "admin/adminNoticeUser";
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
	
}
