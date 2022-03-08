package com.mcs.member.service;

import java.util.List;

import com.mcs.member.domain.Member;

public interface MemberService {

	List<Member> listMembers(Member member);

	Member loginCheck(Member member);
	
	public boolean signup(Member member);

}