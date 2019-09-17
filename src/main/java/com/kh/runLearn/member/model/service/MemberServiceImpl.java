package com.kh.runLearn.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.dao.MemberDAO;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.member.model.vo.Member_Image;
import com.kh.runLearn.product.model.vo.Product;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO mDAO;

	@Override
	public Member login(Member m) {
		return mDAO.login(m);
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
	public ArrayList<Member> selectAllMember(PageInfo pi) {//관리자  회원 정보 조회
		// TODO Auto-generated method stub
		return mDAO.selectAllMember(pi);
	}
	@Override
	public int getAllUserCount() {//전체회원수 조회 블랙회원도 카운트됨
		// TODO Auto-generated method stub
		return mDAO.getAllUserCount();
	}
	@Override
	public ArrayList<Member> selectLectureMember(int l_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(m);
	}
 
	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(m);
	}

	@Override
	public int deleteMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Member_ImageInsert(Member_Image mi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override

	public int insertMember_Image(Member_Image mi) {
		return mDAO.insertMember_Image(mi);
	}


	@Override
	public int deleteMember_Image(Member_Image mi) {
		// TODO Auto-generated method stub
		return 0;
	}


	public int checkId(String id) {
		return mDAO.checkId(id);
	}

	@Override
	public int checkNick(String nick) {
		return mDAO.checkNick(nick);
	}

	@Override
	public int checkPhone(Member m) {
		return mDAO.checkPhone(m);
	}
	
	@Override
	public int checkPhone2(Member m) {
		return mDAO.checkPhone2(m);
	}

	@Override
	public int checkEmail(Member m) {
		return mDAO.checkEmail(m);
	}

	@Override
	public int checkEmail2(Member m) {
		return mDAO.checkEmail2(m);
	}
	
	@Override
	public int checkEmailo(String m_email) {
		return mDAO.checkEmailo(m_email);
	}
	
	@Override
	public String checkPw(String id) {
		return mDAO.checkPw(id);
	}

	@Override
	public Member findMember(Member m) {
		return mDAO.findMember(m);
	}
	
	@Override
	public int pwChange(Member m) {
		return mDAO.pwChange(m);
	}
	
	@Override
	public Member_Image findMemberImg(String m_id) {
		return mDAO.findMemberImg(m_id);
	}

	@Override
	public ArrayList<Lecture> selectLectureMember(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Product> selectItemMember(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectLectureCount(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Lecture> selectNoPayLecture(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectNoPayLectureCount(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member selectMember(Member m) {
		// TODO Auto-generated method stub
		return null;
	}
}
