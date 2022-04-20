package com.mcs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	private static final String SESSION_ID = "sessionId";

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute(SESSION_ID) == null) {
			response.sendRedirect("/loginForm");
			return false;
		}
		
		return true;
	}
}
