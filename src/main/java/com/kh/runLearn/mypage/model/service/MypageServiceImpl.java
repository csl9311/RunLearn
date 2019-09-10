package com.kh.runLearn.mypage.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.member.model.service.MemberService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.mypage.model.dao.MypageDAO;

@Service("myService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDAO myDAO;

	@Override
	public ArrayList<Map<String, String>> selectLectureView(String userId, PageInfo pi) { // 수강목록 출력
	
		 return myDAO.selectLectureView(userId, pi);
	}

	@Override
	public int selectLectureCount(String userId) { // 수강목록 수
		
	
		return myDAO.selectLetureCount(userId);
	}

	
	@Override
	public ArrayList<Map<String, String>> selectNoPayLectureView(String userId, PageInfo pi) { //강의 찜목록
		return myDAO.selectNoPayLectureView(userId, pi);
		
	}

	@Override
	public int selectNopayLectureCount(String userId) { // 강의 찜목록 수
		
		return myDAO.selectNopayLectureCount(userId);
	}

	
	@Override
	public ArrayList<Map<String, String>> selectProductView(String userId, PageInfo pi) { // 상품 찜목록
		
		return myDAO.selectProductView(userId, pi);
	}

	@Override
	public int selectPlistCount(String userId) { // 상품 찜목록 수
		
		return myDAO.selectPlistCount(userId);
	}

	@Override
	public ArrayList<Map<String, String>> selectTuterLecturePageView(String userId, PageInfo pi) {
		
		return myDAO.selectTuterLecturePageView(userId, pi);
	}

	@Override
	public int updateMember(Member m) { //회원정보 수정
 		
		return myDAO.updateMember(m);
	}

	@Override
	public int updateMember_Image(Member_Image mi) { //회원 프로필 수정
		
		return myDAO.updateMember_Image(mi);
		
	}
	
	
	
	
	
	


	
}
