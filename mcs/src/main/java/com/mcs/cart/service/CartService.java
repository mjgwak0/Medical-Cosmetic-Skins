package com.mcs.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mcs.cart.domain.Basket;
import com.mcs.cart.domain.Cart;
import com.mcs.member.domain.Member;
import com.mcs.product.domin.Product;

@Service
	
@Transactional
public interface CartService {

	void addCart(Member member, Product product, int count);

	List<Basket> userCartView(Cart cart);


	Cart findCart(Member member);


	void cartItemDelete(Integer basketid);

	void cartAllDelete(Basket basket);

	
	
	
			
		
//	void cartDelete(Integer basketid);

	
         	 
}
