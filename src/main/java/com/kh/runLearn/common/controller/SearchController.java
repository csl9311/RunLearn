package com.kh.runLearn.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	@RequestMapping("search.do")
	public String search(@RequestParam("search") String search, HttpSession session) {
		session.setAttribute("search", search);
		
		return "search/searchView";
	}
}
