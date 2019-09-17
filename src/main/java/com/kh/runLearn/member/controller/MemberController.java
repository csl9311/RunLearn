package com.kh.runLearn.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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

	/* 회원가입폼 */
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
	@RequestMapping(value = "checkUser.do", method = RequestMethod.POST)
	public ModelAndView checkUser(ModelAndView mv, String id, String pw) throws IOException {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;
		String checkPw = mService.checkPw(id);
		boolean idCheck = mService.checkId(id) == 1 ? true : false;

		if (bcryptPasswordEncoder.matches(pw, checkPw) && idCheck == true) {
			check = true;
		}

		map.put("check", check);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}

	/* 암호화 로그인 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(Member m, String url, HttpSession session, ModelAndView mv) {

		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("home.do");
		redirectView.setExposeModelAttributes(false);
		mv.setView(redirectView);

		Member loginUser = mService.login(m);

		if (bcryptPasswordEncoder.matches(m.getM_pw(), loginUser.getM_pw())) {
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

	@RequestMapping(value = "minsert.do", method = RequestMethod.POST)
	public void memberInsert(@ModelAttribute Member m, @ModelAttribute Member_Image mi,
			@RequestParam(value = "profileImg", required = false) MultipartFile profileImg,
			HttpServletRequest request) {

		if (profileImg != null && !profileImg.isEmpty()) {
			String renameFileName = saveFile(profileImg, request);

			if (renameFileName != null) {
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

		if (result > 0) {
			int result2 = mService.insertMember_Image(mi);
			if (result2 > 0) {
				return;
			} else {
				throw new MemberException("회원가입에 실패하였습니다.");
			}
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}

	/* 파일 저장 */
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\images\\member";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

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

	/********** 회원가입 끝 ***********/

	/* 전화번호 중복확인 및 인증번호발송 */
	@RequestMapping("checkPhone.do")
	public ModelAndView checkPhone(ModelAndView mv, Member m, String typecheck) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		String phoneNum1;
		String phoneNum2;

		if (typecheck.equals("0") || typecheck.equals("00") || typecheck.equals("1")) {
			phoneNum1 = m.getM_phone();
			phoneNum2 = (phoneNum1.replace("-", "")).substring(1);
		}
		String email = m.getM_email();
		boolean isUsable;

		/**********************
		 * 
		 * typecheck 0 - 회원가입 00 - 아이디 찾기 / 휴대폰 인증 1 - 비밀번호 찾기 / 휴대폰 인증 01 - 아이디찾기 / 이메일
		 * 인증 02 - 비밀번호 찾기 / 이메일 인증
		 * 
		 ***********************/

		if (typecheck.equals("0") || typecheck.equals("00")) {
			isUsable = mService.checkPhone(m) == 0 ? true : false;
		} else if (typecheck.equals("1")) {
			isUsable = mService.checkPhone2(m) == 0 ? true : false;
		} else if (typecheck.equals("01")) {
			isUsable = mService.checkEmail(m) == 0 ? true : false;
		} else {
			isUsable = mService.checkEmail2(m) == 0 ? true : false;
		}

		if (typecheck.equals("0")) {
			if (isUsable == true) {
				int random = (int) (Math.random() * 10000);
				phoneCheck = random;
				System.out.println("인증번호 확인용" + random);

				/*
				 * Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
				 * 
				 * Message message = Message.creator(new PhoneNumber("+82"+phoneNum2), // to new
				 * PhoneNumber("+12563716554"), // from "만취남녀 회원가입 인증번호는 [" + phoneCheck +
				 * "] 입니다.").create();
				 */
			}
		} else if (typecheck.equals("1") || typecheck.equals("00")) {
			if (isUsable == false) {
				int random = (int) (Math.random() * 10000);
				phoneCheck = random;
				System.out.println("인증번호 확인용" + random);

				/*
				 * Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
				 * 
				 * Message message = Message.creator(new PhoneNumber("+82"+phoneNum2), // to new
				 * PhoneNumber("+12563716554"), // from "만취남녀 인증번호는 [" + phoneCheck +
				 * "] 입니다.").create();
				 */

			}
		} else if (typecheck.equals("01") || typecheck.equals("02")) {
			if (isUsable == false) {
				int random = (int) (Math.random() * 10000);
				phoneCheck = random;
				System.out.println("인증번호 확인용" + random);

				String setfrom = "soomin3333@gmail.com";
				String tomail = email;
				String title = "만취남녀 인증번호"; // 제목
				String content = "만취남녀 인증번호는 " + random + " 입니다."; // 내용

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

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
		if (phoneCheck == num1) {
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

		if (m_id != null) {
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
		mv.addObject("member", member).setViewName("member/pwChange");

		return mv;
	}

	/* 암호 변경 */
	@RequestMapping("pwChange.do")
	public ModelAndView pwChange(Member m, ModelAndView mv) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		String encPwd = bcryptPasswordEncoder.encode(m.getM_pw());
		m.setM_pw(encPwd);

		boolean result = mService.pwChange(m) == 1 ? true : false;

		if (result != false) {
			map.put("result", result);
			mv.addAllObjects(map);
			mv.setViewName("jsonView");
			return mv;
		} else {
			throw new MemberException("암호 변경에 실패하였습니다 ;ㅅ;");
		}

	}
}
