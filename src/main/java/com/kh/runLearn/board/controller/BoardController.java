package com.kh.runLearn.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.runLearn.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired 
	private BoardService bService;
	
	@RequestMapping("cCenterView.do")
	public String cCenterView() {
		return "customerCenter/cCenterMain";
	}
}
