package com.kh.runLearn.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.runLearn.payment.model.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService payService;

}
