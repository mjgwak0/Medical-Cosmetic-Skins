package com.mcs.cart.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.mcs.cart.domain.Cart;
import com.mcs.member.domain.Member;

public interface CartRepository extends JpaRepository<Cart, Integer> {
	
	Cart findByMember(Member member);
      
}
