package com.kh.runLearn.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.board.model.dao.BoardDAO;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO bDAO;
}
