package com.mcs.order.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mcs.order.domain.Deli;
import com.mcs.order.domain.Order;
import com.mcs.order.domain.OrderDetail;
import com.mcs.order.repository.DeliRepository;
import com.mcs.order.repository.OrderDetailRepository;
import com.mcs.order.repository.OrderRepository;
import com.mcs.order.repository.RefundRepository;
import com.mcs.product.domin.Product;
import com.mcs.product.repository.ProductRepository;

import lombok.RequiredArgsConstructor;

@Transactional
@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderRepository orderInfoRepo;
	@Autowired
	private OrderDetailRepository orderDetailRepo;
	@Autowired
	private RefundRepository refundRepo;
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private DeliRepository deliRepo;

	
	// 주문정보 저장
	@Override
	public void saveOrder(Order order) {
		orderInfoRepo.save(order);
		
	}

	// 주문상세정보 저장
	@Override
	public void saveOrderDetail(OrderDetail orderDetail) {
		orderDetailRepo.save(orderDetail);
		
	}

	// 주문취소
	@Override
	public void orderCancel(Integer detailnum) {
		OrderDetail orderDetail = orderDetailRepo.findByDetailnum(detailnum);
		orderDetail.cancelOrder();
	}

	@Override
	public void orderRefund(Integer detailnum) {
		OrderDetail orderDetail = orderDetailRepo.findByDetailnum(detailnum);
		orderDetail.refundOrder();
		
	}

	//기업 주문리스트
	@Override
	public List<OrderDetail> findByProduct(String comp) {
		List<Product> productList = productRepo.findByCompany(comp);
		ArrayList<OrderDetail> orderDetailList = new ArrayList<>();
		Collections.sort(orderDetailList);
		
		for(Product list : productList) {
			orderDetailList.addAll(orderDetailRepo.findByProduct(list)); 
		}
		
		Collections.sort(orderDetailList);
		
		return orderDetailList;
	}

	@Override
	public List<OrderDetail> findByOrder(Order order) {
		return orderDetailRepo.findByOrder(order);
	}
	@Override
	public Order findOrdernum(String ordernum) {
		return orderInfoRepo.findByOrdernum(ordernum);
	}
	
	

	// 배송저장
	@Override
	public void saveDeli(Deli deliInfo, List<Integer> detailnum, String state) {
		List<OrderDetail> orderDetailList = new ArrayList<>();
		for(Integer num : detailnum) {
			OrderDetail orderDetailInfo = orderDetailRepo.findByDetailnum(num);
			if(state.equals("배송중")) {
				orderDetailInfo.deliShipConfirm();
			}else {
				orderDetailInfo.deliConfirm();
			}
			orderDetailList.add(orderDetailInfo);
		}
		for(OrderDetail list : orderDetailList) {
			Deli deli = new Deli();
			deli.setShip_comp(deliInfo.getShip_comp());
			deli.setWaybill(deliInfo.getWaybill());
			deli.setOrderdetail(list);
			deliRepo.save(deli);
		}
	}

	@Override
	public void findById(Integer detailnum, int result) {
		OrderDetail orderDetail = orderDetailRepo.findByDetailnum(detailnum);
		if(result == 1) { // 1 = 배송준비중 변경
			orderDetail.deliReadyConfirm();
		}else if(result == 2) { // 2 = 주문취소 변경
			orderDetail.deliCancelConfirm();
		}else if(result == 3) {
			orderDetail.deliConfirm();
		}
		
	}


	
	
	
}
