package com.kh.runLearn.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.board.model.vo.Board_Image;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.vo.Member;

public interface AdminService {
	int allUserCount(); 	//관리자 전체 회원 수 조회
	int tutorUserCount();
	int tuteeUserCount();
	int blackUserCount();
	int leaveUserCount();
	int adminUserCount();
	int targetUserUpdate(Member m);
	
	ArrayList<Member> allUserList(PageInfo pi); // 관리자 회원정보 조회
	
	ArrayList<Board> boardList(PageInfo pi); // 보드리스트 조회
	
	
	 int boardListCount();
	 int boardListCountNot();
	 int boardListCountQe();
	 int boardListCountSug();
	 int boardListCountDecl();
	int boardListCountA();
	ArrayList<Board> boardListA(PageInfo blc);//튜터신청 보드 만 조회






































}
