package com.mcs.product.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mcs.product.domin.Files;
import com.mcs.product.domin.Product;

public interface ProductService {
	
	//파일업로드(등록,수정)
	public Files saveFile(MultipartFile files, Integer filenum) throws Exception;

	//상품업로드(등록,수정)
	public void saveProduct(Product product);

	//회원전용 상품리스트 조회
	public List<Product> productlist();

	//회원,기업 상품상세정보 조회
	public Product productInfo(int pronum);

	//기업전용 상품리스트 조회
	public List<Product> compProductList(String company);

	//기업전용 상품삭제
	public void deleteProduct(Integer pronum);

}
