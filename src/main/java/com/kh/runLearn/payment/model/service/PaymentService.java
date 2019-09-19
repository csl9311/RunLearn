package com.kh.runLearn.payment.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.lecture.model.vo.Wishlist;
import com.kh.runLearn.payment.model.vo.Payment;
import com.kh.runLearn.product.model.vo.Cart;

public interface PaymentService {
	Payment selectPayInfo(PageInfo pi, int pay_id); // 결제 정보 조회
	ArrayList<Cart> getCart(String id); // 상품 찜목록 정보
	ArrayList<Wishlist> getWishList(String id); // 강의 찜목록 정보
	
	ArrayList<Payment> selectPersonalPayList(String id); // 개인 구매 결제 목록
	ArrayList<Payment> selectLecturePayList(int l_num); // 강의별 결제목록
	
	int insertPayment(Payment pay); // 결제정보등록
	int updatePayment(Payment pay); // 환불 및 결제정보수정
	int insertProductPayment(HashMap<String, Object> map); // 상품결제
	int insertLecturePayment(int l_num);
}
