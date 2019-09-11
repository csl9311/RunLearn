package com.kh.runLearn.payment.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.payment.model.service.PaymentService;
import com.kh.runLearn.product.model.vo.Product;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService payService;
	
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
	
// 결제 정보 저장
	@RequestMapping("payment.save")
	public void paymentSave(
			@RequestParam("p_num") String p_num,
			@RequestParam("p_name") String p_name,
			@RequestParam("m_name") String m_name,
			@RequestParam("m_phone") String m_phone,
			@RequestParam("m_email") String m_email,
			@RequestParam("postnum") String postnum,
			@RequestParam("total") String total
			) {
		System.out.println(p_num);
		System.out.println(p_name);
		System.out.println(m_name);
		System.out.println(m_phone);
		System.out.println(m_email);
		System.out.println(postnum);
		System.out.println(total);
	}
}
