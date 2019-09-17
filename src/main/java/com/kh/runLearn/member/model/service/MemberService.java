package com.kh.runLearn.member.model.service;

import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

public interface MemberService {
	Member login(Member m); // 로그인
	int getAllUserCount();// 회원수조회 블랙포함
	int insertMember(Member m); // 회원가입
	int checkId(String id); // 아이디 중복확인
	int checkNick(String nick); // 닉네임 중복확인
	int checkEmailo(String m_email); // 이메일 중복확인
	int checkPhone(Member m); // 휴대폰 번호 확인
	int checkPhone2(Member m); // 휴대폰 번호 확인(비밀전호 찾기)
	int checkEmail(Member m); // 이메일 확인
	int checkEmail2(Member m); // 이메일 확인(비밀번호 찾기)
	Member findMember(Member m); // 아이디 조회
	Member_Image findMemberImg(String m_id); // 이미지 조회
	int pwChange(Member m); // 암호 변경
	String checkPw(String id); // 암호 확인
	int insertMember_Image(Member_Image mi); // 프로필 사진 등록

}
