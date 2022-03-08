package com.mcs.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mcs.member.domain.Member;
import com.mcs.member.service.MemberService;

@SessionAttributes("member")
@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	
//	@GetMapping("/member/login")
//	public void loginView() {
//	}
//	
//	@RequestMapping("/member/logintest")    // 이 주소로 접속하면 이 메소드를 호출한다.(매핑한다.)
//	public String listMembers(@ModelAttribute("member") Member member, Model model){
//		model.addAttribute("member",member);
//		return "/member/logintest";
//	}
//	
//	@PostMapping("/member/login")
//	public String login(Member member, Model model) {
//		Member findMember = memberService.loginCheck(member);
//
//		if (findMember != null && findMember.getMember_pw().equals(member.getMember_pw())) {
//			model.addAttribute("member", findMember);
//			return "redirect:/main";
//		} else {
//			return "redirect:/member/login";
//		}
//	}
}
