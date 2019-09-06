package com.kh.runLearn;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.kh.runLearn.lecture.model.service.LectureService;
import com.kh.runLearn.product.model.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	LectureService lService;
	
	@Autowired
	ProductService pService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping(value="getNewLectureList.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public void newLectureList(HttpServletResponse response) throws Exception {
		 ArrayList<Map<String, String>> lList = lService.selectNewLectureList();
		 
		 for (Map<String, String> map : lList) {
			for (String key : map.keySet()) {
				if (!key.equals("L_NUM") && !key.equals("L_PRICE") && !key.equals("L_SYSTEM")) {
					map.put(key, URLEncoder.encode(String.valueOf(map.get(key)) ,"utf-8"));
				}
			}
		}
		 
		 Gson gson = new Gson();
		 gson.toJson(lList, response.getWriter());
	}
	
	@RequestMapping("getNewProductList.do")
	public void newProductList(HttpServletResponse response) throws Exception {
		ArrayList<Map<String, String>> pList = pService.selectNewProductList();
		
		for (Map<String, String> map : pList) {
			for (String key : map.keySet()) {
				if (!key.equals("P_NUM") && !key.equals("L_PRICE") && !key.equals("L_SYSTEM")) {
					map.put(key, URLEncoder.encode(String.valueOf(map.get(key)) ,"utf-8"));
				}
			}
		}
		
		Gson gson = new Gson();
		gson.toJson(pList, response.getWriter());
	}
}
