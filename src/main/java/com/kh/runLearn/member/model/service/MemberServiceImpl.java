package com.kh.runLearn.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.member.model.dao.MemberDAO;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDAO;

	@Override
	public int login(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void logout(String m_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member findInfo(Member m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int changeGrade(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member selectMember(Member m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Member> selectAllMember(PageInfo pi) {//관리자  회원 정보 조회
		// TODO Auto-generated method stub
		return mDAO.selectAllMember(pi);
	}

	@Override
	public ArrayList<Member> selectLectureMember(int l_num) {
		// TODO Auto-generated method stub
		return null;
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
	public int insertMember_Image(Member_Image mi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember_Image(Member_Image mi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember_Image(Member_Image mi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Member_ImageInsert(Member_Image mi) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
