package com.mcs.order.service;

import java.util.List;

import com.mcs.company.domain.Company;
import com.mcs.order.domain.Deli;
import com.mcs.order.domain.Order;
import com.mcs.order.domain.OrderDetail;
import com.mcs.product.domin.Product;

public interface OrderService {

	void saveOrder(Order order);

	void saveOrderDetail(OrderDetail orderDetail);

	void orderCancel(Integer detailnum);

	void orderRefund(Integer detailnum);

	//기업 주문리스트
	List<OrderDetail> findByProduct(String comp);

	//주문상세리스트
	List<OrderDetail> findByOrder(Order order);

	
	
	void findById(Integer detailnum, int result);


	void saveDeli(Deli deli, List<Integer> detailnum, String state);

	Order findOrdernum(String ordernum);

	
	
}
