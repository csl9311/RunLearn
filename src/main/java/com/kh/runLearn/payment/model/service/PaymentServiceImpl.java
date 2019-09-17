package com.kh.runLearn.payment.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.lecture.model.vo.Wishlist;
import com.kh.runLearn.payment.model.dao.PaymentDAO;
import com.kh.runLearn.payment.model.vo.Payment;
import com.kh.runLearn.product.model.vo.Cart;

@Service("payService")
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO payDAO;

}
