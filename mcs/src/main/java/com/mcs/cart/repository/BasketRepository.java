package com.mcs.cart.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mcs.cart.domain.Basket;
import com.mcs.cart.domain.Cart;
import com.mcs.product.domin.Product;

public interface BasketRepository extends JpaRepository<Basket, Integer>{
	
//	Basket findByCartAndProduct(Integer cartid, Integer pronum);
	Basket findByCartAndProduct(Cart cart, Product product);
	
	void deleteByBasketid(Integer basketid);

	void deleteByBasketid(Basket basket);

	

	
}
