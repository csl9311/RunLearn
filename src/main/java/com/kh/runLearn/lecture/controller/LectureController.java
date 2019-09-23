package com.kh.runLearn.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.Exception;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.Lecture_Each;
import com.kh.runLearn.lecture.model.vo.Lecture_File;
import com.kh.runLearn.lecture.model.vo.Lecture_Image;
import com.kh.runLearn.lecture.model.vo.Wishlist;
import com.kh.runLearn.member.model.vo.Member;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;

	//전체강의 메인페이지
	@RequestMapping("selectLectureAllList.le")
	public ModelAndView selectLectureAllList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {

		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = lService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 12);
		pi.setBoardLimit(12);
		ArrayList all = lService.selectLectureList(pi);
		mv.addObject("list", all);
		mv.addObject("pi", pi);
		mv.setViewName("lecture/lectureMain");
		return mv;
	}
	//강의 카테고리별 메인페이지
	@RequestMapping("selectLectureList.le")
	public ModelAndView selectLectureList(@RequestParam(value="page", required=false) Integer page, @RequestParam("l_category") String l_category, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage=page;
		}
		int listCount = lService.getCategoryListCount(l_category);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 12);
		pi.setBoardLimit(12);
		ArrayList list = lService.selectLectureList(pi, l_category);
		String cName = "";
		if(l_category.equals("디자인")) {
			cName="디자인";
		} else if(l_category.equals("실무역량")) {
			cName="실무역량";
		} else if(l_category.equals("뷰티")) {
			cName="뷰티";
		} else if(l_category.equals("영상")) {
			cName="영상";
		} else if(l_category.equals("외국어")) {
			cName="외국어";
		} else if(l_category.equals("음악")) {
			cName="음악";
		} else if(l_category.equals("라이프스타일")) {
			cName="라이프스타일";
		} else if(l_category.equals("제테크")) {
			cName="제테크";
		}
		mv.addObject("cName", cName);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("lecture/lectureMain");
		return mv;
	}
	
	//강의 허가/거부페이지
	@RequestMapping("lectureConfirmView.le")
	public ModelAndView lectureConfirmView(@RequestParam("l_num") int l_num, ModelAndView mv, HttpSession session) {

//		ArrayList list = lService.selectLecture(l_num);
		Member loginUser = (Member)session.getAttribute("loginUser");
		HashMap<String, String> list = lService.selectLecture(l_num);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("MCR", 0);
		ArrayList im_list = lService.selectLectureImage(map);
		map.put("MCR", 1);
		ArrayList ic_list = lService.selectLectureImage(map);
		map.put("MCR", 2);
		ArrayList it_list = lService.selectLectureImage(map);
		map.put("MCR", 3);
		ArrayList ir_list = lService.selectLectureImage(map);
		String adr = (String)list.get("L_ADDRESS");
		if(adr != null && adr.contains("/")) {
			String[] sadr = adr.split("/");
			String radr = sadr[0];
			list.put("L_ADDRESS", radr);
		}
		if(loginUser != null) {
			HashMap<String, Object> check = new HashMap<>();
			check.put("m_id", loginUser.getM_id());
			check.put("l_num", l_num);
			ArrayList paycheck = lService.userPayCheck(check);
			mv.addObject("paycheck", paycheck);
		}
		mv.addObject("list", list);
		mv.addObject("im_list", im_list);
		mv.addObject("ic_list", ic_list);
		mv.addObject("it_list", it_list);
		mv.addObject("ir_list", ir_list);
		mv.setViewName("lecture/lectureConfirm");
		return mv;
	}
	
	@RequestMapping("lectureDetailView.le")
	public ModelAndView lectureDetailView(@RequestParam("l_num") int l_num, ModelAndView mv, HttpSession session) {

//		ArrayList list = lService.selectLecture(l_num);
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		HashMap<String, String> list = lService.selectLecture(l_num);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("MCR", 0);
		ArrayList im_list = lService.selectLectureImage(map);
		map.put("MCR", 1);
		ArrayList ic_list = lService.selectLectureImage(map);
		map.put("MCR", 2);
		ArrayList it_list = lService.selectLectureImage(map);
		map.put("MCR", 3);
		ArrayList ir_list = lService.selectLectureImage(map);
		String adr = (String)list.get("L_ADDRESS");
		if(adr != null && adr.contains("/")) {
			String[] sadr = adr.split("/");
			String radr = sadr[0];
			if(sadr[1] != null) {
				radr = radr +" " +sadr[1];
			}
			list.put("L_ADDRESS", radr);
		}
		if(loginUser != null) {
			HashMap<String, Object> wish = new HashMap<>();
			wish.put("l_num", l_num);
			wish.put("m_id", loginUser.getM_id());
			Wishlist w_list = lService.selectWishList(wish);
			if(w_list != null) {
				mv.addObject("w_list", w_list);
			}
			
			HashMap<String, Object> check = new HashMap<>();
			check.put("m_id", loginUser.getM_id());
			check.put("l_num", l_num);
			ArrayList paycheck = lService.userPayCheck(check);
			mv.addObject("paycheck", paycheck);
		}
		mv.addObject("list", list);
		mv.addObject("im_list", im_list);
		mv.addObject("ic_list", ic_list);
		mv.addObject("it_list", it_list);
		mv.addObject("ir_list", ir_list);
		mv.setViewName("lecture/lectureDetailView");
		return mv;
	}
	
	//강의 n화 화면페이지
	@RequestMapping("lectureEachMainView.le")
	public ModelAndView lectureEachMainView(@RequestParam("l_num") int l_num, @RequestParam(value="l_each_num", required=false) String t_num, ModelAndView mv) {
		int l_each_num = 0;
		if(t_num == null) {
			String a =  lService.findEachNum(l_num);
			if(a != null) {
				l_each_num = Integer.parseInt(a);
			}
		} else {
			l_each_num = Integer.parseInt(t_num);
		}
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("l_each_num", l_each_num);
		HashMap<String, String> etc = lService.selectLecture(l_num);
		Lecture_Each l_each = lService.classEnter(map);
		ArrayList list = lService.classList(l_num);
		ArrayList tlist = lService.tclassList(l_num);
		Lecture_File lf = lService.selectLectureFile(l_each_num);
		if(l_each==null) {
			l_each = new Lecture_Each();
			l_each.setL_num(l_num);
			l_each.setL_each_name("강의가 없습니다!");
			l_each.setL_each_num(0);
		}
		mv.addObject("etc", etc);
		mv.addObject("tlist", tlist);
		mv.addObject("list", list);
		mv.addObject("l_each", l_each);
		mv.addObject("lf", lf);
		mv.setViewName("lecture/lectureEachView");
		return mv;
	}
	
	//강의 n화 영상페이지
	@RequestMapping("lectureMediaView.le")
	public ModelAndView lectureMediaView(@RequestParam(value="l_each_num") int l_each_num, ModelAndView mv) {
		HashMap<String, Object> map = lService.mediaEnter(l_each_num);
		ArrayList list = lService.classList(((BigDecimal)map.get("L_NUM")).intValue());
		ArrayList tlist = lService.tclassList(((BigDecimal)map.get("L_NUM")).intValue());
		System.out.println(map);
		if(!map.isEmpty() && !list.isEmpty()) {
			mv.addObject("tlist", tlist);
			mv.addObject("list", list);
			mv.addObject("media", map);
			mv.setViewName("lecture/lectureVideoView");
			return mv;
		} else {
			throw new Exception("강의 영상화면으로 들어가는데 실패했습니다. 다시 시도해주십시오. 이 오류가 계속 될 경우, 관리자에게 문의해주시기 바랍니다.");
		}
	}
	
	@RequestMapping("lectureEachUpdateView.le")
	public ModelAndView eachUpdate(@RequestParam("l_num") int l_num, @RequestParam(value="l_each_num") int l_each_num, ModelAndView mv) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("l_each_num", l_each_num);
		HashMap<String, String> etc = lService.selectLecture(l_num);
		Lecture_Each l_each = lService.classEnter(map);
		Lecture_File lf = lService.selectLectureFile(l_each_num);
		
		mv.addObject("etc", etc);
		mv.addObject("l_each", l_each);
		mv.addObject("lf", lf);
		mv.setViewName("lecture/lectureEachUpdate");
		return mv;
	}

	@RequestMapping("lectureEachInput.le")
	public ModelAndView lectureEachInput(Lecture_Each le, @RequestParam(value="l_file", required=false) MultipartFile l_file, @RequestParam("l_file_video") String lfv, ModelAndView mv, MultipartHttpServletRequest request) {
		int result = lService.insertLecture(le);
		Lecture_File lf = new Lecture_File();
		if(l_file != null && !l_file.isEmpty()) {
			String renameFileName = insertFile(l_file, request);
			if(renameFileName != null) {
				lf.setL_file_origin_name(l_file.getOriginalFilename());
				lf.setL_file_changed_name(renameFileName);
			}
		}
		lf.setL_file_video(lfv);
		lService.insertLectureFile(lf);
		if(result > 0) {
			int l_each_num = 0;
			String a =  lService.findEachNum(le.getL_num());
			if(a != null) {
				l_each_num = Integer.parseInt(a);
			}
			mv.addObject("l_each_num", l_each_num);
			mv.addObject("l_num", le.getL_num());
			mv.setViewName("redirect:lectureEachMainView.le");
			return mv;
		} else {
			throw new Exception("강의를 추가하는데 실패했습니다. 다시 시도해 주세요.");
		}
	}
	
	@RequestMapping("lectureEachUpdate.le")
	public ModelAndView lectureEachUpdate(Lecture_Each le,
										  @RequestParam(value="l_file", required=false) MultipartFile l_file,
										  @RequestParam(value="l_file_video", required=false) String lfv,
										  @RequestParam(value="l_file_origin_name", required=false) String lfon,
										  @RequestParam(value="l_file_changed_name", required=false) String lfcn,
										  @RequestParam("l_each_num") int l_each_num,
										  ModelAndView mv, MultipartHttpServletRequest request) {
		
		
		int result = lService.updateLectureEach(le);
		Lecture_File lf = new Lecture_File();
		
		if(l_file != null && !l_file.isEmpty()) {
			deleteFile3(lfcn, request);
			String renameFileName = insertFile(l_file, request);
			if(renameFileName != null) {
				lf.setL_file_origin_name(l_file.getOriginalFilename());
				lf.setL_file_changed_name(renameFileName);
			}
		}else {
			lf.setL_file_origin_name(lfon);
			lf.setL_file_changed_name(lfcn);
		}
		lf.setL_file_video(lfv);
		lf.setL_each_num(l_each_num);
		lService.updateLectureFile(lf);
		if(result > 0) {
			mv.addObject("l_each_num", l_each_num);
			mv.addObject("l_num", le.getL_num());
			mv.setViewName("redirect:lectureEachMainView.le");
			return mv;
		} else {
			throw new Exception("강의를 추가하는데 실패했습니다. 다시 시도해 주세요.");
		}
	}
	
	@RequestMapping("enableLectureEach.le")
	public ModelAndView enableLectureEach(Lecture_Each le,
										  @RequestParam("l_each_num") int l_each_num,
										  ModelAndView mv, HttpServletRequest request) {
		
		lService.enableLectureEach(l_each_num);
		mv.addObject("l_each_num", l_each_num);
		mv.addObject("l_num", le.getL_num());
		mv.setViewName("redirect:lectureEachMainView.le");
		return mv;
	}
	
	@RequestMapping("Apply.le")
	public String apply() {
		return "lecture/lectureApply";
	}
	
//	튜터의 강의 신청
	@RequestMapping("lectureApply.le")
	public ModelAndView permissionLecture(Lecture l,
										  @RequestParam(value="mainImage", required=false) MultipartFile mainImage,
										  @RequestParam(value="adr1", required=false) String adr1,
										  @RequestParam(value="adr2", required=false) String adr2,
										  ModelAndView mv, MultipartHttpServletRequest request,
										  HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		l.setM_id(loginUser.getM_id());
		
		String address = adr1;
		if(!adr2.equals("")) {
			address = adr1 + "/" + adr2;
		}
		l.setL_address(address);
		int l_num = lService.findValue();
		int result = lService.permissionLecture(l);
		Lecture_Image li = new Lecture_Image();
		if(mainImage != null && !mainImage.isEmpty()) {
			String renameFileName = mainSaveFile(mainImage, request);
			if(renameFileName != null) {
				li.setL_origin_name(mainImage.getOriginalFilename());
				li.setL_changed_name(renameFileName);
		}
			li.setL_file_level(0);
			li.setL_num(l_num+1);
			result = lService.insertLecture_Image(li);
		} else {
			li.setL_origin_name("no_image.png");
			li.setL_changed_name("no_image.png");
			li.setL_file_level(0);
			result = lService.insertLecture_Image(li);
		}
		if(result>0) {
			mv.addObject("cate", "튜터");
			mv.addObject("kind", "튜터");
			mv.setViewName("redirect:mypage.do");
			return mv;
		} else {
			throw new Exception("강의를 신청하는데 실패했습니다. 다시 시도해 주세요.");
		}
	}
	
	@RequestMapping("lectureUpdate.le")
	public ModelAndView lectureUpdate(Lecture l,
									  @RequestParam(value="mainImage", required=false) MultipartFile mainImage,
									  @RequestParam(value="adr1", required=false) String adr1,
									  @RequestParam(value="adr2", required=false) String adr2,
									  ModelAndView mv, MultipartHttpServletRequest request,
									  HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		l.setM_id(loginUser.getM_id());//Session에서 이름받아오기 전까지 사용될 m_id
		String address = adr1;
		if(!adr2.equals("")) {
			address = adr1 + "/" + adr2;
		}
		l.setL_address(address);
		int result = lService.updateLecture(l);
		Lecture_Image li = new Lecture_Image();
		if(mainImage != null && !mainImage.isEmpty()) {
			HashMap<String, Integer> map = new HashMap<>();
			map.put("l_num", l.getL_num());
			map.put("MCR", 0);
			ArrayList im_list = lService.selectLectureImage(map);
			for(int i = 0; i<im_list.size(); i++) {
				String fileName = (String)((Map)im_list.get(i)).get("L_CHANGED_NAME");
				deleteFile(fileName, request);
			}
			lService.dropLectureImage(map);
			
			String renameFileName = mainSaveFile(mainImage, request);
			if(renameFileName != null) {
				li.setL_origin_name(mainImage.getOriginalFilename());
				li.setL_changed_name(renameFileName);
			}
			
			li.setL_file_level(0);
			li.setL_num(l.getL_num());
			result = lService.insertLecture_Image(li);
		} else {
		}
		if(result>0) {
			mv.addObject("cate", "튜터");
			mv.addObject("kind", "튜터");
			mv.setViewName("redirect:mypage.do");
			return mv;
		} else {
			throw new Exception("강의를 신청하는데 실패했습니다. 다시 시도해 주세요.");
		}
	}
	
	//강의 찜목록 추가
	@RequestMapping("lectureWish.le")
	public ModelAndView lectureWish(@RequestParam("l_num") int l_num, HttpSession session, ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		HashMap<String, String> list = lService.selectLecture(l_num);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("MCR", 0);
		ArrayList im_list = lService.selectLectureImage(map);
		map.put("MCR", 1);
		ArrayList ic_list = lService.selectLectureImage(map);
		map.put("MCR", 2);
		ArrayList it_list = lService.selectLectureImage(map);
		map.put("MCR", 3);
		ArrayList ir_list = lService.selectLectureImage(map);
		String adr = (String)list.get("L_ADDRESS");
		if(adr != null && adr.contains("/")) {
			String[] sadr = adr.split("/");
			String radr = sadr[0];
			list.put("L_ADDRESS", radr);
		}
		if(loginUser != null) {
			HashMap<String, Object> wish = new HashMap<>();
			wish.put("l_num", l_num);
			wish.put("m_id", loginUser.getM_id());
			lService.insertWishlist(wish);
			Wishlist w_list = lService.selectWishList(wish);
			if(w_list != null) {
				mv.addObject("w_list", w_list);
			}
			
			HashMap<String, Object> check = new HashMap<>();
			check.put("m_id", loginUser.getM_id());
			check.put("l_num", l_num);
			ArrayList paycheck = lService.userPayCheck(check);
			mv.addObject("paycheck", paycheck);
		}
		mv.addObject("list", list);
		
		mv.addObject("im_list", im_list);
		mv.addObject("ic_list", ic_list);
		mv.addObject("it_list", it_list);
		mv.addObject("ir_list", ir_list);
		mv.setViewName("lecture/lectureDetailView");
		return mv;
	}
	@RequestMapping("lectureWishDel.le")
	public ModelAndView lectureWishDel(@RequestParam("l_num") int l_num, HttpSession session, ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		HashMap<String, String> list = lService.selectLecture(l_num);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("MCR", 0);
		ArrayList im_list = lService.selectLectureImage(map);
		map.put("MCR", 1);
		ArrayList ic_list = lService.selectLectureImage(map);
		map.put("MCR", 2);
		ArrayList it_list = lService.selectLectureImage(map);
		map.put("MCR", 3);
		ArrayList ir_list = lService.selectLectureImage(map);
		String adr = (String)list.get("L_ADDRESS");
		if(adr != null && adr.contains("/")) {
			String[] sadr = adr.split("/");
			String radr = sadr[0];
			list.put("L_ADDRESS", radr);
		}
		if(loginUser != null) {
			HashMap<String, Object> wish = new HashMap<>();
			wish.put("l_num", l_num);
			wish.put("m_id", loginUser.getM_id());
			lService.deleteWishlist(wish);
			Wishlist w_list = lService.selectWishList(wish);
			if(w_list != null) {
				mv.addObject("w_list", w_list);
			}
			
			HashMap<String, Object> check = new HashMap<>();
			check.put("m_id", loginUser.getM_id());
			check.put("l_num", l_num);
			ArrayList paycheck = lService.userPayCheck(check);
			mv.addObject("paycheck", paycheck);
		}
		mv.addObject("list", list);
		mv.addObject("im_list", im_list);
		mv.addObject("ic_list", ic_list);
		mv.addObject("it_list", it_list);
		mv.addObject("ir_list", ir_list);
		mv.setViewName("lecture/lectureDetailView");
		return mv;
	}
	//강의 추가시 상세설명 이미지 추가
	@ResponseBody
    @RequestMapping(value="contImageInsert.le", method=RequestMethod.POST)
    public int multiContImageUpload(@RequestParam("cfiles")List<MultipartFile> cimages, MultipartHttpServletRequest request) {
		int result = 0;
		int l_num = lService.findValue();
        for(MultipartFile image : cimages) {
    		if(image != null && !image.isEmpty()) {
    			result = uploadLectureImgs(image, request, 1, l_num+1);
    		}
        }
        return result;
    }
	
	//강의 추가시 강사소개 이미지 추가
	@ResponseBody
    @RequestMapping(value="tutorImageInsert.le", method=RequestMethod.POST)
    public int multiTutoImageUpload(@RequestParam("tfiles")List<MultipartFile> timages, MultipartHttpServletRequest request) {
//		long sizeSum = 0;
		int result = 0;
		int l_num = lService.findValue();
        for(MultipartFile image : timages) {
//			sizeSum += image.getSize();
//				if(sizeSum >= 10 * 1024 * 1024) {
//				return -2;
//			}
    		if(image != null && !image.isEmpty()) {
    			result = uploadLectureImgs(image, request, 2, l_num+1);
    		}
        }
        return result;
    }
	
	//강의 추가시, 커리큘럼 이미지 추가
	@ResponseBody
    @RequestMapping(value="currImageInsert.le", method=RequestMethod.POST)
    public int multiCurrImageUpload(@RequestParam("rfiles")List<MultipartFile> rimages, MultipartHttpServletRequest request) {
//		long sizeSum = 0;
		int result = 0;
		int l_num = lService.findValue();
        for(MultipartFile image : rimages) {
//			sizeSum += image.getSize();
//				if(sizeSum >= 10 * 1024 * 1024) {
//				return -2;
//			}
    		if(image != null && !image.isEmpty()) {
    			result = uploadLectureImgs(image, request, 3, l_num+1);
    		}
        }
        return result;
    }
	
	
	//상세이미지 수정
	@ResponseBody
    @RequestMapping(value="contImageUpdate.le", method=RequestMethod.POST)
    public int multiContImageUpdateUpload(@RequestParam(value="cfiles", required=false)List<MultipartFile> cimages, @RequestParam("l_num") int l_num, MultipartHttpServletRequest request) {
//		long sizeSum = 0;
		int result = 0;
		if(cimages.size() < 1) {
			return result;
		} else {
			HashMap<String, Integer> map = new HashMap<>();
			map.put("l_num", l_num);
			map.put("MCR", 1);
			ArrayList ic_list = lService.selectLectureImage(map);
			for(int i = 0; i<ic_list.size(); i++) {
				String fileName = (String)((Map)ic_list.get(i)).get("L_CHANGED_NAME");
				deleteFile(fileName, request);
			}
			lService.dropLectureImage(map);
			for(MultipartFile image : cimages) {
	    		if(image != null && !image.isEmpty()) {
	    			result = uploadLectureImgs(image, request, 1, l_num);
	    		}
			}
			return result;
		}
    }
	
	//강사소개 이미지 수정
	@ResponseBody
    @RequestMapping(value="tutorImageUpdate.le", method=RequestMethod.POST)
    public int multiTutoImageUpdateUpload(@RequestParam(value="tfiles", required=false)List<MultipartFile> timages, @RequestParam("l_num") int l_num, MultipartHttpServletRequest request) {
//		long sizeSum = 0;
		int result = 0;
		if(timages.size() < 1) {
			return result;
		} else {
			HashMap<String, Integer> map = new HashMap<>();
			map.put("l_num", l_num);
			map.put("MCR", 2);
			ArrayList ir_list = lService.selectLectureImage(map);
			for(int i = 0; i<ir_list.size(); i++) {
				String fileName = (String)((Map)ir_list.get(i)).get("L_CHANGED_NAME");
				deleteFile(fileName, request);
			}
			lService.dropLectureImage(map);
			for(MultipartFile image : timages) {
	    		if(image != null && !image.isEmpty()) {
	    			result = uploadLectureImgs(image, request, 2, l_num);
	    		}
			}
			return result;
		}
    }
	
	//커리큘럼 상세이미지 수정
	@ResponseBody
    @RequestMapping(value="currImageUpdate.le", method=RequestMethod.POST)
    public int multiCurrImageUpdateUpload(@RequestParam(value="rfiles", required=false)List<MultipartFile> rimages, @RequestParam("l_num") int l_num, MultipartHttpServletRequest request) {
//		long sizeSum = 0;
		int result = 0;
		if(rimages.size() < 1) {
			return result;
		} else {
			HashMap<String, Integer> map = new HashMap<>();
			map.put("l_num", l_num);
			map.put("MCR", 3);
			ArrayList ir_list = lService.selectLectureImage(map);
			for(int i = 0; i<ir_list.size(); i++) {
				String fileName = (String)((Map)ir_list.get(i)).get("L_CHANGED_NAME");
				deleteFile(fileName, request);
			}
			lService.dropLectureImage(map);
			for(MultipartFile image : rimages) {
	    		if(image != null && !image.isEmpty()) {
	    			result = uploadLectureImgs(image, request, 3, l_num);
	    		}
			}
			return result;
		}
    }
	
	
	public String mainSaveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\images\\lecture";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) +
				"." + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
			//전달 받은 파일을 rename명으로 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	
	
	private int uploadLectureImgs(MultipartFile Imgs, MultipartHttpServletRequest request, int level, int l_num) {
		int result = 0;
			Lecture_Image li = new Lecture_Image();
			String li_changed_name = saveFile(Imgs, request);
			if(li_changed_name != null) {
				li.setL_origin_name(Imgs.getOriginalFilename());
				li.setL_changed_name(li_changed_name);
				li.setL_file_level(level);
				li.setL_num(l_num);
				result += lService.insertLecture_Image(li);
			}
		return result;
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\lecture";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + ((int)(Math.random()*10000)+1)+ "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath)); // 전달 받은 file이 rename 명으로 저장
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	private String insertFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\data\\lecture";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + ((int)(Math.random()*10000)+1)+ "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath)); // 전달 받은 file이 rename 명으로 저장
		} catch (IOException e) {
			e.printStackTrace();
		}

		return renameFileName;
	}
	
	
	
	@RequestMapping("lectureConfirm.le")
	public String lectureConfirm(@RequestParam("l_num") int l_num) {
		lService.confirmLecture(l_num);
		return "redirect:adminPayManage.do";
	}
	
	@RequestMapping("lectureDeny.le")
	public String lectureDeny(@RequestParam("l_num") int l_num) {
		lService.denyLecture(l_num);
		return "redirect:adminPayManage.do";
	}
	
	@RequestMapping("lectureUpdateform.le")
	public ModelAndView lectureUpdateform(@RequestParam("l_num") int l_num, ModelAndView mv) {
		HashMap<String, String> list = lService.selectLecture(l_num);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("MCR", 0);
		ArrayList im_list = lService.selectLectureImage(map);
		map.put("MCR", 1);
		ArrayList ic_list = lService.selectLectureImage(map);
		map.put("MCR", 2);
		ArrayList it_list = lService.selectLectureImage(map);
		map.put("MCR", 3);
		ArrayList ir_list = lService.selectLectureImage(map);
		String adr = (String)list.get("L_ADDRESS");
		String adrD = "";
		if(adr != null && adr.contains("/")) {
			String[] sadr = adr.split("/");
			String radr = sadr[0];
			list.put("L_ADDRESS", radr);
			if(sadr[1] != null) {
				adrD = sadr[1];
			}
		}
		mv.addObject("adrD", adrD);
		mv.addObject("list", list);
		mv.addObject("im_list", im_list);
		mv.addObject("ic_list", ic_list);
		mv.addObject("it_list", it_list);
		mv.addObject("ir_list", ir_list);
		mv.setViewName("lecture/lectureUpdate");
		return mv;
	}
	
	@RequestMapping("lectureDelete.le")
	public ModelAndView lectureDelete(@RequestParam("l_num") int l_num, HttpServletRequest request, ModelAndView mv) {
		lService.denyLecture(l_num);
		ArrayList<Map> list= lService.deleteLecture(l_num);
		for(int i = 0; i<list.size(); i++) {
			deleteFile2((String)((Map)list.get(i)).get("L_CHANGED_NAME"), request);
		}
		lService.deleteLectureImage(l_num);
		mv.addObject("cate", "튜터");
		mv.addObject("kind", "튜터");
		mv.setViewName("redirect:mypage.do");
		return mv;
	}
	
	@RequestMapping("lectureEachInsert.le")
	public ModelAndView lectureEachInsert(@RequestParam("l_num") int l_num, ModelAndView mv) {
		mv.addObject("l_num", l_num);
		mv.setViewName("lecture/lectureEachInput");
		return mv;
	}
	
	@RequestMapping("lecturePayView.le")
	public ModelAndView lecturePayView(@RequestParam("l_num") int l_num, ModelAndView mv) {
		HashMap<String, String> list = lService.selectLecture(l_num);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("MCR", 0);
		ArrayList im_list = lService.selectLectureImage(map);
		mv.addObject("list", list);
		mv.addObject("im_list", im_list);
		mv.setViewName("common/payment");
		return mv;
	}
	
	//파일 삭제 관련 메소드
	public void deleteFile(String fileName, MultipartHttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\lecture";
		File file = new File(savePath + "\\" + fileName);
		if (file.exists()) {
			file.delete();
		}
	}
	public void deleteFile2(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\lecture";
		File file = new File(savePath + "\\" + fileName);
		if (file.exists()) {
			file.delete();
		}
	}
	public void deleteFile3(String fileName, MultipartHttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\data\\lecture";
		File file = new File(savePath + "\\" + fileName);
		if (file.exists()) {
			file.delete();
		}
	}
}
