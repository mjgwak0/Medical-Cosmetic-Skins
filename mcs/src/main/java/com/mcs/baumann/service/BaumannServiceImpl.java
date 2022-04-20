package com.mcs.baumann.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcs.baumann.domain.Skintest;
import com.mcs.baumann.repository.BaumannRepository;
import com.mcs.product.domin.Product;
import com.mcs.product.repository.ProductRepository;

@Service
public class BaumannServiceImpl implements BaumannService {

	@Autowired
	BaumannRepository baumannRepo;

	@Autowired
	ProductRepository productRepo;

	// 1. 정보저장
	@Override
	public void saveBaumann(Skintest baumann) {
		baumannRepo.save(baumann);
	}

	@Override
	public List<Product> findProduct(String baumann) {		
		
		return productRepo.findByBaumann(baumann);
	}
}
