package com.kh.runLearn.payment.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.runLearn.common.Exception;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.payment.model.service.PaymentService;
import com.kh.runLearn.payment.model.vo.Payment;
import com.kh.runLearn.payment.model.vo.Product_Pay;
import com.kh.runLearn.product.model.vo.Product;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService payService;

// 상품 결제
	@RequestMapping("product.pay")
	public String productPay(@ModelAttribute Product p, @ModelAttribute Member m,
			@RequestParam(value = "amount", required = false) String amount, @RequestParam("total") String total,
			HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p", p);
		map.put("m", m);
		map.put("amount", amount);
		map.put("total", total);
		System.out.println(p);
		System.out.println(m);
		System.out.println(amount);
		System.out.println(total);
		request.setAttribute("map", map);
		return "product/product_payment";
	}

// 결제 정보 저장
	@RequestMapping("payment.save")
	public String paymentSave(
			@RequestParam("p_num") String p_num,
			@RequestParam("m_id") String m_id,
			@RequestParam("m_name") String m_name,
			@RequestParam("m_email") String m_email,
			@RequestParam("m_phone") String m_phone,
			@RequestParam("postnum") String postnum,
			@RequestParam("amount") String amount,
			@RequestParam("pay_method") String pay_method,
			@RequestParam("total") String total
			) throws Exception {
		Payment pay = new Payment();
		pay.setPay_method(pay_method);
		pay.setPay_target("p");
		pay.setM_id(m_id);
		System.out.println(pay);

		Product_Pay pp = new Product_Pay();
		pp.setP_num(Integer.parseInt(p_num));
		pp.setPay_total(Integer.parseInt(total));
		pp.setP_pay_amount(Integer.parseInt(amount));
		System.out.println(pp);

		Member m = new Member();
		m.setM_name(m_name);
		m.setM_phone(m_phone);
		m.setM_email(m_email);
		m.setPostnum(postnum);
		System.out.println(m);

		HashMap<String, Object> map = new HashMap<>();
		map.put("pay", pay);
		map.put("pp", pp);
		map.put("m", m);
		int result = payService.insertProductPayment(map);
		if (result > 0) {
			return "redirect:"; // 마이페이지 결제정보
		} else {
			throw new Exception("결제정보등록에 실패했습니다.");
		}
	}
}
