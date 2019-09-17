package com.kh.runLearn.payment.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("payDAO")
public class PaymentDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertProductPayment(HashMap<String, Object> map) {
		return sqlSession.insert("paymentMapper.insertProductPayment", map);
	}
}
