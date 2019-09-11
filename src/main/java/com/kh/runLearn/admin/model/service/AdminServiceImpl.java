package com.kh.runLearn.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.admin.model.dao.AdminDAO;
import com.kh.runLearn.board.model.dao.BoardDAO;
import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.board.model.vo.Board_Image;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.model.dao.SearchDAO;
import com.kh.runLearn.lecture.model.dao.LectureDAO;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.dao.MemberDAO;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.payment.model.dao.PaymentDAO;
import com.kh.runLearn.payment.model.service.PaymentService;
import com.kh.runLearn.product.model.dao.ProductDAO;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO aDAO;
	@Autowired
	private BoardDAO bDAO;
	@Autowired
	private LectureDAO lDAO;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private PaymentDAO payDAO;
	@Autowired
	private ProductDAO pDAO;
	@Autowired
	private SearchDAO sDAO;

	@Override
	public int allUserCount() {//전체 회원수 조회
		return aDAO.allUserCount();
	}
	@Override
	public int tutorUserCount() {//튜터 회원수 조회
		return aDAO.tutorUserCount();
	}@Override
	public int tuteeUserCount() {//튜티 회원수 조회
		return aDAO.tuteeUserCount();
	}@Override
	public int blackUserCount() {//블랙회원수 조회
		return aDAO.blackUserCount();
	}
	@Override
	public int targetUserUpdate(Member m) {//타겟 회원 정보수정
		System.out.println("pl"+ m);
		return aDAO.targetUserUpdate(m);
	}

	////////////////정렬 시작
	//정렬 내림차순
	@Override
	public ArrayList<Member> allUserList(PageInfo pi) {	//기본 정렬 아이디
		return aDAO.allUserList(pi);
	}
	@Override
	public ArrayList<Member> allUserListId(PageInfo pi) {//아이디 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListNick(PageInfo pi) {//닉네임 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListEm(PageInfo pi) {//이메일 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListPh(PageInfo pi) {//폰정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListMD(PageInfo pi) {//수정일 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListG(PageInfo pi) {//등급 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListS(PageInfo pi) {//상태 정렬
		return null;
	}
	// /정렬내림차순
	//정렬 오름차순
	@Override
	public ArrayList<Member> allUserListR(PageInfo pi) {	//기본 정렬 아이디
		return aDAO.allUserList(pi);
	}
	@Override
	public ArrayList<Member> allUserListIdR(PageInfo pi) {//아이디 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListNickR(PageInfo pi) {//닉네임 정렬
	return null;
	}
	@Override
	public ArrayList<Member> allUserListEmR(PageInfo pi) {//이메일 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListPhR(PageInfo pi) {//폰정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListMDR(PageInfo pi) {//수정일 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListGR(PageInfo pi) {//등급 정렬
		return null;
	}
	@Override
	public ArrayList<Member> allUserListSR(PageInfo pi) {//상태 정렬
		return null;
	}
	// /정렬오름차순
	//////////////////////////정렬끝
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
