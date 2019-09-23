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
	public ModelAndView adminMain(@RequestParam(value="page",required=false)Integer page,@RequestParam(value="i",required=false,defaultValue = "0")Integer i,
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
int modifyUserCount= aService.modifyUserCount();
int createUserCount=aService.createUserCount();
int boardListCount= aService.boardListCount();
int boardListCountA= aService.boardListCountA();


int boardListCountNot = aService.boardListCountNot();
int boardListCountQe = aService.boardListCountQe();
int boardListCountSug = aService.boardListCountSug();
int boardListCountDecl = aService.boardListCountDecl();

PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
PageInfo blcn = Pagination.getPageInfo(currentPage, boardListCountNot, 20);
PageInfo blcq = Pagination.getPageInfo(currentPage, boardListCountQe, 20);
PageInfo blcs = Pagination.getPageInfo(currentPage, boardListCountSug, 20);
PageInfo blcd = Pagination.getPageInfo(currentPage, boardListCountDecl, 20);

PageInfo bla= Pagination.getPageInfo(currentPage, boardListCountA, 20);
PageInfo pia= Pagination.getPageInfo(currentPage, allUserCount, 20);
PageInfo pitor= Pagination.getPageInfo(currentPage, tutorUserCount, 20);
PageInfo pitee= Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
PageInfo pib= Pagination.getPageInfo(currentPage, blackUserCount, 20);
PageInfo pil= Pagination.getPageInfo(currentPage, leaveUserCount, 20);
PageInfo piad= Pagination.getPageInfo(currentPage, adminUserCount, 20);
ArrayList<Member> userList=aService.allUserList(pia);//모든회원 조회
ArrayList<Board> boardList=aService.boardListA(blc);//모든보드 조회

int lectureCount = aService.applyLectureCount();

PageInfo lpi = Pagination.getPageInfo(currentPage, lectureCount, 20);

ArrayList l_list = aService.applylectureList(lpi);



mv.addObject("lpi",lpi);
mv.addObject("blcd", blcd);
mv.addObject("blcs", blcs);
mv.addObject("blcq", blcq);
mv.addObject("blcn", blcn);
mv.addObject("blc", blc);
mv.addObject("modifyUserCount",modifyUserCount);
mv.addObject("createUserCount",createUserCount);
mv.addObject("boardList", boardList);
mv.addObject("bla", bla);
mv.addObject("i", i);
mv.addObject("userList", userList);
mv.addObject("pia", pia);
mv.addObject("pitor", pitor);
mv.addObject("pitee", pitee);
mv.addObject("pib", pib);
mv.addObject("pil", pil);
mv.addObject("piad", piad);
mv.setViewName("admin/adminMain");
return mv;
	}

	// 어드민 회원조회
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
			

	
		mv.addObject("boardList", boardList);
		mv.addObject("bla", bla);
		mv.addObject("i", i);
		mv.addObject("userList", userList);
		mv.addObject("pia", pia);
		mv.addObject("pitor", pitor);
		mv.addObject("pitee", pitee);
		mv.addObject("pib", pib);
		mv.addObject("pil", pil);
		mv.addObject("piad", piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}
	@RequestMapping("adminUserM.do")
	public ModelAndView adminUserM(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "i", required = false, defaultValue = "0") Integer i, ModelAndView mv) {// 어드민 회원 조회
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int allUserCount = aService.allUserCount();
		int tutorUserCount = aService.tutorUserCount();
		int tuteeUserCount = aService.tuteeUserCount();
		int blackUserCount = aService.blackUserCount();
		int leaveUserCount = aService.leaveUserCount();
		int adminUserCount = aService.adminUserCount();
		int boardListCount = aService.boardListCount();
		int boardListCountA = aService.boardListCountA();

		PageInfo bla = Pagination.getPageInfo(currentPage, boardListCountA, 20);
		PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo pia = Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor = Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee = Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib = Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil = Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad = Pagination.getPageInfo(currentPage, adminUserCount, 20);
		ArrayList<Member> userList = aService.allUserListM(pia);// 모든회원 조회
		ArrayList<Board> boardList = aService.boardListA(blc);// 모든보드 조회

	
		mv.addObject("boardList", boardList);
		mv.addObject("bla", bla);
		mv.addObject("i", i);
		mv.addObject("userList", userList);
		mv.addObject("pia", pia);
		mv.addObject("pitor", pitor);
		mv.addObject("pitee", pitee);
		mv.addObject("pib", pib);
		mv.addObject("pil", pil);
		mv.addObject("piad", piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}
	@RequestMapping("adminUsertee.do")
	public ModelAndView adminUsertee(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "i", required = false, defaultValue = "0") Integer i, ModelAndView mv) {// 어드민 회원 조회
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int allUserCount = aService.allUserCount();
		int tutorUserCount = aService.tutorUserCount();
		int tuteeUserCount = aService.tuteeUserCount();
		int blackUserCount = aService.blackUserCount();
		int leaveUserCount = aService.leaveUserCount();
		int adminUserCount = aService.adminUserCount();
		int boardListCount = aService.boardListCount();
		int boardListCountA = aService.boardListCountA();

		PageInfo bla = Pagination.getPageInfo(currentPage, boardListCountA, 20);
		PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo pia = Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor = Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee = Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib = Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil = Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad = Pagination.getPageInfo(currentPage, adminUserCount, 20);
		ArrayList<Member> userList = aService.allUserListtee(pia);// 
		ArrayList<Board> boardList = aService.boardListA(blc);// 모든보드 조회

		
		mv.addObject("boardList", boardList);
		mv.addObject("bla", bla);
		mv.addObject("i", i);
		mv.addObject("userList", userList);
		mv.addObject("pia", pia);
		mv.addObject("pitor", pitor);
		mv.addObject("pitee", pitee);
		mv.addObject("pib", pib);
		mv.addObject("pil", pil);
		mv.addObject("piad", piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}
	@RequestMapping("adminUsertor.do")
	public ModelAndView adminUsertor(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "i", required = false, defaultValue = "0") Integer i, ModelAndView mv) {// 어드민 회원 조회
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int allUserCount = aService.allUserCount();
		int tutorUserCount = aService.tutorUserCount();
		int tuteeUserCount = aService.tuteeUserCount();
		int blackUserCount = aService.blackUserCount();
		int leaveUserCount = aService.leaveUserCount();
		int adminUserCount = aService.adminUserCount();
		int boardListCount = aService.boardListCount();
		int boardListCountA = aService.boardListCountA();

		PageInfo bla = Pagination.getPageInfo(currentPage, boardListCountA, 20);
		PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo pia = Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor = Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee = Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib = Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil = Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad = Pagination.getPageInfo(currentPage, adminUserCount, 20);
		ArrayList<Member> userList = aService.allUserListtor(pia);
		ArrayList<Board> boardList = aService.boardListA(blc);// 모든보드 조회

	
		mv.addObject("boardList", boardList);
		mv.addObject("bla", bla);
		mv.addObject("i", i);
		mv.addObject("userList", userList);
		mv.addObject("pia", pia);
		mv.addObject("pitor", pitor);
		mv.addObject("pitee", pitee);
		mv.addObject("pib", pib);
		mv.addObject("pil", pil);
		mv.addObject("piad", piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}
	@RequestMapping("adminUserbl.do")
	public ModelAndView adminUserbl(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "i", required = false, defaultValue = "0") Integer i, ModelAndView mv) {// 어드민 회원 조회
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int allUserCount = aService.allUserCount();
		int tutorUserCount = aService.tutorUserCount();
		int tuteeUserCount = aService.tuteeUserCount();
		int blackUserCount = aService.blackUserCount();
		int leaveUserCount = aService.leaveUserCount();
		int adminUserCount = aService.adminUserCount();
		int boardListCount = aService.boardListCount();
		int boardListCountA = aService.boardListCountA();

		PageInfo bla = Pagination.getPageInfo(currentPage, boardListCountA, 20);
		PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo pia = Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor = Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee = Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib = Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil = Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad = Pagination.getPageInfo(currentPage, adminUserCount, 20);
		ArrayList<Member> userList = aService.allUserListbl(pia);// 
		ArrayList<Board> boardList = aService.boardListA(blc);// 모든보드 조회

		mv.addObject("boardList", boardList);
		mv.addObject("bla", bla);
		mv.addObject("i", i);
		mv.addObject("userList", userList);
		mv.addObject("pia", pia);
		mv.addObject("pitor", pitor);
		mv.addObject("pitee", pitee);
		mv.addObject("pib", pib);
		mv.addObject("pil", pil);
		mv.addObject("piad", piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}
	@RequestMapping("adminUserY.do")
	public ModelAndView adminUserY(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "i", required = false, defaultValue = "0") Integer i, ModelAndView mv) {// 어드민 회원 조회
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int allUserCount = aService.allUserCount();
		int tutorUserCount = aService.tutorUserCount();
		int tuteeUserCount = aService.tuteeUserCount();
		int blackUserCount = aService.blackUserCount();
		int leaveUserCount = aService.leaveUserCount();
		int adminUserCount = aService.adminUserCount();
		int boardListCount = aService.boardListCount();
		int boardListCountA = aService.boardListCountA();

		PageInfo bla = Pagination.getPageInfo(currentPage, boardListCountA, 20);
		PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo pia = Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor = Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee = Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib = Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil = Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad = Pagination.getPageInfo(currentPage, adminUserCount, 20);
		ArrayList<Member> userList = aService.allUserListY(pia);// 모든회원 조회
		ArrayList<Board> boardList = aService.boardListA(blc);// 모든보드 조회

		
		mv.addObject("boardList", boardList);
		mv.addObject("bla", bla);
		mv.addObject("i", i);
		mv.addObject("userList", userList);
		mv.addObject("pia", pia);
		mv.addObject("pitor", pitor);
		mv.addObject("pitee", pitee);
		mv.addObject("pib", pib);
		mv.addObject("pil", pil);
		mv.addObject("piad", piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}
	@RequestMapping("adminUserN.do")
	public ModelAndView adminUserN(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "i", required = false, defaultValue = "0") Integer i, ModelAndView mv) {// 어드민 회원 조회
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int allUserCount = aService.allUserCount();
		int tutorUserCount = aService.tutorUserCount();
		int tuteeUserCount = aService.tuteeUserCount();
		int blackUserCount = aService.blackUserCount();
		int leaveUserCount = aService.leaveUserCount();
		int adminUserCount = aService.adminUserCount();
		int boardListCount = aService.boardListCount();
		int boardListCountA = aService.boardListCountA();

		PageInfo bla = Pagination.getPageInfo(currentPage, boardListCountA, 20);
		PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo pia = Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor = Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee = Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib = Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil = Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad = Pagination.getPageInfo(currentPage, adminUserCount, 20);
		ArrayList<Member> userList = aService.allUserListN(pia);// 모든회원 조회
		ArrayList<Board> boardList = aService.boardListA(blc);// 모든보드 조회

	
		mv.addObject("boardList", boardList);
		mv.addObject("bla", bla);
		mv.addObject("i", i);
		mv.addObject("userList", userList);
		mv.addObject("pia", pia);
		mv.addObject("pitor", pitor);
		mv.addObject("pitee", pitee);
		mv.addObject("pib", pib);
		mv.addObject("pil", pil);
		mv.addObject("piad", piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}

	// 회원 아이디 검색
	@RequestMapping("adminUserSearchId.do")
	public ModelAndView adminUserSearchId(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "i", required = false, defaultValue = "0") Integer i,
			@RequestParam(value = "search", required = false) String search, ModelAndView mv) {// 어드민 아이디 조회
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
	
		
		int allUserCount = aService.allUserCount();
		int tutorUserCount = aService.tutorUserCount();
		int tuteeUserCount = aService.tuteeUserCount();
		int blackUserCount = aService.blackUserCount();
		int leaveUserCount = aService.leaveUserCount();
		int adminUserCount = aService.adminUserCount();
		int boardListCount = aService.boardListCount();
		int boardListCountA = aService.boardListCountA();

		PageInfo bla = Pagination.getPageInfo(currentPage, boardListCountA, 20);
		PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo pia = Pagination.getPageInfo(currentPage, allUserCount, 20);
		PageInfo pitor = Pagination.getPageInfo(currentPage, tutorUserCount, 20);
		PageInfo pitee = Pagination.getPageInfo(currentPage, tuteeUserCount, 20);
		PageInfo pib = Pagination.getPageInfo(currentPage, blackUserCount, 20);
		PageInfo pil = Pagination.getPageInfo(currentPage, leaveUserCount, 20);
		PageInfo piad = Pagination.getPageInfo(currentPage, adminUserCount, 20);
		ArrayList<Member> userList = aService.adminUserSearchId(search, pia);// 모든회원 조회
		ArrayList<Board> boardList = aService.boardListA(blc);// 모든보드 조회
	
		mv.addObject("i", i);
		mv.addObject("boardList", boardList);
		mv.addObject("userList", userList);
		mv.addObject("pia", pia);
		mv.addObject("pitor", pitor);
		mv.addObject("pitee", pitee);
		mv.addObject("pib", pib);
		mv.addObject("pil", pil);
		mv.addObject("piad", piad);
		mv.setViewName("admin/adminUser");
		return mv;
	}

	// /회원 조회

	// 회원 수정
	@RequestMapping(value = "targetUserUpdate.do", method = RequestMethod.POST)
	public String targetTrBDelete(@ModelAttribute Member m, @RequestParam("page") Integer page,
			HttpServletRequest request) {// 해당회원 정보수정
		int result = aService.targetUserUpdate(m);

		if (result > 0) {
			return "redirect:adminUser.do";
		} else {
			throw new Exception("회원수정에 실패하였습니다");
		}
	}
	//게시판 삭제
	
	@RequestMapping(value = "targetBoardDelete.do", method = RequestMethod.POST)
	public String targetTrInsert(@ModelAttribute Board b,@RequestParam("page") Integer page,
			HttpServletRequest request) {
	int result = aService.targetTrBDelete(b);
		
		if (result > 0) {
			return "redirect:adminNoticeAdmin.do";
			
		} else {
			throw new Exception("회원수정에 실패하였습니다");
		}
	}
	@RequestMapping(value = "targetBoardDelete2.do", method = RequestMethod.POST)
	public String targetTrInsert2(@ModelAttribute Board b,@RequestParam("page") Integer page,
			HttpServletRequest request) {
	int result = aService.targetTrBDelete(b);
		
		if (result > 0) {
			return "redirect:adminUser.do";
			
		} else {
			throw new Exception("회원수정에 실패하였습니다");
		}
	}
	

	@RequestMapping("adminPayManage.do")///상품강의
	public ModelAndView adminPayManage(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {// 어드민 상품/강의관리
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int lectureCount = aService.applyLectureCount();

		PageInfo lpi = Pagination.getPageInfo(currentPage, lectureCount, 20);
		
		ArrayList l_list = aService.applylectureList(lpi);
		
		
		
		
		
		
		
		mv.addObject("lpi",lpi);
		mv.addObject("l_list",l_list);
		mv.setViewName("admin/adminPayManage");
		return mv;
	}

	// 어드민 고객 센터
	@RequestMapping("adminNoticeAdmin.do")
	public ModelAndView adminNoticeAdmin(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "i", required = false, defaultValue = "0") Integer i, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int boardListCount = aService.boardListCount();
		int boardListCountNot = aService.boardListCountNot();
		int boardListCountQe = aService.boardListCountQe();
		int boardListCountSug = aService.boardListCountSug();
		int boardListCountDecl = aService.boardListCountDecl();

		PageInfo blc = Pagination.getPageInfo(currentPage, boardListCount, 20);
		PageInfo blcn = Pagination.getPageInfo(currentPage, boardListCountNot, 20);
		PageInfo blcq = Pagination.getPageInfo(currentPage, boardListCountQe, 20);
		PageInfo blcs = Pagination.getPageInfo(currentPage, boardListCountSug, 20);
		PageInfo blcd = Pagination.getPageInfo(currentPage, boardListCountDecl, 20);
		ArrayList<Board> boardList = aService.boardList(blc);// 모든보드 조회

		mv.addObject("boardList", boardList);
		mv.addObject("blcd", blcd);
		mv.addObject("blcs", blcs);
		mv.addObject("blcq", blcq);
		mv.addObject("blcn", blcn);
		mv.addObject("blc", blc);
		mv.setViewName("admin/adminNoticeAdmin");
		return mv;
	}

	@RequestMapping("abdetail.do")
	public ModelAndView boardDetail(@RequestParam("bId") int bId, @RequestParam("page") int page, ModelAndView mv) {

		aService.addReadCount(bId);
		Board board = aService.selectBoard(bId);
		if (board != null) {
			mv.addObject("board", board).addObject("page", page).setViewName("admin/adminBoardDetailView");
			
		} else {
			throw new Exception("게시글 상세보기에 실패하였습니다.");
		}

		return mv;

	}

	@RequestMapping("aabdetail.do")
	public ModelAndView sboardDetail(@RequestParam("bId") int bId, @RequestParam("page") int page, ModelAndView mv) {

		aService.addReadCount(bId);
		Board board = aService.selectBoard(bId);
		if (board != null) {
			mv.addObject("board", board).addObject("page", page).setViewName("admin/adminBoardDetailView");
			
		} else {
			throw new Exception("게시글 상세보기에 실패하였습니다.");
		}

		return mv;

	}

	@RequestMapping("adminBoardDetailView.do")
	public String adminBoardDetailView() {// 어드민 게시판 보는형식
		return "admin/adminBoardDetailView";
	}

	@RequestMapping("adminBoardInsertForm.do")
	public String adminBoardInsertForm() {// 어드민 게시판 작성 형식
		return "admin/adminBoardInsertForm";
	}

	@RequestMapping("adminInsertNotice.do")
	public String adminInsertNotice(@ModelAttribute Board b,
			HttpServletRequest request) {
		
		
		
		int result = aService.insertBoard(b);

		if (result > 0) {
			return "redirect:adminNoticeAdmin.do";
		} else {
			throw new Exception("게시글 등록에 실패하였습니다");
		}
	}

	

	@RequestMapping("adminToHome.do")
	public String adminToHome() {// 홈으로가기
		return "home";
	}
}
