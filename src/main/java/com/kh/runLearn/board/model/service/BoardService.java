package com.kh.runLearn.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.board.model.vo.Board_Image;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;

public interface BoardService {
	int getListCount(String b_category); // 카테고리별 게시글 수 조회
	
	void addReadCount(int b_num); // 게시글 조회수
	Board selectBoard(int b_num); // 게시글 조회
	ArrayList<Board> selectBoardList(PageInfo pi); // 게시목록조회
	ArrayList<Board> selectBoardList(PageInfo pi, Lecture l); // 카테고리별 게시목록조회
	ArrayList<Board> selectBoardList(PageInfo pi, String b_category); // 카테고리별 게시목록조회
	
	ArrayList<Board_Image> selectBoardImg(Board b); // 이미지파일 불러오기
	
	int insertBoard(Board b); // 게시글 등록
	int updateBoard(Board b); // 게시글 수정
	int deleteBoard(int b_num); // 게시글 삭제

	int insertBoard_Image(Board_Image bi); // 게시글 이미지 등록
	int updateBoard_Image(Board_Image bi); // 게시글 이미지 수정

	/* ---------------고객센터용---------------  */
	ArrayList<HashMap<String, String>> selectCenterBoardList(Map<String, Object> map); // 고객센터 게시목록조회
	int getCenterListCount(Map<String, Object> map); // 고객센터 게시글 수 조회
}
