package com.kh.runLearn.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.product.model.service.ProductService;
import com.kh.runLearn.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

	@RequestMapping("getList.product")
	public ModelAndView getProductList(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam("category") String category, ModelAndView mv) throws Exception {
		System.out.println(category);
		ArrayList<Product> list;
		PageInfo pi;
		int listCount;

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		if (category != null) {
			// 카테고리별
			listCount = pService.getListCount(category);
			pi = Pagination.getPageInfo(currentPage, listCount);
			list = pService.selectProductList(pi, category);
		} else {
			// 전체 목록
			listCount = pService.getListCount();
			pi = Pagination.getPageInfo(currentPage, listCount);
			list = pService.selectProductList(pi);
		}

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("product/boardListView");
		} else {
			throw new Exception("상품 조회에 실패하였습니다");
		}
		return mv;
	}
}
