package com.mcs.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	private String loginId;
	private String loginPw;	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String userid = request.getParameter(loginId);
		String password = request.getParameter(loginPw);
		String errorMsg = null;
		
		if (exception instanceof BadCredentialsException || exception instanceof InternalAuthenticationServiceException) {
			errorMsg = "아이디나 비밀번호가 맞지 않습니다."; // 비밀번호를 잘못 입력했습니다.
		} else if (exception instanceof SessionAuthenticationException) {
			errorMsg = "현재 로그인중인 계정입니다."; // 중복 로그인
		} else {
			errorMsg = "알수 없는 이유로 로그인에 실패하였습니다. 관리자에게 문의전화 하세요.";
		}
		
		request.setAttribute("errorMsg", errorMsg);
		request.getRequestDispatcher("/loginForm").forward(request, response);
		
	}

}
