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
	public int leaveUserCount() {//탈퇴회원
		return aDAO.leaveUserCount();
	}
	@Override
	public int adminUserCount() {//관리자
		return aDAO.adminUserCount();
	}
	@Override
	public int targetUserUpdate(Member m) {//타겟 회원 정보수정
		System.out.println("pl"+ m);
		return aDAO.targetUserUpdate(m);
	}
	
@Override
public ArrayList<Member> allUserList(PageInfo pi) {
	return aDAO.allUserList(pi);
}

@Override
public ArrayList<Board> boardList(PageInfo pi) {
	return aDAO.boardList(pi);
}
@Override
public int boardListCount() {//전체 보드 수 가져오기
	return aDAO.boardListCount();
}
@Override
public int boardListCountNot() {//전체 보드 수 가져오기
	return aDAO.boardListCountNot();
}
@Override
public int boardListCountQe() {//전체 보드 수 가져오기
	return aDAO.boardListCountQe();
}
@Override
public int boardListCountSug() {//전체 보드 수 가져오기
	return aDAO.boardListCountSug();
}
@Override
public int boardListCountDecl() {//전체 보드 수 가져오기
	return aDAO.boardListCountDecl();
}
	
	@Override
	public int boardListCountA() {// 보드 튜터 신청 수
		// TODO Auto-generated method stub
		return aDAO.boardListCountA();
	}
	
	@Override
	public ArrayList<Board> boardListA(PageInfo blc) {
		// TODO Auto-generated method stub
		return aDAO.boardListA(blc);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
