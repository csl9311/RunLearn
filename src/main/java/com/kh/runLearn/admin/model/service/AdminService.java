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
	ArrayList<Member> allUserListId(PageInfo pi); // id관리자 회원정보 조회
	ArrayList<Member> allUserListNick(PageInfo pi); // nickname관리자 회원정보 조회
	ArrayList<Member> allUserListEm(PageInfo pi); // email관리자 회원정보 조회
	ArrayList<Member> allUserListPh(PageInfo pi); // phone관리자 회원정보 조회
	ArrayList<Member> allUserListMD(PageInfo pi); // 수정일 관리자 회원정보 조회
	ArrayList<Member> allUserListG(PageInfo pi); // 등급 관리자 회원정보 조회
	ArrayList<Member> allUserListS(PageInfo pi); // 상태 관리자 회원정보 조회
	
	ArrayList<Member> allUserListR(PageInfo pi); // 관리자 회원정보 조회
	ArrayList<Member> allUserListIdR(PageInfo pi); // id관리자 회원정보 조회
	ArrayList<Member> allUserListNickR(PageInfo pi); // nickname관리자 회원정보 조회
	ArrayList<Member> allUserListEmR(PageInfo pi); // email관리자 회원정보 조회
	ArrayList<Member> allUserListPhR(PageInfo pi); // phone관리자 회원정보 조회
	ArrayList<Member> allUserListMDR(PageInfo pi); // 수정일 관리자 회원정보 조회
	ArrayList<Member> allUserListGR(PageInfo pi); // 등급 관리자 회원정보 조회
	ArrayList<Member> allUserListSR(PageInfo pi); // 상태 관리자 회원정보 조회

	







































}
