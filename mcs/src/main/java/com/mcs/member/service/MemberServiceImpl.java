package com.mcs.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.mcs.company.domain.Company;
import com.mcs.company.repository.CompanyRepository;
import com.mcs.member.domain.EmailCheckReqDto;
import com.mcs.member.domain.Member;
import com.mcs.member.domain.MemberDto;
import com.mcs.member.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepo;
	@Autowired
	private CompanyRepository companyRepo;
	
	
	public Member memberEmailCheck(String email, String userid) {

        Member member = memberRepo.findUserByUserid(userid);
        if(member!=null && member.getEmail().equals(email)) {
            return member;
        }
        else {
            return member;
        }
    }
	
	
	

	//0.회원리스트 확인용(주소창에 맵핑만 입력시 정보출력됨)
	public List<Member> findAll(){
		List<Member> member = new ArrayList<>();
		memberRepo.findAll().forEach(e -> member.add(e));;
		return member;
	}
	
	//UserDetailsService 인터페이스 구현
	//2.로그인(submit버튼)
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {	
			if(memberRepo.findByUserid(userid) != null) {
				Member member = memberRepo.findByUserid(userid);	
				return member;									
			}else if(companyRepo.findByCompany(userid) != null){
				Company comp = companyRepo.findByCompany(userid);
				return comp;
			}else {				
				throw new UsernameNotFoundException(userid);
			}
	}
	
	//3.회원가입(submit버튼)
	@Override
	public boolean signup(Member member) {
		try {
			memberRepo.save(member);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	//3.회원가입(아이디 중복체크)
	@Override
	public int idCheck(String id) {
		System.out.println(id);
		Optional<Member> findMember = memberRepo.findById(id);
		if(findMember.isEmpty())
			return 1;
		else return 0;
	}
	
	@Override
	public void updateMember(Member member, String code) {
			memberRepo.save(member);
	}




	@Override
	public Member emailCheck(EmailCheckReqDto dto) {
		Member userEntity = memberRepo.mCheck(dto.getUserid(), dto.getRole());
		return userEntity;
	}




	@Override
	public void emailUpdate(EmailCheckReqDto dto) {
		memberRepo.mUpdate(dto.getUserid());
	}




	@Override
	public void join(MemberDto dto) {
		memberRepo.save(dto.toEntity());
		
	}



	// 회원 정보 찾기 (ID OR EMAIL값으로 찾기)
	@Override
	public Member findUserid(String userid) {
		Member member = memberRepo.findByUserid(userid);
		return member;
	}
	@Override
	public Member findEmail(String email) {
		Member member = memberRepo.findByEmail(email);
		return member;
	}




//	@Override
//	public Boolean findpw(String userid, String email) {
//		try {
//			Member member = memberRepo.findByUserid(userid);
//			if(email.equals(member.getEmail())){
//				emailCon.sendmailpw(member);
//				//임시비번메일전송
//				return true;
//			}else {
//				System.out.println("가입한 아이디와 이메일이 일치하지 않습니다.");
//				return false;
//			}
//		}catch (Exception e) {
//			System.out.println("입력받은 아이디로 가입한 회원이 없습니다.");
//			return false;
//		}
//	}





}