package com.mcs.cart.domain;

import lombok.Data;

@Data
public class CartDto {
	
	private Integer basketid; //장바구니 상품 아이디
	
	private String pro_name; //상품명
	
	private Integer price; // 상품가격
	
	private int count; // 개수
	
	private String imgUrl; //상품이미지 경로
	
	public void Cartdto(Integer basketid, String pro_name, Integer price, int count, String imgUrl) {
		
		this.basketid=basketid;
		this.pro_name=pro_name;
		this.price=price;
		this.count=count;
		this.imgUrl=imgUrl;
	}

}
