package com.mcs.email.controller;

import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mcs.email.service.EmailService;
import com.mcs.member.domain.EmailCheckReqDto;
import com.mcs.member.domain.Member;
import com.mcs.member.service.MemberService;

@Controller
public class EmailController {
	@Autowired
	EmailService service;
	@Autowired
	MemberService memberService;
	
	
	@GetMapping("/findpw")
	public String findpw() {
		return "/member/findpwForm";
	}
	
	//1.이메일인증 메일전송
	@ResponseBody
	@GetMapping("/emailSend")
	public void sendmail(EmailCheckReqDto dto) throws MessagingException {
		
		System.out.println("이메일2 : " + dto.getEmail());
		System.out.println("아이디2 : " + dto.getUserid());

		StringBuffer emailcontent = new StringBuffer();
		
		emailcontent.append("<!DOCTYPE html>");
		emailcontent.append("<html>");
		emailcontent.append("<head>");
		emailcontent.append("</head>");
		emailcontent.append("<body>");
		emailcontent.append(
				" <div>" + 
						dto.getUserid()+
				"		님 안녕하세요.<br />"+ 
				"		아래 메일 인증 버튼을 클릭하여 회원가입을 완료해 주세요.<br />"+ 
				"		감사합니다.<br />"+ 
				"	<a"	+
				"	href=\"http://localhost:8090/emailCheck?userid=" + dto.getUserid() + "&role=" + dto.getRole() + "\" target=\"_blank\">"+ 
				"		<button> 메일 인증 </button>"+ 
				"	</a>"+
				" </div>"
		);
		emailcontent.append("</body>");
		emailcontent.append("</html>");
		
		
		service.sendEmail(dto.getEmail(),"메일 인증",emailcontent.toString());
	}
	
	//2.이메일인증 확인(USER 권한부여)
	@Transactional
	@GetMapping("/emailCheck")
	public String checkmail(EmailCheckReqDto dto) throws MessagingException {
		Member m = memberService.emailCheck(dto);	
		if(m != null) {
			memberService.emailUpdate(dto);
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return "/member/emailSuccess";
	}



}


