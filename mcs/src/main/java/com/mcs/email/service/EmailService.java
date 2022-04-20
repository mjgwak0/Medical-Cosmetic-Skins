package com.mcs.email.service;

import javax.mail.MessagingException;

import com.mcs.member.domain.Member;

public interface EmailService {
	
	//1.이메일인증 메일전송
	void sendEmail(String email, String string, String string2) throws MessagingException;
	public void sendmailpw(Member member) throws MessagingException;
}
