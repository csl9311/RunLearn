package com.kh.runLearn.lecture.model.service;

import java.util.ArrayList;

import com.kh.runLearn.board.model.vo.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.LectureEach;

public interface LectureService {
	ArrayList<Lecture> selectCateList(PageInfo pi); //카테고리로 화면에서 눌렀을때
	
	Lecture selectLecture(int l_num);//강의 하나를 선택했을때
	
	int paymentLecture();//강의를 결제했을때(수정필요)
	
	LectureEach classEnter(int l_each_num);//강의의 제 n화를 선택했을때
	
	LectureEach mediaEnter(int l_each_num);//강의의 제 n화 영상보기를 선택했을때
	
	int permissionLecture(Lecture l);//튜터가 강의 신청을 할때
	
	int acceptLecture(int l_num);//관리자가 강의 신청을 허가 할때
	
	int notAcceptLecture(int l_num);//관리자가 강의 신청을 불허 할때
	
	int insertLecture(LectureEach le);//튜터가 강의를 1화 추가할때
	
	int deleteLecture(LectureEach le);//튜터가 강의를 1화 삭제할때
	
	
}
