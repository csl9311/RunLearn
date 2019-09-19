package com.kh.runLearn.payment.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.payment.model.dao.PaymentDAO;

@Service("payService")
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO payDAO;

	@Override
  public int insertProductPayment(HashMap<String, Object> map) {
		return payDAO.insertProductPayment(map);
	}

	@Override
	public int insertLecturePayment(int l_num) {
		return payDAO.insertLecturePayment(l_num);
	}

	
	
	

}
