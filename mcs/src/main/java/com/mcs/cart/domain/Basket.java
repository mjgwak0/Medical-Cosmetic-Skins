package com.mcs.cart.domain;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.format.annotation.DateTimeFormat;

import com.mcs.member.domain.Member;
import com.mcs.product.domin.Product;

import lombok.Data;



@Data
@Entity
public class Basket {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "bs_seq")
    @SequenceGenerator(sequenceName = "basket_seq", allocationSize = 1, name = "bs_seq")
	private Integer basketid; //장바구니제품번호 pk
	
    private int count; //제품수량
    
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private LocalDate basketdate; //생성일자
   
    @ManyToOne
    @JoinColumn(name="cartid")
    private Cart cart;
    
    @ManyToOne
    @JoinColumn(name="pronum")
    private Product product;
    
    @PrePersist
    public void basketDate() {
    	this.basketdate = LocalDate.now();
    }
    	
    public static Basket createCartItem(Cart cart, Product product, int count){
    	Basket basket = new Basket();
    	basket.setCart(cart);
    	basket.setProduct(product);
    	basket.setCount(count);
    	
    	return basket;
    	
       }
    
    public void addCount(int count) {
    	this.count += count;
    }
	
    

}
