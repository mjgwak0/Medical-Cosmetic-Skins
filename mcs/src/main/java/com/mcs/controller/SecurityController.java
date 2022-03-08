package com.mcs.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SecurityController {

	@GetMapping("/")
	public String index() {
		System.out.println("메인페이지 요청 /");
		return "/main";
	}
	
//	@GetMapping("/mypage")
//	public void forMember() {
//		System.out.println("Member 요청입니다.");
//	}
//	
//	@GetMapping("/manager")
//	public void forManager() {
//		System.out.println("Manager 요청입니다.");
//	}
//	
//	@GetMapping("/admin")
//	public void forAdmin() {
//		System.out.println("Admin 요청입니다.");
//	}
	
	@GetMapping("/member/login")
	public void login() {
		System.out.println("로그인페이지 요청 /member/login");
	}
	
	@GetMapping("/loginSuccess")
	public void loginSuccess(Principal principal) {
		 System.out.println("로그인성공페이지 요청 /loginSuccess");
	}
}
