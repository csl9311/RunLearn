package com.kh.runLearn.lecture.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.lecture.model.vo.Lecture_Each;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;
	
	@RequestMapping("selectLectureAllList.le")
	public ModelAndView selectLectureAllList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
		
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = lService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		pi.setBoardLimit(12);
		ArrayList all = lService.selectLectureList(pi);
		
		System.out.println(all);
		mv.addObject("list", all);
		mv.addObject("pi", pi);
		mv.setViewName("lecture/lectureMain");
		return mv;
	}
	
	@RequestMapping("selectLectureList.le")
	public ModelAndView selectLectureList(@RequestParam(value="page", required=false) Integer page, @RequestParam("l_category") String l_category, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage=page;
		}
		int listCount = lService.getCategoryListCount(l_category);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		pi.setBoardLimit(12);
		ArrayList list = lService.selectLectureList(pi, l_category);
		String cName = "";
		if(l_category.equals("D")) {
			cName="디자인";
		} else if(l_category.equals("W")) {
			cName="실무역량";
		} else if(l_category.equals("B")) {
			cName="뷰티";
		} else if(l_category.equals("V")) {
			cName="영상";
		} else if(l_category.equals("F")) {
			cName="외국어";
		} else if(l_category.equals("M")) {
			cName="음악";
		} else if(l_category.equals("L")) {
			cName="라이프스타일";
		} else if(l_category.equals("J")) {
			cName="제테크";
		}
		mv.addObject("cName", cName);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("lecture/lectureMain");
		return mv;
	}
	
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
		mv.addObject("list", list);
		mv.addObject("im_list", im_list);
		mv.addObject("ic_list", ic_list);
		mv.addObject("ir_list", ir_list);
		mv.setViewName("lecture/lectureDetailView");
		return mv;
	}
	
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
	
	@RequestMapping("lectureMediaView.le")
	public ModelAndView lectureMediaView(@RequestParam(value="l_each_num") int l_each_num, ModelAndView mv) {
		HashMap map = lService.mediaEnter(l_each_num);
		System.out.println(map);
		mv.addObject("media", map);
		mv.setViewName("lecture/lectureVideoView");
		return mv;
	}
}
