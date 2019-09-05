package com.kh.runLearn.admin.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.board.model.dao.BoardDAO;
import com.kh.runLearn.board.model.vo.Board;
import com.kh.runLearn.board.model.vo.Board_Image;
import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.model.dao.SearchDAO;
import com.kh.runLearn.lecture.model.dao.LectureDAO;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.member.model.dao.MemberDAO;
import com.kh.runLearn.payment.model.dao.PaymentDAO;
import com.kh.runLearn.payment.model.service.PaymentService;
import com.kh.runLearn.product.model.dao.ProductDAO;

@Service("aService")
public class AdminServiceImpl implements AdminService {

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


	
}
