package com.mcs.member.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mcs.member.domain.Member;
import com.mcs.member.domain.MemberUpdateDto;

public interface MemberRepository extends JpaRepository<Member, String> {
	
	
	//로그인정보 불러오기
	Member findByUserid(String userid);
	Member findByEmail(String email);


	@Query(value = "select * from member where userid = :userid and role = :role", nativeQuery = true)
	Member mCheck(@Param("userid") String userid, @Param("role") String role);
	

	@Modifying
	@Query(value = "update member set role = 'ROLE_USER' where userid = :userid", nativeQuery = true)
	void mUpdate(@Param("userid") String userid);

	//값가져오기테스트
	//userid로 db조회 일치하는 회원 상세정보 가져옴
	Member findUserByUserid(String userid);
	

}
