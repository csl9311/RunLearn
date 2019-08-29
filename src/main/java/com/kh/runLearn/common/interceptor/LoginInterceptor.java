package com.kh.runLearn.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.runLearn.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			request.setAttribute("msg", "로그인을 하셔야 이용하실 수 있습니다.");
			request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
