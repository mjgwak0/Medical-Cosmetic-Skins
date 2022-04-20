package com.mcs.company.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcs.company.domain.Company;
import com.mcs.company.repository.CompanyRepository;
import com.mcs.order.domain.Order;
import com.mcs.order.repository.OrderRepository;
import com.mcs.product.domin.Product;
import com.mcs.product.repository.ProductRepository;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyRepository companyRepo;
	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private ProductRepository productRepo;
	
	@Override
	public void join(@Valid Company dto) {
		companyRepo.save(dto);
	}

	//주문리스트
//	@Override
//	public List<Order> findOrderList(Company comp) {
//		List<Product> productList = productRepo.findByCompany(comp);
//		List<Order> orderList = orderRepo.findAll();
//		
//		return ;
//	}

	
}
