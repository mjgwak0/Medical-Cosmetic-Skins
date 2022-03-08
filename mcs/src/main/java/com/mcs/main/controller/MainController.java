package com.mcs.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.mcs.member.domain.Member;

@Controller
public class MainController {

//	@RequestMapping("/")
//	public String main() {
//		System.out.println("/ 요청입니다.");
//		return "main";
//	}
//	
//	@RequestMapping("/main")    // 이 주소로 접속하면 이 메소드를 호출한다.(매핑한다.)
//	public String main( Member member, Model model ){
//		model.addAttribute("member",member);
//		System.out.println("/main 요청");
//		return "main";
//	}
//	
//	@GetMapping("/logout")
//	public String logout(SessionStatus status) {
//		status.setComplete();
//		return "redirect:/";		
//	}
	
}
