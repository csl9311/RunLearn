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
		// TODO Auto-generated method stub
		return aDAO.allUserCount();
	}
	@Override
	public int tutorUserCount() {//튜터 회원수 조회
		// TODO Auto-generated method stub
		return aDAO.tutorUserCount();
	}@Override
	public int tuteeUserCount() {//튜티 회원수 조회
		// TODO Auto-generated method stub
		return aDAO.tuteeUserCount();
	}@Override
	public int blackUserCount() {//블랙회원수 조회
		// TODO Auto-generated method stub
		return aDAO.blackUserCount();
	}
	@Override
	public ArrayList<Member> allUserList(PageInfo pi) {
		
		return aDAO.allUserList(pi);
	}
	@Override
	public int targetUserUpdate(Member m) {
		// TODO Auto-generated method stub
		System.out.println("pl"+ m);
		return aDAO.targetUserUpdate(m);
	}
}
