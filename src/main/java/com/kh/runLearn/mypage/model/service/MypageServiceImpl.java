package com.kh.runLearn.mypage.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.mypage.model.dao.MypageDAO;

@Service("myService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDAO myDAO;

	@Override
	public ArrayList<Map<String, String>> selectLectureView(String userId, PageInfo pi) { //수강목록
		
		return myDAO.selectLectureView(userId, pi);
	}

	@Override
	public int selectLectureCount(String userId) { // 수강목록 수
		
		return myDAO.selectLetureCount(userId);
	}

	@Override
	public ArrayList<Map<String, String>> selectNoPayLectureView(String userId, PageInfo pi) { // 강의 찜목록

		return myDAO.selectNoPayLectureView(userId, pi);
	}

	@Override
	public int selectNopayLectureCount(String userId) { // 강의 찜목록 수
		
		return myDAO.selectNopayLectureCount(userId);
	}

	@Override
	public ArrayList<Map<String, Object>> selectTuterLecturePageView(String userId, PageInfo pi) { // 튜터 목록
		
		return myDAO.selectTuterLecturePageView(userId, pi);
	}

	@Override
	public ArrayList<Map<String, String>> selectProductView(String userId, PageInfo pi) { // 상품찜목록
	
		return myDAO.selectProductView(userId, pi);
	}

	@Override
	public int selectPlistCount(String userId) {
		
		return myDAO.selectPlistCount(userId);
	}

	@Override
	public int updateMember(Member m) { // 회원정보 수정
	
		return myDAO.updateMember(m);
	}

	@Override
	public int updateMember_Image(Member_Image mi) { //회원정보 프로필 수정
		
		return myDAO.updateMember_Image(mi);
		
	}

	@Override
	public Member_Image selectProfile(String userId) { //회원 프로필 사진 
		
		return myDAO.selectProfile(userId);
	}

	@Override
	public int tuterLectureCount(String userId) { //튜터 페이지 강의 수
	
		return myDAO.tuterLectureCount(userId);
	}

	@Override
	public Lecture selectLecture(String userId) {
		
		return myDAO.selectLecture(userId);
	}


	


}
