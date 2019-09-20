package com.kh.runLearn.payment.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.Exception;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.lecture.model.vo.Wishlist;
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
			@RequestParam("amount") String amount,
			@RequestParam("item") String item,
			@RequestParam("pricearr") String pricearr,
			@RequestParam("total") String total,
			HttpServletRequest request) {
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
		) {
		HashMap<String, Object> map = new HashMap<>();
		pay.setPay_target("p");
		map.put("pay", pay);

//		String[] itemArr = item.split(",");
		String[] amountArr = amount.split(",");
		int amounts = 0;
		for (int i = 0; i < amountArr.length; i++) {
			amounts += Integer.parseInt(amountArr[i]);
		}
//		String[] priceArr = price.split(",");

		String delivery = m.getPostnum() + " / " + m.getR_address() + " / " + m.getD_address();
		Product_Pay pp = new Product_Pay();
		pp.setP_num(p.getP_num());
		pp.setP_pay_amount(amounts);
		pp.setPay_total(Integer.parseInt(total));
		pp.setDelivery(delivery);
		pp.setP_option(item);
		map.put("pp", pp);
		int result = payService.insertProductPayment(map);
		if (result > 0) {
			return "redirect:mypage.do?cate=productPay"; // 마이페이지 결제정보
		} else {
			throw new Exception("결제정보등록에 실패했습니다.");
		}
	}

	@RequestMapping("lecture.pay")
	public ModelAndView lecturePay(
			@RequestParam("l_num") int l_num,
			@ModelAttribute Product p,
			ModelAndView mv,
			HttpSession session
			) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		HashMap<String, String> list = lService.selectLecture(l_num);
		mv.addObject("list", list);
		mv.addObject("m", loginUser);
		mv.setViewName("lecture/lecturePayment");
		return mv;
	}

	@RequestMapping("lecturePayment.save")
	public ModelAndView paymentSave(
			@RequestParam("l_num") int l_num,
			@RequestParam("pay_method") String pay_method,
			@RequestParam("m_id") String m_id,
			HttpSession session, ModelAndView mv
		) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		Payment pay = new Payment();
		pay.setPay_method(pay_method);
		pay.setPay_target("l");
		pay.setM_id(m_id);
		payService.insertPayment(pay);

		HashMap<String, Object> wish = new HashMap<>();
		wish.put("l_num", l_num);
		wish.put("m_id", loginUser.getM_id());
		Wishlist w_list = lService.selectWishList(wish);
		if (w_list.getL_num() == l_num && m_id.equals(loginUser.getM_id())) {
			lService.deleteWishlist(wish);
		}

		if (w_list != null) {
			mv.addObject("w_list", w_list);
		}
		int result = payService.insertLecturePayment(l_num);
		if (result > 0) {
			mv.addObject("l_num", l_num);
			mv.setViewName("redirect:lectureDetailView.le");
			return mv;
		} else {
			throw new Exception("결제 실패.");
		}
	}

	@RequestMapping("lecturePaymentFail.save")
	public ModelAndView paymentFail(
			@RequestParam("l_num") int l_num,
			ModelAndView mv
			) {
		mv.addObject("l_num", l_num);
		mv.setViewName("redirect:lectureDetailView.le");
		return mv;
	}
}
