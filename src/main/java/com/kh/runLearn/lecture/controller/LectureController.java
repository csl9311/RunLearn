package com.kh.runLearn.lecture.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.lecture.model.service.LectureService;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;

//	@RequestMapping("lsearchAll.do")
//	public ModelAndView lectureSearchAll(ModelAndView mv, @RequestParam("search") String search) {
//		mv.addObject("search", search);
//		mv.addObject("cate", "강의");
//		mv.setViewName("search/searchDetailView");
//		
//		return mv;
//	}
}
