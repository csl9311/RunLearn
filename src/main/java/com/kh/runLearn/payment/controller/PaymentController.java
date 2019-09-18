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
import com.kh.runLearn.product.model.vo.Product_Option;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService payService;

// 상품 결제
	@RequestMapping("product.pay")
	public String productPay(
			@ModelAttribute Product p,
			@ModelAttribute Member m,
			@RequestParam("amount") String amount,
			@RequestParam("item") String item,
			@RequestParam("pricearr") String pricearr,
			@RequestParam("total") String total,
			HttpServletRequest request
			) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("p", p);
		map.put("m", m);
		map.put("total", total);
		String[] amountArr = amount.split(",");
		String[] itemArr = item.split(",");
		String[] priceArr = pricearr.split(",");
		map.put("amount", amountArr);
		map.put("item", itemArr);
		map.put("price", priceArr);
		request.setAttribute("map", map);
		return "product/product_payment";
	}

// 결제 정보 저장
	@RequestMapping("payment.save")
	public String paymentSave(
			@ModelAttribute Product p,
			@ModelAttribute Member m,
			@ModelAttribute Payment pay,
			@RequestParam("item") String item,
			@RequestParam("amount") String amount,
			@RequestParam("price") String price,
			@RequestParam("total") String total
			) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		pay.setPay_target("p");
		map.put("pay", pay);
		System.out.println(item);
		
		
		
//		String[] itemArr = item.split(",");
		String[] amountArr = amount.split(",");
		int amounts = 0;
		for(int i = 0 ; i < amountArr.length; i++) {
			amounts += Integer.parseInt(amountArr[i]);
		}
//		String[] priceArr = price.split(",");
		
		String delivery = m.getPostnum() + " / " +  m.getR_address() + " / " + m.getD_address();
		String p_option = p.getP_name() + " / " + item;
		Product_Pay pp = new Product_Pay();
		pp.setP_num(p.getP_num());
		pp.setP_pay_amount(amounts);
		pp.setPay_total(Integer.parseInt(total));
		pp.setDelivery(delivery);
		pp.setP_option(p_option);
		map.put("pp", pp);
		
		
		
		int result = payService.insertProductPayment(map);
		if (result > 0) {
			return "redirect:"; // 마이페이지 결제정보
		} else {
			throw new Exception("결제정보등록에 실패했습니다.");
		}
	}
}
