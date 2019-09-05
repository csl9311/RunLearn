package com.kh.runLearn;

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

@Controller
public class HomeController {
	
	@Autowired
	LectureService lService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping(value="getNewLectureList.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public void newList(HttpServletResponse response) throws Exception {
		 ArrayList<Map<String, String>> lList = lService.selectNewLectureList();
		 
		 Gson gson = new Gson();
		 response.setCharacterEncoding("UTF-8");
		 gson.toJson(lList, response.getWriter());
	}
	
}
