package com.mcs.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mcs.email.service.EmailService;
import com.mcs.member.domain.Member;
import com.mcs.member.domain.MemberDto;
import com.mcs.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private PasswordEncoder encoder;

	// GetMapping : Controller -> View(JSP) 보여줄때 사용
	// PostMapping : View(JSP) -> Controller로 정보 받아오기 OR 기능사용

	// syso : 데이터 입력 확인용 (나중에 전부 지우기)

	// 0.회원리스트 확인용(주소창에 맵핑만 입력시 정보출력됨)
	@GetMapping("/userm")
	public ResponseEntity<List<Member>> getAllmembers() {
		List<Member> member = memberService.findAll();
		return new ResponseEntity<List<Member>>(member, HttpStatus.OK);
	}

	// 1.회원가입(submit버튼)
	@PostMapping("/signup")
	public String join(@Valid MemberDto dto, Model model) throws Exception {
		dto.setPassword(encoder.encode(dto.getPassword()));
		memberService.join(dto);
		model.addAttribute("principal",dto);
		return "forward:/emailConfirm";
	}

	// 1-1.회원가입(아이디 중복체크)
	@RequestMapping("/idCheck")
	public ResponseEntity idCheck(@ModelAttribute("id") Member member) throws Exception {
		ResponseEntity resEntity = null;
		int flag = memberService.idCheck(member.getUserid());
		resEntity = new ResponseEntity(flag, HttpStatus.OK);
		return resEntity;
	}

	// 1-2.회원가입(이메일 인증)
	@RequestMapping("/emailConfirm")
	public String emailConfirm(@AuthenticationPrincipal Member member, Model model) {
		if (member != null) {
			model.addAttribute("principal", member);
		}
		return "/member/emailConfirm";
	}
	
	// 2.회원정보수정 비밀번호확인 View
	@GetMapping("/pwConfirm")
	public String findidForm(@AuthenticationPrincipal Member mem, Model model) {
		model.addAttribute("member", mem);
		return "/member/pwConfirm";
	}
	
	// 2-1.비밀번호확인
	@PostMapping("/confirmPwd")
	public String findidForm(@AuthenticationPrincipal Member member, @RequestParam("password") String pw) {
		System.out.println(encoder.matches(pw, member.getPassword()));
		if(encoder.matches(pw, member.getPassword())==true) {
			return "redirect:/updateForm";
		}else {
			return "redirect:/pwConfirm";			
		}
	}	
	
	// 2.회원정보수정 View
	@GetMapping("/updateForm")
	public String update(@AuthenticationPrincipal Member member, Model model) {
		model.addAttribute("mem", member);
		return "/member/updateForm";		
	}
	
	// 2-1.회원정보수정
	@PostMapping("/update")
	public String updateMember(@ModelAttribute("member") Member member) {
		member.setPassword(encoder.encode(member.getPassword()));
		memberService.updateMember(member, null);
		return "redirect:/home";
	}

	// 5.패스워드찾기 View
	@GetMapping("/findpwForm")
	public String findpwView() {
		return "/member/findpwForm";
	}
	
	// 5-1.패스워드찾기 (회원정보체크 -> 임시비번메일전송 -> 임시비번DB저장)
	@RequestMapping("/findpw")
	@ResponseBody
	public void findpw(@RequestParam("userid") String _userid, @RequestParam("email") String _email ) {
		try {
			Member member = memberService.findUserid(_userid);
			emailService.sendmailpw(member);
		}catch (Exception e) {
			//회원체크 실패시 오류메세지
		}
	}
	
	// 6.아이디찾기 View
	@GetMapping("/findidForm")
	public String findidView() {
		return "/member/findidForm";
	}
	
	// 6-1.아이디찾기 (가입된이메일확인)
	@RequestMapping("/findid")
	@ResponseBody
	public Member findid(@RequestParam("email") String _email) throws IOException {
		
		try {
			Member member = memberService.findEmail(_email);
			return member;
		}catch (Exception e) {
			//회원체크 실패시 오류메세지
			return null;
		}
	}

}

