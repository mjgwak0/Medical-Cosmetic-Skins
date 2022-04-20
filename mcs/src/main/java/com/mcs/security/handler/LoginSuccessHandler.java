package com.mcs.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
//	public LoginSuccessHandler(String defaultTargetUrl) {
//		setDefaultTargetUrl(defaultTargetUrl);
//	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
//		HttpSession session = request.getSession();
//		if (session != null) {
//			String redirectUrl = (String) session.getAttribute("prevPage");
//			if (redirectUrl != null) {
//				session.removeAttribute("prevPage");
//				getRedirectStrategy().sendRedirect(request, response, redirectUrl);
//			}
//		}
		
		String url = "";
		
		switch(authentication.getAuthorities().toString()) {
			case "[ROLE_ADMIN]":
				url="/";
				break;
				
			case "[ROLE_USER]":
				url="/home";
				break;
				
			case "[ROLE_MANAGER]":
				url="/company/ProductList";
				break;
				
			case "[ROLE_GUEST]":
				url="/home";
				break;
		}
		
		response.sendRedirect(url);
		
	}

}
