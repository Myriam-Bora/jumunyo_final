package com.finalp.jumunyo.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		if(session == null) {
			response.sendRedirect("/jumunyo/login");
			return false;
		}
		if(session.getAttribute("auth") == null) {
			response.sendRedirect("/jumunyo/login");
			return false;
		}
		return true;
	}

}
