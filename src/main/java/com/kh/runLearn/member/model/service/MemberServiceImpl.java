package com.kh.runLearn.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.member.model.dao.MemberDAO;
import com.kh.runLearn.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO mDAO;

	@Override
	public int login(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void logout(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member findMember(Member m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int regTutor(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int regBlack(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}
}
