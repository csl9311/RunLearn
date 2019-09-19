package com.kh.runLearn.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.Exception;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.payment.model.service.PaymentService;
import com.kh.runLearn.payment.model.vo.Payment;
import com.kh.runLearn.payment.model.vo.Product_Pay;
import com.kh.runLearn.product.model.vo.Product;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService payService;
	
	@Autowired
	private LectureService lService;
	
// 상품 결제
	@RequestMapping("product.pay")
	public String productPay(
			@ModelAttribute Product p,
			@ModelAttribute Member m,
			@RequestParam(value = "amount", required = false) String amount,
			@RequestParam("total") String total,
			HttpServletRequest request
		) {
		System.out.println(m);
		HashMap<String, Object> map = new HashMap<>();
		map.put("p", p);
		map.put("m", m);
		map.put("amount", amount);
		map.put("total", total);
		request.setAttribute("map", map);
		return "product/product_payment";
	}
	
	@RequestMapping("lecture.pay")
	public ModelAndView lecturePay(
			@RequestParam("l_num") int l_num,
			@ModelAttribute Product p,
			ModelAndView mv,
			HttpServletRequest request,
			HttpSession session
		) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		HashMap<String, String> list = lService.selectLecture(l_num);
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(list);
		System.out.println(loginUser);
		mv.addObject("list", list);
		mv.addObject("m", loginUser);
		mv.setViewName("lecture/lecturePayment");
		return mv;
	}
	
// 결제 정보 저장
	@RequestMapping("payment.save")
	public int paymentSave(
			@RequestParam("p_num") String p_num,
			@RequestParam("m_id") String m_id,
			@RequestParam("m_name") String m_name,
			@RequestParam("m_email") String m_email,
			@RequestParam("m_phone") String m_phone,
			@RequestParam("postnum") String postnum,
			@RequestParam("amount") String amount,
			@RequestParam("pay_method") String pay_method,
			@RequestParam("total") String total
			) {
		Payment pay = new Payment();
		pay.setPay_method(pay_method);
		pay.setPay_target("p");
		pay.setM_id(m_id);
		Product_Pay pp = new Product_Pay();
		pp.setP_num(Integer.parseInt(p_num));
		pp.setPay_total(Integer.parseInt(total));
		pp.setP_pay_amount(Integer.parseInt(amount));
		
		Member m = new Member();
		m.setM_name(m_name);
		m.setM_phone(m_phone);
		m.setM_email(m_email);
		m.setPostnum(postnum);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pay", pay);
		map.put("pp", pp);
		map.put("m", m);
		int result = payService.insertProductPayment(map);
		return result;
	}
	@RequestMapping("lecturePayment.save")
	public ModelAndView paymentSave(
			@RequestParam("l_num") int l_num,
			@RequestParam("pay_method") String pay_method,
			@RequestParam("m_id") String m_id,
			HttpSession session, ModelAndView mv
			) {
		
		Payment pay = new Payment();
		pay.setPay_method(pay_method);
		pay.setPay_target("l");
		pay.setM_id(m_id);
		payService.insertPayment(pay);
		System.out.println(pay);
		
		int result = payService.insertLecturePayment(l_num);
		if(result>0) {
			mv.addObject("l_num", l_num);
			mv.setViewName("redirect:lectureDetailView.le");
			return mv;
		} else {
			throw new Exception("결제 실패.");
		}
	}
	
	@RequestMapping("lecturePaymentFail.save")
	public ModelAndView paymentFail(@RequestParam("l_num") int l_num, ModelAndView mv) {
		mv.addObject("l_num", l_num);
		mv.setViewName("redirect:lectureDetailView.le");
		return mv;
	}
}
