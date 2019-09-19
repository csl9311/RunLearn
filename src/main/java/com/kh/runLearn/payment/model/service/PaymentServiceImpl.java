package com.kh.runLearn.payment.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Wishlist;
import com.kh.runLearn.payment.model.dao.PaymentDAO;
import com.kh.runLearn.payment.model.vo.Payment;
import com.kh.runLearn.product.model.vo.Cart;

@Service("payService")
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO payDAO;

	@Override
	public Payment selectPayInfo(PageInfo pi, int pay_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Cart> getCart(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Wishlist> getWishList(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Payment> selectPersonalPayList(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Payment> selectLecturePayList(int l_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPayment(Payment pay) {
		return payDAO.insertPayment(pay);
	}

	@Override
	public int updatePayment(Payment pay) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProductPayment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLecturePayment(int l_num) {
		return payDAO.insertLecturePayment(l_num);
	}

	
	
}
