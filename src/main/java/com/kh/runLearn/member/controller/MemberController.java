package com.kh.runLearn.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.member.model.exception.MemberException;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.product.model.service.ProductService;



@SessionAttributes("loginUser")
@Controller
public class MemberController {
	private int phoneCheck;

	@Autowired
	private MemberService mService;

	@Autowired
	private LectureService lService;

	@Autowired
	private ProductService pService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

	public static final String ACCOUNT_SID = "AC21c41324ca2adfa4e2bc3defc22dd7ae";
	public static final String AUTH_TOKEN = "7cce4d0bdf247fd4332ef341800fe135";
	
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
		
		if(bcryptPasswordEncoder.matches(pw, checkPw) && idCheck == true) {
			check = true;
		}
		
		map.put("check", check);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/* 암호화 로그인 */
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(Member m, String url, HttpSession session, ModelAndView mv) {
		
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("home.do");
		redirectView.setExposeModelAttributes(false);
		mv.setView(redirectView);
		
		Member loginUser = mService.login(m);
			
		if(bcryptPasswordEncoder.matches(m.getM_pw(), loginUser.getM_pw())) {
			session.setAttribute("loginUser", loginUser);
			return mv;
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
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
	
	/* 이메일 중복확인 */
	@RequestMapping("checkEmailo.do")
	public ModelAndView checkEmail(ModelAndView mv, String m_email) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();

		boolean isUsable = mService.checkEmailo(m_email) == 0 ? true : false;

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
		System.out.println("비번 확인용 - " + encPwd);

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
	
		/**********   회원가입 끝   ***********/

	
	/* 전화번호 중복확인 및 인증번호발송 */
	@RequestMapping("checkPhone.do")
	public ModelAndView  checkPhone(ModelAndView mv, Member m, String typecheck) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		String phoneNum1;
		String phoneNum2;
		
		if(typecheck.equals("0") || typecheck.equals("00") || typecheck.equals("1")) {
			phoneNum1 = m.getM_phone();
			phoneNum2 = (phoneNum1.replace("-", "")).substring(1);
		}
		String email = m.getM_email();
		boolean isUsable;
		
		/**********************

		typecheck
		0 - 회원가입 
		00 - 아이디 찾기 / 휴대폰 인증 
		1 - 비밀번호 찾기 / 휴대폰 인증
		01 - 아이디찾기 / 이메일 인증
		02 - 비밀번호 찾기 / 이메일 인증
		
		***********************/
		
		if(typecheck.equals("0") || typecheck.equals("00")) {
			isUsable = mService.checkPhone(m) == 0 ? true : false;
		} else if(typecheck.equals("1")) {
			isUsable = mService.checkPhone2(m) == 0 ? true : false;
		} else if(typecheck.equals("01")) {
			isUsable = mService.checkEmail(m) == 0 ? true : false;
		} else {
			isUsable = mService.checkEmail2(m) == 0 ? true : false;
		}
		
		if(typecheck.equals("0")) {
			if(isUsable == true) {
				int random = (int)(Math.random() * 10000);
				phoneCheck = random;
				System.out.println("인증번호 확인용" + random);
				
				/*Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
				
				Message message = Message.creator(new PhoneNumber("+82"+phoneNum2), // to
												  new PhoneNumber("+12563716554"), // from
												  "만취남녀 회원가입 인증번호는 [" + phoneCheck + "] 입니다.").create();*/
			}
		} else if(typecheck.equals("1") || typecheck.equals("00")) {
			if(isUsable == false) {
				int random = (int)(Math.random() * 10000);
				phoneCheck = random;
				System.out.println("인증번호 확인용" + random);
			
				/*Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
				
				Message message = Message.creator(new PhoneNumber("+82"+phoneNum2), // to
												  new PhoneNumber("+12563716554"), // from
												  "만취남녀 인증번호는 [" + phoneCheck + "] 입니다.").create();*/
								
			}
		} else if(typecheck.equals("01") || typecheck.equals("02")) {
			if(isUsable == false) {
				int random = (int)(Math.random() * 10000);
				phoneCheck = random;
				System.out.println("인증번호 확인용" + random);
				
				String setfrom = "soomin3333@gmail.com";
				String tomail = email;
				String title = "만취남녀 인증번호"; // 제목
				String content = "만취남녀 인증번호는 " + random + " 입니다."; // 내용

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message,
							true, "UTF-8");
					
					messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
					messageHelper.setTo(tomail); // 받는사람 이메일
					messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
					messageHelper.setText(content); // 메일 내용
					
					mailSender.send(message);
					
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}
		
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	
	/* 인증번호 확인 */
	@RequestMapping("checkNum.do")
	public ModelAndView checkNum(ModelAndView mv, String num) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
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
	
	
	/****** 인증 끝 ******/
	
	
	/****** 아이디, 비밀번호 찾기 ******/
	
	
	/* 아이디 찾기 */
	@RequestMapping("findmemberid.do") 
	public ModelAndView findMember(Member m, ModelAndView mv) {
	
		Member member = mService.findMember(m);
		String m_id = member.getM_id();
		Member_Image mi = mService.findMemberImg(m_id);
		
		if(m_id != null) {
			mv.addObject("member", member);
			mv.addObject("member_img", mi);
			mv.setViewName("member/findResultView");
		} else {
			throw new MemberException("회원정보가 없어요 8ㅅ8"); 
		}
		
	return mv;
	
	}
	
	/* 암호 찾기 */
	@RequestMapping("pwFind.do")
	public ModelAndView pwFind(ModelAndView mv, String m_id) {
		
		Member member = new Member();
		member.setM_id(m_id);
		mv.addObject("member", member) 
		.setViewName("member/pwChange"); 
		
		return mv;	
	}
	
	/* 암호 변경 */
	@RequestMapping("pwChange.do")
	public ModelAndView pwChange(Member m, ModelAndView mv) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		String encPwd = bcryptPasswordEncoder.encode(m.getM_pw());
		m.setM_pw(encPwd);
		
		boolean result = mService.pwChange(m) == 1 ? true : false;
		
		if(result != false) {
			map.put("result", result);
			mv.addAllObjects(map);
			mv.setViewName("jsonView");
			return mv;
		} else {
			throw new MemberException("암호 변경에 실패하였습니다 ;ㅅ;");
		}
		
		
		

		
	}
	
	/****** 아이디, 비밀번호 찾기 끝 ******/

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

	
		PageInfo pi= Pagination.getPageInfo(currentPage, listCount, 12);
		

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

	
	
//	@RequestMapping(value = "mypage.do")
//	public ModelAndView myPage(@RequestParam(value="page", required=false ) Integer page, HttpSession session, ModelAndView mv, @RequestParam("cate") String cate) {
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		String userId = loginUser.getM_id();
//		int currentPage = 1;
//		int boardLimit = 5;
//		int lCount = lService.selectLectureCount(userId);
//		int nPayLcount = lService.selectNopayLectureCount(userId);
//		int nPayPcount = pService.selectPlistCount(userId);
//		
//		
//		if(page != null) {  
//			currentPage = page;
//		}
//		
//		
//		if(cate.equals("수강목록")) {
//			int listCount = lService.selectLectureCount(userId);
//			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
//			ArrayList<Map<String, String>> lList = lService.selectLectureView(userId, pi); // 수강목록	
//			mv.addObject("lList", lList);
//			mv.addObject("listCount", listCount);
//			mv.addObject("pi",pi);
//			
//			
//		
//		}
//
//		
//		if(cate.equals("강의찜목록")) {
//			int listCount = lService.selectNopayLectureCount(userId);
//			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
//			ArrayList<Map<String, String>> noPaylList = lService.selectNoPayLectureView(userId, pi); //강의 찜목록
//			mv.addObject("noPaylList", noPaylList);
//			mv.addObject("listCount", listCount);
//			mv.addObject("pi",pi);
//			
//			
//		}
//		
//		if(cate.equals("상품찜목록")) {
//			int listCount =  pService.selectPlistCount(userId); //상품 찜 목록수
//			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
//			ArrayList<Map<String, String>> pList = pService.selectProductView(userId, pi); // 상품 찜목록
//			mv.addObject("pList", pList);
//			mv.addObject("listCount", listCount);
//			mv.addObject("pi", pi);
//		}
//		
//		if(cate.equals("튜터")) {
//			int listCount = pService.selectPlistCount(userId);
//			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
//			ArrayList<Map<String, String>> pList = pService.selectProductView(userId, pi); // 상품 찜목록
//			mv.addObject("pList", pList);
//			mv.addObject("listCount", listCount);
//			mv.addObject("pi", pi);
//		}
//		
//		mv.addObject("lCount", lCount);
//		mv.addObject("nPayLcount", nPayLcount);
//		mv.addObject("nPayPcount", nPayPcount);
//		mv.addObject("cate", cate);
//		mv.setViewName("/mypage/mypage");
//		return mv;
//	}
//
//	@RequestMapping(value = "memberUpdate.do") // id하고 name값은 변경 불가하니 첨부터 값불러오게끔
//	public String mUpdateView() {
//		return "mypage/memberUpdate";
//
//	}
//
//	@RequestMapping(value = "mUpdate.do", method = RequestMethod.POST) // 정보수정
//	public String updateMember(@ModelAttribute Member m, @ModelAttribute Member_Image mi,
//		@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpSession session, HttpServletRequest request, Model model) {
//
//		
//		Member loginUser = (Member) session.getAttribute("loginUser");
//		
//		if(m.getM_pw().equals("")) {
//			m.setM_pw(loginUser.getM_pw());
//			
//		}else {
//			String encpwd = bcryptPasswordEncoder.encode(m.getM_pw());
//			m.setM_pw(encpwd);
//		}
//		
//		
//
//		int result = mService.updateMember(m);
//		
//		
//		
//		if(uploadFile != null && !uploadFile.isEmpty()) {
//
//			String renameFileName = saveFile(uploadFile, request);
//
//			if(renameFileName != null) {
//				mi.setM_origin_name(uploadFile.getOriginalFilename());
//				mi.setM_changed_name(renameFileName);
//			}
//			mService.updateMember_Image(mi);
//
//		}
//
//		if (result > 0) {
//			loginUser.setM_pw(m.getM_pw());
//			loginUser.setM_email(m.getM_email());
//			loginUser.setM_phone(m.getM_phone());
//			loginUser.setPostnum(m.getPostnum());
//			loginUser.setG_address(m.getG_address());
//			loginUser.setR_address(m.getR_address());
//			loginUser.setD_address(m.getD_address());
//
//			session.setAttribute("loginUser", loginUser);
//		}
//		
//		model.addAttribute("cate", "수강목록");
//		return "redirect:mypage.do?";
//	}






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

//	public String saveFile2(MultipartFile file, HttpServletRequest request) {
//
//		String root = request.getSession().getServletContext().getRealPath("resources");
//
//		String savePath = root + "\\mypageUpload";
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
