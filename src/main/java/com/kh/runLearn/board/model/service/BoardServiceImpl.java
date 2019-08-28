package com.kh.runLearn.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.board.model.dao.BoardDAO;
import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.board.model.vo.BoardImage;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO bDAO;

	@Override
	public Board selectBoard(int b_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectBoardList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectBoardList(String b_category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardImage> selectBoardImg(Board b) {
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
	public int insertBoardImage(BoardImage bi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoardImage(BoardImage bi) {
		// TODO Auto-generated method stub
		return 0;
	}
}
