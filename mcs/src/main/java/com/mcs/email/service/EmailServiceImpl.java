package com.mcs.email.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mcs.member.domain.Member;
import com.mcs.member.service.MemberService;

@Service
public class EmailServiceImpl implements EmailService{
 
    @Autowired
    JavaMailSender emailSender;
    @Autowired
    MemberService memberService;
    @Autowired
	PasswordEncoder encoder;
    
    
    //1.이메일인증 메일전송
    @Autowired
    private static final String FROM_ADDRESS = "27minsub@gmail.com";

    public void sendEmail(String to, String subject, String text) throws MessagingException {
    	MimeMessage mimeMessage = emailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
    	
    	helper.setFrom(FROM_ADDRESS);
    	helper.setTo(to); 
    	helper.setSubject(subject); 
    	
    	//setText의 경우 true옵션을 추가할 경우 메일을 보낼때 html문법이 적용
    	helper.setText(text, true);    	
    	
        emailSender.send(mimeMessage);
    }
    
 
	//2.이메일인증 메일전송
	@ResponseBody
	@GetMapping("/emailSendPw")
	public void sendmailpw(Member member) throws MessagingException {
		
		System.out.println("이메일2 : " + member.getEmail());
		System.out.println("아이디2 : " + member.getUserid());

		StringBuffer emailcontent = new StringBuffer();
		String code = getAuthCode();
		
		
		emailcontent.append("<!DOCTYPE html>");
		emailcontent.append("<html>");
		emailcontent.append("<head>");
		emailcontent.append("</head>");
		emailcontent.append("<body>");
		emailcontent.append(
				" <div>" + 
						member.getUserid()+
				"		님 안녕하세요.<br />"+ 
				"		아래 발급받은 임시 비밀번호로 로그인을 진행해주세요.<br />"+ code +
				"		감사합니다.<br />"+ 
				
				"	</a>"+
				" </div>"
		);
		emailcontent.append("</body>");
		emailcontent.append("</html>");
		
		member.setPassword(code);
		member.setPassword(encoder.encode(member.getPassword()));
		memberService.updateMember(member, code);
		sendEmail(member.getEmail(), "임시비밀번호", emailcontent.toString());
		
	}
    
	public String getAuthCode() {
		Random random = new Random();
		int code = random.nextInt(999999)+100000;
		return toString().valueOf(code);
	}
	
    
}

