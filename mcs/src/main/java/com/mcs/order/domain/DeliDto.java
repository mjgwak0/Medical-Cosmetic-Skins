package com.mcs.order.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.Data;

@Data
public class DeliDto {
	
	private Integer shipnum;
	private String ship_comp[];
	private String waybill[];
	private Integer detailnum[];
	
//	@OneToOne
//	@JoinColumn(name = "detailnum")
//	private OrderDetail orderdetail;

}
