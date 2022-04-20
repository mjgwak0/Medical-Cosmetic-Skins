package com.mcs.baumann.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mcs.baumann.domain.Skintest;
import com.mcs.member.domain.Member;


public interface BaumannRepository extends JpaRepository<Skintest, Integer>{

	//회원 바우만 타입 조회
	Skintest findByMember(Member member);
	
	// JPA가 지원해주지 않는 쿼리문에 대해 나열
	// Repo. 으로 호출할 수 있는 건 기본 제공하는 기능이고, 변형 기능을 사용하기 위해 생성	
	

}
