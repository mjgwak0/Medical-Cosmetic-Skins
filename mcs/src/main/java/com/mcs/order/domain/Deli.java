package com.mcs.order.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import lombok.Data;

@Data
@Entity
public class Deli {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ship_seq")
    @SequenceGenerator(sequenceName = "shipnum_seq", allocationSize = 1, name = "ship_seq")
	private Integer shipnum;
	private String ship_comp;
	private String waybill;
	
	
	
	
	
	
	
	@OneToOne
	@JoinColumn(name = "detailnum")
	private OrderDetail orderdetail;

}
