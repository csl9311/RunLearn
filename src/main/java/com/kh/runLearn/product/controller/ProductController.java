package com.kh.runLearn.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.product.model.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService sService;

//	@RequestMapping("psearchAll.do")
//	public ModelAndView productSearchAll(ModelAndView mv, @RequestParam("search") String search) {
//		mv.addObject("search", search);
//		mv.addObject("cate", "상품");
//		mv.setViewName("search/searchDetailView");
//		
//		return mv;
//	}
}
