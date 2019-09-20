package com.kh.runLearn.payment.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runLearn.payment.model.vo.Payment;

@Repository("payDAO")
public class PaymentDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertProductPayment(HashMap<String, Object> map) {
		sqlSession.update("paymentMapper.updateProductOption", map);
		return sqlSession.insert("paymentMapper.insertProductPayment", map);
	}

	public int insertPayment(Payment pay) {
		return sqlSession.insert("paymentMapper.insertPayment",pay);
	}

	public int insertLecturePayment(int l_num) {
		return sqlSession.insert("paymentMapper.insertLecturePayment", l_num);
	}
}
