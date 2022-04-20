package com.mcs.baumann.service;

import java.util.List;

import com.mcs.baumann.domain.Skintest;
import com.mcs.product.domin.Product;

public interface BaumannService {

	public void saveBaumann(Skintest baumann);

	public List<Product> findProduct(String baumann);

}
