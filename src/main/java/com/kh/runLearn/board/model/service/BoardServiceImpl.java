package com.kh.runLearn.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public void addReadCount(int b_num) {
		bDAO.addReadCount(b_num);
	}

	@Override
	public Board selectBoard(int b_num) {
		return bDAO.selectBoard(b_num);
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
	public String selectBoardImg(Board b) {
		return bDAO.selectBoardImg(b);
	}

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(b);
	}

	@Override
	public int updateBoard(Board b) {
		return bDAO.updateBoard(b);
	}

	@Override
	public int deleteBoard(int b_num) {
		return bDAO.deleteBoard(b_num);
	}

	@Override
	public int insertBoard_Image(Board_Image bi) {
		return bDAO.insertBoard_Image(bi);
	}

	@Override
	public int updateBoard_Image(Board_Image bi) {
		return bDAO.updateBoard_Image(bi);
	}

	@Override
	public int deleteBoard_Image(Board_Image bi) {
		return bDAO.deleteBoard_Image(bi);
	}
	
	/* ---------------고객센터용---------------  */
	@Override
	public ArrayList<HashMap<String, String>> selectCenterBoardList(Map<String, Object> map) {
		return bDAO.selectCenterBoardList(map);
	}

	@Override
	public int getCenterListCount(Map<String, Object> map) {
		return bDAO.getCenterListCount(map);
	}


	/* ---------------마이페이지용---------------  */
	@Override
	public Board selectBoardTutor(String userId) {
		return bDAO.selectBoardTutor(userId);
	}
	
}
