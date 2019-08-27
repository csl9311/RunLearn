package com.kh.runLearn.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.runLearn.product.model.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

}
