package com.mcs.cart.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import com.mcs.member.domain.Member;

import lombok.Data;
@Entity
@Data
public class Cart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "c_seq")
    @SequenceGenerator(sequenceName = "cart_seq", allocationSize = 1, name = "c_seq")
	private Integer cartid; //장바구니번호
	
//	private int count;
	
    @OneToOne
    @JoinColumn(name="userid")
    private Member member;
    
    
    

//    @DateTimeFormat(pattern = "yyyy-mm-dd")
//    private LocalDate createDate;
//    
//    @PrePersist
//    public void createDate() { 
//    	this.createDate = LocalDate.now();
//    }
    
    public static Cart basket(Member member) {
		Cart cart = new Cart();
		cart.member = member;    	
    	return cart;
    	
    }    
		
	
}
