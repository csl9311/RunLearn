package com.kh.runLearn.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.board.model.dao.BoardDAO;
import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.board.model.vo.Board_Image;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO bDAO;

	@Override
	public int getListCount(String b_category) {
		return bDAO.getListCount(b_category);
	}

	@Override
	public Board selectBoard(int b_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, Lecture l) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, String b_category) {
		return bDAO.selectBoardList(pi, b_category);
	}

	@Override
	public ArrayList<Board_Image> selectBoardImg(Board b) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int b_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoard_Image(Board_Image bi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard_Image(Board_Image bi) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
