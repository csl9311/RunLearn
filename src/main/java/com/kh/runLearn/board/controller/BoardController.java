package com.kh.runLearn.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.board.model.service.BoardService;
import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;

@Controller
public class BoardController {
	
	@Autowired 
	private BoardService bService;
	
	@RequestMapping("cCenterView.do")
	public ModelAndView cCenterView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page, @RequestParam("b_category") String b_category) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount(b_category);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectBoardList(pi, b_category);
		
		mv.addObject("b_category", b_category);
		mv.addObject("list", list);
		
		mv.setViewName("customerCenter/cCenterMain");
		
		return mv;
	}
	
	@RequestMapping("cCenterDetailView.do")
	public ModelAndView cCenterDetail(ModelAndView mv, @RequestParam("b_category") String b_category, @RequestParam("b_num") String b_num) {
		Board b = bService.selectBoard(Integer.parseInt(b_num));
		
		mv.addObject("b_category", b_category);
		mv.addObject("b", b);
		mv.setViewName("customerCenter/cCenterDetail");
		return mv;
	}
}
