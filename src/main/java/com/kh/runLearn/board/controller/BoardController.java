package com.kh.runLearn.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.runLearn.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired 
	private BoardService bService;
	
}
