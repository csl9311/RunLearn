package com.kh.runLearn.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

		System.out.println(all);
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
	
	//강의 상세페이지
	@RequestMapping("lectureDetailView.le")
	public ModelAndView lectureDetailView(@RequestParam("l_num") int l_num, ModelAndView mv) {

//		ArrayList list = lService.selectLecture(l_num);
		HashMap<String, String> list = lService.selectLecture(l_num);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("MCR", 0);
		ArrayList im_list = lService.selectLectureImage(map);
		map.put("MCR", 1);
		ArrayList ic_list = lService.selectLectureImage(map);
		map.put("MCR", 2);
		ArrayList ir_list = lService.selectLectureImage(map);
		System.out.println("L : "+list);
		System.out.println("m : "+im_list);
		System.out.println("c : "+ic_list);
		System.out.println("r : "+ir_list);
		String adr = (String)list.get("L_ADDRESS");
		System.out.println(adr);
		if(adr != null && adr.contains("/")) {
			String[] sadr = adr.split("/");
			String radr = sadr[0];
			list.put("L_ADDRESS", radr);
		}
		System.out.println(list);
		mv.addObject("list", list);
		mv.addObject("im_list", im_list);
		mv.addObject("ic_list", ic_list);
		mv.addObject("ir_list", ir_list);
		mv.setViewName("lecture/lectureDetailView");
		return mv;
	}
	
	//강의 n화 화면페이지
	@RequestMapping("lectureEachMainView.le")
	public ModelAndView lectureEachMainView(@RequestParam("l_num") int l_num, @RequestParam(value="l_each_num", required=false) int l_each_num, ModelAndView mv) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("l_num", l_num);
		map.put("l_each_num", l_each_num);
		HashMap<String, String> etc = lService.selectLecture(l_num);
		Lecture_Each l_each = lService.classEnter(map);
		ArrayList list = lService.classList(l_num);
		System.out.println(l_each);
		if(l_each==null) {
			l_each = new Lecture_Each();
			l_each.setL_num(l_num);
			l_each.setL_each_name("강의가 없습니다!");
			l_each.setL_each_content("강의가 준비중입니다.");
			l_each.setL_each_num(0);
		}
		System.out.println(etc);
		
		mv.addObject("etc", etc);
		mv.addObject("list", list);
		mv.addObject("l_each", l_each);
		mv.setViewName("lecture/lectureEachView");
		return mv;
	}
	
	//강의 n화 영상페이지
	@RequestMapping("lectureMediaView.le")
	public ModelAndView lectureMediaView(@RequestParam(value="l_each_num") int l_each_num, ModelAndView mv) {
		HashMap<String, Object> map = lService.mediaEnter(l_each_num);
		ArrayList list = lService.classList(((BigDecimal)map.get("L_NUM")).intValue());
		System.out.println(map);
		if(!map.isEmpty() && !list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("media", map);
			mv.setViewName("lecture/lectureVideoView");
			return mv;
		} else {
			throw new Exception("강의 영상화면으로 들어가는데 실패했습니다. 다시 시도해주십시오. 이 오류가 계속 될 경우, 관리자에게 문의해주시기 바랍니다.");
		}
	}
	
//	튜터의 강의 신청
	@RequestMapping("lectureApply.le")
	public ModelAndView permissionLecture(Lecture l,
										  @RequestParam(value="mainImage", required=false) MultipartFile mainImage,
										  @RequestParam(value="contImgs", required=false) MultipartFile[] contImgs,
										  @RequestParam(value="currImgs", required=false) MultipartFile[] currImgs,
										  @RequestParam(value="ContResult", required=false) Integer ContResult,
										  @RequestParam(value="CurrResult", required=false) Integer CurrResult,
										  @RequestParam(value="adr1", required=false) String adr1,
										  @RequestParam(value="adr2", required=false) String adr2,
										  ModelAndView mv, MultipartHttpServletRequest request) {
		
		l.setM_id("yee");//Session에서 이름받아오기 전까지 사용될 m_id
		System.out.println(l);
		System.out.println("adr1:"+adr1);
		System.out.println("adr2:"+adr2);
		String address = adr1;
		if(!adr2.equals("")) {
			address = adr1 + "/" + adr2;
		}
		l.setL_address(address);
		System.out.println(l);
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
//		for(int i = 0; i<contImgs.length; i++) {
//			System.out.println(contImgs[i].getOriginalFilename());
//		}
//		boolean contCheck = contImgs[0].isEmpty();
//		if(!contCheck) {
//			result = uploadLectureImgs(contImgs, request, 1);
//		}
//		boolean currCheck = currImgs[0].isEmpty();
//		if(!currCheck) {
//			result = uploadLectureImgs(currImgs, request, 2);
//		}
		if(result>0) {
			mv.setViewName("home");
			return mv;
		} else {
			throw new Exception("강의를 신청하는데 실패했습니다. 다시 시도해 주세요.");
		}
		
//		System.out.println("??");
//		
//		org.springframework.util.MultiValueMap<String, MultipartFile> getit = request.getMultiFileMap();
//		System.out.println(request.getParameter("Data"));
//		System.out.println(getit);
//		System.out.println(getit.get("mainImage"));
//		System.out.println(request.getParameter("contLen"));
//		for(int i = 0; i<getit.get("contImgs").size(); i++) {
//			System.out.println(getit.get("contImgs").get(i).getOriginalFilename());
//		}
//		for(int i = 0; i<Integer.parseInt(request.getParameter("contLen")); i++) {
//			System.out.println("???");
//		}
//		System.out.println(request.getFile("cImage_0").getOriginalFilename());
//		
//		System.out.println(getit.get("currImgs"));
//		
	}
	
	
	
	@RequestMapping("apply.le")
	public String example(/* @RequestParam("l_num") int l_num, ModelAndView mv */) {
//		HashMap<String, String> list = lService.selectLecture(l_num);
//		HashMap<String, Integer> map = new HashMap<>();
//		map.put("l_num", l_num);
//		map.put("MCR", 0);
//		ArrayList im_list = lService.selectLectureImage(map);
//		map.put("MCR", 1);
//		ArrayList ic_list = lService.selectLectureImage(map);
//		map.put("MCR", 2);
//		ArrayList ir_list = lService.selectLectureImage(map);
//		System.out.println("L : "+list);
//		System.out.println("m : "+im_list);
//		System.out.println("c : "+ic_list);
//		System.out.println("r : "+ir_list);
//		String adr = (String)list.get("L_ADDRESS");
//		System.out.println(adr);
//		if(adr != null && adr.contains("/")) {
//			String[] sadr = adr.split("/");
//			String radr = sadr[0];
//			list.put("L_ADDRESS", radr);
//		}
//		System.out.println(list);
//		mv.addObject("list", list);
//		mv.addObject("im_list", im_list);
//		mv.addObject("ic_list", ic_list);
//		mv.addObject("ir_list", ir_list);
//		mv.setViewName("lecture/lectureUpdate");
//		return mv;
		return "lecture/lectureApply";
	}
	
	
	@RequestMapping("lectureEachInput.le")
	public ModelAndView lectureEachInput(Lecture_Each le, @RequestParam(value="l_file", required=false) MultipartFile l_file, @RequestParam("l_file_video") String lfv, ModelAndView mv, MultipartHttpServletRequest request) {
		int result = lService.insertLecture(le);
		Lecture_File lf = new Lecture_File();
		if(l_file != null && !l_file.isEmpty()) {
			String renameFileName = insertFile(l_file, request);
			if(renameFileName != null) {
				lf.setL_origin_name(l_file.getOriginalFilename());
				lf.setL_changed_name(renameFileName);
			}
			lf.setL_file_video(lfv);
			lService.insertLectureFile(lf);
		}
		if(result > 0) {
			mv.setViewName("home");
			return mv;
		} else {
			throw new Exception("강의를 추가하는데 실패했습니다. 다시 시도해 주세요.");
		}
		
	}
	
	@ResponseBody
    @RequestMapping(value="contImageInsert.le", method=RequestMethod.POST)
    public int multiContImageUpload(@RequestParam("cfiles")List<MultipartFile> cimages, MultipartHttpServletRequest request) {
//		long sizeSum = 0;
		int result = 0;
		System.out.println("C"+cimages);
		int l_num = lService.findValue();
        for(MultipartFile image : cimages) {
//			sizeSum += image.getSize();
//				if(sizeSum >= 10 * 1024 * 1024) {
//				return -2;
//			}
            Lecture_Image li = new Lecture_Image();
    		if(image != null && !image.isEmpty()) {
    			result = uploadLectureImgs(image, request, 1, l_num+1);
    		}
        }
        return result;
    }
	
	@ResponseBody
    @RequestMapping(value="currImageInsert.le", method=RequestMethod.POST)
    public int multiCurrImageUpload(@RequestParam("rfiles")List<MultipartFile> rimages, MultipartHttpServletRequest request) {
//		long sizeSum = 0;
		int result = 0;
		System.out.println("r"+rimages);
		int l_num = lService.findValue();
		System.out.println(lService.findValue());
        for(MultipartFile image : rimages) {
//			sizeSum += image.getSize();
//				if(sizeSum >= 10 * 1024 * 1024) {
//				return -2;
//			}
            Lecture_Image li = new Lecture_Image();
    		if(image != null && !image.isEmpty()) {
    			result = uploadLectureImgs(image, request, 2, l_num+1);
    		}
        }
        return result;
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
		String savePath = root + "\\images\\lecture\\lectureEachData";
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
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\lecture";
		File file = new File(savePath + "\\" + fileName);

		if (file.exists()) {
			file.delete();
		}
	}
	
	
}
