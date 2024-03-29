package com.kh.runLearn.lecture.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.lecture.model.vo.Lecture_Each;
import com.kh.runLearn.lecture.model.vo.Lecture_File;
import com.kh.runLearn.lecture.model.vo.Lecture_Image;
import com.kh.runLearn.lecture.model.vo.Wishlist;

public interface LectureService {
	int getListCount();//강의 전체 갯수 받아오기+
	int getCategoryListCount(String l_category);//카테고리별 강의 갯수 가져오기+
	ArrayList selectLectureList(PageInfo pi); // 강의 전체 목록+
	ArrayList selectLectureList(PageInfo pi, String l_category); // 카테고리별 강의목록+
	
	ArrayList<Lecture> selectMyLectureList(PageInfo pi, String id); // 수강중인 강의 정보 조회(마이페이지)+
	
	int confirmLecture(int l_num); // 관리자가 강의 신청을 허가 할때+
	int denyLecture(int l_num); // 관리자가 강의 신청을 불허 할때+
	int permissionLecture(Lecture l); // 튜터가 강의 신청을 할때+
	
	HashMap<String, String> selectLecture(int l_num); // 강의 정보 조회+
	ArrayList selectLectureImage(HashMap<String, Integer> map);// 강의 정보의 이미지 조회+
	int updateLecture(Lecture l); // 강의 수정+
	ArrayList deleteLecture(int l_num); // 강의 삭제 (이미지파일 삭제용 이름찾기)+
	int deleteLectureImage(int l_num); // 강의 이미지 DB에서 삭제+
	
	Lecture_Each classEnter(HashMap<String, Integer> map); // 강의의 제 n화를 선택했을때+
	Lecture_File selectLectureFile(int l_each_num); //강의 n화를 가져올때 n화의 첨부파일+
	ArrayList classList(int l_num);//제 n화 강의에서 나올 나머지 강의 리스트 가져오기+
	ArrayList tclassList(int l_num);
	HashMap<String, Object> mediaEnter(int l_each_num); // 강의의 제 n화 영상보기를 선택했을때+
	
	int insertLecture(Lecture_Each le); // 튜터가 강의를 1화 추가할때+
	int insertLectureFile(Lecture_File lf);//튜터가 강의 1화를 추가시 첨부파일을 추가할때+
	int updateLectureEach(Lecture_Each le); // 튜터가 강의를 1화 수정할때
	
	int insertLecture_Image(Lecture_Image li); // 강의 메인이미지 업로드+
	int insertLecture_cImage(Lecture_Image li); //강의 상세,커리큘럼 이미지 추가+
	int dropLectureImage(HashMap<String, Integer> map); //이미지 수정시 강의 이미지 제거.+
	
	
	
	ArrayList<Map<String, String>> selectNewLectureList(); // home.jsp에 최신강의 조회
	ArrayList<String> selectHotLecture(); // home.jsp에 인기강의 조회
	int findValue();
	String findEachNum(int l_num);
	int updateLectureFile(Lecture_File lf);
	int enableLectureEach(int l_each_num);
	ArrayList userPayCheck(HashMap<String, Object> check);
	int insertWishlist(HashMap<String, Object> wish); // 강의찜목록 등록+
	Wishlist selectWishList(HashMap<String, Object> wish);
	int deleteWishlist(HashMap<String, Object> wish);
	


}