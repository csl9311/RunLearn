package com.kh.runLearn.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.PageInfo;
import com.kh.runLearn.common.Pagination;
import com.kh.runLearn.product.model.service.ProductService;
import com.kh.runLearn.product.model.vo.Product;
import com.kh.runLearn.product.model.vo.Product_Image;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

	@RequestMapping("getList.product")
	public String getProductList(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "p_category", required = false) String p_category, HttpServletRequest request)
			throws Exception {
		ArrayList<Product> list = null;
		PageInfo pi;
		int listCount;
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		System.out.println(p_category);
		if (p_category == null) {
			listCount = pService.getListCount();
			pi = Pagination.getPageInfo(currentPage, listCount);
			// 상품목록 조회
			list = pService.selectProductList(pi);
		} else {
			listCount = pService.getListCount(p_category);
			pi = Pagination.getPageInfo(currentPage, listCount);
			// 카테고리별 상품목록 조회
			list = pService.selectProductList(pi, p_category);
		}
		// request에 페이지정보, list 등록
		if (list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}
		return "product/product_main";
	}

	@RequestMapping("get.product")
	public String getProduct(@RequestParam("p_num") int p_num, HttpServletRequest request) {
		Product p = pService.selectProduct(p_num);
		ArrayList<Product_Image> pi = pService.selectProductImg(p_num);
		
		request.setAttribute("p", p);
		request.setAttribute("pi", pi);
		
		System.out.println(p);
		System.out.println(pi);
		return "product/product_detail";
	}
	
	@RequestMapping("upload.product")
	public String uploadPage() {
		return "product/product_upload";
	}
	
	@RequestMapping("insert.product")
	public String uploadProduct(
			ModelAndView mv,
			@ModelAttribute Product p,
			@RequestParam(value = "m_id", required = false) String m_id,
			@RequestParam(value = "pi_thumbnail", required = false) MultipartFile pi_thumbnail,
			@RequestParam(value = "pi_detail", required = false) MultipartFile pi_detail
			) {
		System.out.println(p);
		System.out.println(m_id);
		System.out.println(pi_thumbnail);
		System.out.println(pi_detail);
		
		return "";
	}
}
