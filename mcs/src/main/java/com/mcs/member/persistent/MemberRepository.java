package com.mcs.member.persistent;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.mcs.member.domain.Member;

public interface MemberRepository extends JpaRepository<Member, String> {

}
