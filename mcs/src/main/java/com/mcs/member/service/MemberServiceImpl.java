package com.mcs.member.service;

import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.stereotype.Service;

import com.mcs.member.domain.Member;
import com.mcs.member.persistent.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberRepository memberRepo;

	public List<Member> listMembers(Member member) {
		return (List<Member>) memberRepo.findAll();
	}

	@Override
	public Member loginCheck(Member member) {
		Optional<Member> findMember = memberRepo.findById(member.getMember_id());
		if(findMember.isPresent())
			return findMember.get();
		else return null;
	}

	@Override
	public boolean signup(Member member) {
		try {
			memberRepo.save(member);
			System.out.println("성공");
			
		} catch (Exception e) {
			System.out.println("실패");
			return false;
		}
		
		return true;
		
	}



}
