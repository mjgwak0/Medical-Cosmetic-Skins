package com.mcs.order.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Refund {
	
	@Id
	private Integer refundnum; //환불번호
	private String detailnum; //FK_ORDER_DETAIL 주문상세번호 
	private String refund_reason; //환불사유
	
}
