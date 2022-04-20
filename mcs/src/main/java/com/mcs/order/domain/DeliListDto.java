package com.mcs.order.domain;

import java.util.List;

import lombok.Data;

@Data
public class DeliListDto {
	
	private List<OrderDetailDto> orderDetailList;

}
