package com.kh.runLearn.reply.controller;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.runLearn.member.model.vo.Member;
import com.kh.runLearn.reply.model.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	ReplyService rService;

	@RequestMapping("getReplyList.do")
	public void selectReplyList(HttpServletResponse response, @RequestParam("num") int num,
										@RequestParam("type") String type) throws Exception {
		System.out.println("num: " + num);
		System.out.println("l: " + type);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", Integer.parseInt(String.valueOf(num)));
		map.put("type", String.valueOf(type));

		ArrayList<Map<String, Object>> replyList = rService.selectReplyList(map);
		System.out.println("replyList: " + replyList);

		for (Map<String, Object> m : replyList) {
			for (String key : m.keySet()) {
				if (!key.equals("B_NUM") && !key.equals("P_NUM") && !key.equals("L_NUM") && !key.equals("L_EACH_NUM")
						&& !key.equals("R_CREATE_DATE")) {
					m.put(key, URLEncoder.encode(String.valueOf(m.get(key)), "utf-8"));
				}
			}
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(replyList, response.getWriter());

	}

	@ResponseBody
	@RequestMapping("insertReply.do")
	public void insertReply(HttpSession session, @RequestParam("num") int num, @RequestParam("content") String content, @RequestParam("type") String type) {
		System.out.println("---------insertReply---------");
		System.out.println("num: " + num + ", type: " + type);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", (int)num);
		map.put("content", String.valueOf(content));
		map.put("id", ((Member)(session.getAttribute("loginUser"))).getM_id());
		map.put("type", String.valueOf(type));
		
		rService.insertReply(map);
	}
	
	@ResponseBody
	@RequestMapping("deleteReply.do")
	public void deleteReply(@RequestParam("r_num") int r_num) {
		rService.deleteReply(r_num);
	}
}
