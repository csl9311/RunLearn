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
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.exception.MemberException;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.product.model.service.ProductService;
import com.kh.runLearn.product.model.vo.Product;

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

		PageInfo pi= Pagination.getPageInfo(currentPage, listCount, 5);

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

		String userId = loginUser.getM_id();
		
		
		ArrayList<Lecture> lList = lService.selectLectureView(userId); // 수강목록
		int lListCount = lService.selectLectureCount(userId); // 전체 수강 목록 수



		ArrayList<Lecture> noPaylList = lService.selectNoPayLectureView(userId); //강의 찜목록
		int noPaylListCount = lService.selectNopayLectureCount(userId); // 강의 찜 목록 수


		ArrayList<Product> pList = pService.selectProductView(userId); // 상품 찜목록

		mv.addObject("lList", lList);
		mv.addObject("lListCount", lListCount);
		
		
		mv.addObject("noPaylList", noPaylList);
		mv.addObject("noPaylListCount", noPaylListCount);

		mv.addObject("pList", pList);

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
			
		}else {
			String encpwd = bcryptPasswordEncoder.encode(m.getM_pw());
			m.setM_pw(encpwd);
		}
		
		

		int result = mService.updateMember(m);
		
		
		
		if(uploadFile != null && !uploadFile.isEmpty()) {

			String renameFileName = saveFile(uploadFile, request);

			if(renameFileName != null) {
				mi.setM_origin_name(uploadFile.getOriginalFilename());
				mi.setM_changed_name(renameFileName);
			}
			mService.updateMember_Image(mi);

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
