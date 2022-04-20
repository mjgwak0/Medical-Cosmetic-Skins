package com.mcs.product.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.mcs.product.domin.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	Product findByPronum(int pronum);

	List<Product> findByCompany(String company);

	void deleteByPronum(Integer pronum);

	List<Product> findByBaumann(String baumann);

}
