package com.kh.runLearn.lecture.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.lecture.model.vo.Lecture;

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
		ArrayList<Lecture> list = lService.selectLectureList(pi);
		String cName = "전체";
		mv.addObject("cName", cName);
		mv.addObject("list", list);
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
		ArrayList<Lecture> list = lService.selectLectureList(pi, l_category);
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
}
