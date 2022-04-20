package com.mcs.member.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.mcs.member.domain.EmailCheckReqDto;
import com.mcs.member.domain.Member;
import com.mcs.member.domain.MemberDto;

public interface MemberService extends UserDetailsService {

	//0.회원리스트 확인용(주소창에 맵핑만 입력시 정보출력됨)
	List<Member> findAll();

	//2.로그인
	UserDetails loadUserByUsername(String userid);
	
	//3.회원가입(submit버튼)
	boolean signup(Member member);
	//3.회원가입(아이디 중복체크)
	int idCheck(String id);

	//4.수정하기
	void updateMember(Member member, String code);

	//5.이메일인증
	Member emailCheck(EmailCheckReqDto dto);
	void emailUpdate(EmailCheckReqDto dto);
	void join(MemberDto dto);

	//6.비번찾기
	Member findUserid(String userid);
	Member findEmail(String email);
	
	
	
	Member memberEmailCheck(String email, String userid);


//	Boolean findpw(String userid, String email);


}