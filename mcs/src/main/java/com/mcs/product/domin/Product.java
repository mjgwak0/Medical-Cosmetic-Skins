package com.mcs.product.domin;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.Data;

@Entity
@Data
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "p_seq")
    @SequenceGenerator(sequenceName = "product_seq", allocationSize = 1, name = "p_seq")
	private Integer pronum;
	
	private String company;
	private String code;
	private String pro_name;
	private Integer price;
	private Integer sale;
	private Date manufacture; //제조일자
	private Integer inventory; //재고
	private String pro_stock; //용량
	private String expiration; //사용기한
	private String skill; //사용방법
	private String manufacturer; //화장품제조업자
	private String made;
	private String spec; //주의사항
	private String seller;
	private String baumann;
	private String ingredients; //원료정보
	

	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "filenum")
	private Files files;
	
	//주문취소시 취소한 수량만큼 재고추가
	public void addStock(int inventory) {
		this.inventory += inventory;
	}
}
