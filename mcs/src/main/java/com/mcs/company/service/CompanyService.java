package com.mcs.company.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.mcs.company.domain.Company;
import com.mcs.order.domain.Order;

public interface CompanyService {

	void join(@Valid Company dto);

	//주문리스트
//	List<Order> findOrderList(Company comp);
	
//	UserDetails loadUserByUsername(String company);

}
