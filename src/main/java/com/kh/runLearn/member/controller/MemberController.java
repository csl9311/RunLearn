package com.kh.runLearn.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.exception.MemberException;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.product.model.vo.Product;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;



@SessionAttributes("loginUser")
@Controller
public class MemberController {
	private int phoneCheck;
	public static final String ACCOUNT_SID = "AC21c41324ca2adfa4e2bc3defc22dd7ae";
	public static final String AUTH_TOKEN = "7cce4d0bdf247fd4332ef341800fe135";
	
	@Autowired
	private MemberService mService;
	/* 암호화 */
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/* 회원가입 뷰 이동 */
	@RequestMapping("minsertView.do")
	public String memberInsertView() {
		return "/member/signUp";
	}
	
	/* 홈으로 이동 */
	@RequestMapping("home.do")
	public String Home() {
		return "home";
	}
	
	/* 회원가입폼  */
	@RequestMapping("form.do")
	public String memberInsertForm() {
		return "/member/signUpForm";
	}
	
	/* 로그아웃 */
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete(); 
		return "home";
	}
	
	/* 아이디, 패스워드 찾기 뷰 이동 */
	@RequestMapping("fmember.do")
	public String fmember() {
		return "member/findMemberView";
	}
	
								/************** 로그인 관련 ***************/
	
	
	/* 로그인, 패스워드 체크 */
	@RequestMapping(value="checkUser.do", method=RequestMethod.POST)
	public ModelAndView checkUser(ModelAndView mv, String id, String pw) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;
		String checkPw = mService.checkPw(id);
		boolean idCheck = mService.checkId(id) == 1 ? true : false;
		
		System.out.println(checkPw);
		System.out.println(id);
		System.out.println("비번" + pw);
		
		if(bcryptPasswordEncoder.matches(pw, checkPw) && idCheck == true) {
			check = true;
		}
		System.out.println(check);
		map.put("check", check);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/* 암호화 로그인 */
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {

		Member loginUser = mService.login(m);
		System.out.println(m);
		System.out.println(m.getM_pw());
		System.out.println(loginUser.getM_pw());
			
		if(bcryptPasswordEncoder.matches(m.getM_pw(), loginUser.getM_pw())) {
			model.addAttribute("loginUser",loginUser);
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
			
		return "home";
			
	}
	// 로그인 끝
								/************** 회원가입 관련 ***************/	
	
	
	/* 아이디 중복확인 */
	@RequestMapping("checkId.do")
	public ModelAndView checkId(ModelAndView mv, String id) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		boolean isUsable = mService.checkId(id) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/* 닉네임 중복확인 */
	@RequestMapping("checkNick.do")
	public ModelAndView checkNick(ModelAndView mv, String nick) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		boolean isUsable = mService.checkNick(nick) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/* 전화번호 중복확인, 인증번호발송 */
	@RequestMapping("checkPhone.do")
	public ModelAndView  checkPhone(ModelAndView mv, Member m) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		String phoneNum1 = m.getM_phone();
		String phoneNum2 = (phoneNum1.replace("-", "")).substring(1);
		System.out.println(phoneNum1);
		System.out.println(phoneNum2);
		
		boolean isUsable = mService.checkPhone(m) == 0 ? true : false;
		int random = (int)(Math.random() * 10000);
		phoneCheck = random;
		System.out.println(phoneCheck);
		
		/*Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		
		Message message = Message.creator(new PhoneNumber("+82"+phoneNum2), // to
										  new PhoneNumber("+12563716554"), // from
										  "만취남녀 회원가입 인증번호는 [" + phoneCheck + "] 입니다.").create();*/

		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	
	/* 인증번호 확인 */
	@RequestMapping("checkNum.do")
	public ModelAndView checkNum(ModelAndView mv, String num) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		System.out.println("저장된 값" + phoneCheck + "입력한 값" + num);
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
	
	/* 회원가입 */
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
		} else {
			mi.setM_origin_name("기본 프로필 이미지.jpg");
			mi.setM_changed_name("20190905142135.jpg");
		}
		
		String mid = m.getM_id();
		mi.setM_id(mid);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getM_pw());
		m.setM_pw(encPwd);
		System.out.println(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			int result2 = mService.insertMember_Image(mi);
			if(result2 > 0) {
				return ;
			} else {
				throw new MemberException("회원가입에 실패하였습니다.");
			}
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	/* 파일 저장 */
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root
			= request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\member";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	//회원가입 끝
	
	
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
			mService.insertMember_Image(mi);
			
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
