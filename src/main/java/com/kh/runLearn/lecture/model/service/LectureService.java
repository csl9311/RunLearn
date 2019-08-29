package com.kh.runLearn.lecture.model.service;

import java.util.ArrayList;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.Lecture_Each;
import com.kh.runLearn.lecture.model.vo.Lecture_Image;

public interface LectureService {
	ArrayList<Lecture> selectLectureList(PageInfo pi); // 강의 전체 목록
	ArrayList<Lecture> selectLectureList(PageInfo pi, String l_category); // 카테고리별 강의목록
	
	ArrayList<Lecture> selectMyLectureList(PageInfo pi, String id); // 수강중인 강의 정보 조회(마이페이지)
	
	int acceptLecture(int l_num); // 관리자가 강의 신청을 허가 할때
	int notAcceptLecture(int l_num); // 관리자가 강의 신청을 불허 할때
	int permissionLecture(Lecture l); // 튜터가 강의 신청을 할때
	int updatePermissionLecture(Lecture l); // 튜터가 신청한 강의를 수정할때
	
	Lecture selectLecture(int l_num); // 강의 정보 조회
	int insertLecture(Lecture l); // 강의 등록
	int updateLecture(Lecture l); // 강의 수정
	int deleteLecture(int l_num); // 강의 삭제 (이미지파일 삭제해줘야함)

	Lecture_Each classEnter(int l_each_num); // 강의의 제 n화를 선택했을때
	Lecture_Each mediaEnter(int l_each_num); // 강의의 제 n화 영상보기를 선택했을때
	
	int insertLecture(Lecture_Each le); // 튜터가 강의를 1화 추가할때
	int deleteLecture(Lecture_Each le); // 튜터가 강의를 1화 삭제할때
	
	int insertLecture_Image(Lecture_Image li); // 강의 이미지 업로드
	int updateLecture_Image(Lecture_Image li); // 강의 이미지 수정
	
	int insertWishlist(Lecture l, String m_id); // 강의찜목록 등록
	int deleteWishlist(int l_num, String m_id); // 강의찜목록에서 삭제

}