package com.kh.runLearn.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runLearn.common.model.service.SearchService;
import com.kh.runLearn.lecture.model.vo.Lecture;
import com.kh.runLearn.product.model.vo.Product;

@Controller
public class SearchController {
	
	@Autowired
	SearchService sService;
	
	// 강의+상품 포함한 전체 검색
	@RequestMapping("search.do")
	public ModelAndView search(@RequestParam("search") String search, @RequestParam("price") String price, ModelAndView mv) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("subcate", null);
		
		String p = priceCheck(price);
		map.put("price", p);
		
		ArrayList lList= sService.selectLecture(map);
		
		ArrayList pList = sService.selectProduct(map);
		
		mv.addObject("lList", lList);
		mv.addObject("pList", pList);
		mv.addObject("search", search);
		mv.addObject("price", price);
		mv.setViewName("search/searchView");
		
		return mv;
	}
	
	// 강의/상품 전체 검색
	@RequestMapping("searchAll.do")
	public ModelAndView productSearchAll(ModelAndView mv, @RequestParam("search") String search, @RequestParam("cate") String cate,
															@RequestParam("price") String price) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("subcate", null);
		
		String p = priceCheck(price);
		map.put("price", p);
		
		ArrayList<HashMap<String, String>> list = null;
		
		if (cate.equals("강의")) {
			list = sService.selectLecture(map);
			
			mv.addObject("cate", "강의");
		} else if (cate.equals("상품")) {
			list = sService.selectProduct(map);
			
			mv.addObject("cate", "상품");
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("price", price);
		mv.setViewName("search/searchDetailView");
		
		return mv;
	}
	
	// 강의/상품 카테고리 검색
	@RequestMapping("searchCate.do")
	public ModelAndView lectureSearchCate(ModelAndView mv, @RequestParam("search") String search, @RequestParam("cate") String cate, 
											@RequestParam("subcate") String subcate, @RequestParam("price") String price) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("subcate", subcate);
		
		String p = priceCheck(price);
		map.put("price", p);
		
		ArrayList<HashMap<String, String>> list = null;
		
		if (cate.equals("강의")) {
			list = sService.selectLecture(map);
			
			mv.addObject("cate", "강의");
		} else if (cate.equals("상품")) {
			list = sService.selectProduct(map);
			
			mv.addObject("cate", "상품");
		}
		
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("subcate", subcate);
		mv.addObject("price", price);
		mv.setViewName("search/searchDetailView");
		
		return mv;
	}
	
	private String priceCheck(String price) {
		String p = null;
        
		switch (price) {
		case "전체":
			p = null;
			break;
		case "무료":
			p = "0";
			break;
		case "1만원 미만":
			p = "1";
			break;
		case "1만원 ~ 2만원":
			p = "2";
			break;
		case "2만원 ~ 3만원":
			p = "3";
			break;
		case "3만원 초과":
			p = "4";
			break;
		}
		
		return p;
	}
}
