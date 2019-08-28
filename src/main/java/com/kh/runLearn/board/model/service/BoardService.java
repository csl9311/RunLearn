package com.kh.runLearn.board.model.service;

import java.util.ArrayList;

import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.board.model.vo.BoardImage;

public interface BoardService {
	Board selectBoard(int b_num); // 게시글 조회
	ArrayList<Board> selectBoardList(); // 게시목록조회
	ArrayList<Board> selectBoardList(String b_category); // 카테고리별 게시목록조회
	ArrayList<BoardImage> selectBoardImg(Board b); // 이미지파일 조회
	
	int insertBoard(Board b); // 게시글 등록
	int updateBoard(Board b); // 게시글 수정
	int deleteBoard(int b_num); // 게시글 삭제

	int insertBoardImage(BoardImage bi); // 게시글 이미지 등록
	int updateBoardImage(BoardImage bi); // 게시글 이미지 수정
}
