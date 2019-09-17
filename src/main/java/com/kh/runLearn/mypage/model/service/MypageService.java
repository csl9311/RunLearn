package com.kh.runLearn.mypage.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

public interface MypageService {

   ArrayList<Map<String, String>> selectLectureView(String userId, PageInfo pi);   // 수강목록

   int selectLectureCount(String userId); // 수강목록 수

   
   ArrayList<Map<String, String>> selectNoPayLectureView(String userId, PageInfo pi); // 강의 찜목록

   int selectNopayLectureCount(String userId); // 강의 찜목록 수

   ArrayList<Map<String, Object>> selectTuterLecturePageView(String userId, PageInfo pi); // 튜터목록

   ArrayList<Map<String, String>> selectProductView(String userId, PageInfo pi); // 상품 찜목록

   int selectPlistCount(String userId); // 상품찜목록 수

   int updateMember(Member m); // 회원 정보 수정

   int updateMember_Image(Member_Image mi); // 회원 정보 프로필 수정

   Member_Image selectProfile(String userId); // 회원 프로필 사진 

   int tuterLectureCount(String userId); //튜터페이지 강의 수

   Lecture selectLecture(String userId);





}