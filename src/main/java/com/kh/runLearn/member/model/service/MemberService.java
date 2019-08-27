package com.kh.runLearn.member.model.service;

import java.util.ArrayList;

import com.kh.runLearn.member.model.vo.Member;

public interface MemberService {
	int login(Member m);

	void logout(String id);
	
	Member selectMember(Member m);
	ArrayList<Member> selectAllMember();

	int insertMember(Member m);
	int updateMember(Member m);
	int deleteMember(Member m);

	Member findInfo(Member m);

	int regTutor(Member m);
	int regBlack(Member m);
	
}
