package com.kh.runLearn.member.model.service;

import java.util.ArrayList;

import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.product.model.vo.Product;

public interface MemberService {
	int login(Member m); // 로그인
	void logout(String m_id); // 로그아웃
	Member findInfo(Member m); // id/pw 찾기
	int changeGrade(Member m); // 튜터등록(관리자)

	Member selectMember(Member m); // 개인정보조회
	ArrayList<Member> selectAllMember(); // 관리자 회원정보 조회
	ArrayList<Member> selectLectureMember(int l_num); // 강의별 수강생 조회

	int insertMember(Member m); // 회원가입
	int updateMember(Member m); // 개인정보수정
	int deleteMember(Member m); // 회원탈퇴
	
	int insertMember_Image(Member_Image mi);
	int updateMember_Image(Member_Image mi);
	int deleteMember_Image(Member_Image mi);
	int Member_ImageInsert(Member_Image mi);
	int insertMemberImage(Member_Image mi);
	int updateMemberImage(Member_Image mi);
	int deleteMemberImage(Member_Image mi);
	
	
	
	
	
	

	
	
	
}
