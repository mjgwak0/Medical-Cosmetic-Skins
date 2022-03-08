package com.mcs.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mcs.member.domain.Member;
import com.mcs.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private PasswordEncoder encoder;
	

	
	
	@RequestMapping("/memberForm")
	public String main() {
		System.out.println("/ 요청입니다.");
		return "/member/memberForm";
	}
	
	@RequestMapping("signup")    // 이 주소로 접속하면 이 메소드를 호출한다.(매핑한다.)
	public String signup( @ModelAttribute("member") Member member) throws Exception{
		member.setMember_pw(encoder.encode(member.getMember_pw()));
		System.out.println(member.getGender());
		if(memberService.signup(member)) {
			System.out.println("회원가입 실헹");
			return "/";
		}
		else {
			return "/";
		}
	}
//	
//	@ModelAttribute("member")
//	public Member setMember() {
//		return new Member();
//	}
//	
//	@RequestMapping("/member/listMembers")    // 이 주소로 접속하면 이 메소드를 호출한다.(매핑한다.)
//	public String listMembers(@ModelAttribute("member") Member member, Model model){
//		List<Member> memberList = memberService.listMembers(member);
//		model.addAttribute("memberList",memberList);
//		return "/member/listMembers";
//	}
}
