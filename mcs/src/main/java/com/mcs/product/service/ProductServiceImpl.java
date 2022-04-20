package com.mcs.product.service;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.mcs.product.domin.Files;
import com.mcs.product.domin.Product;
import com.mcs.product.repository.FilesRepository;
import com.mcs.product.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	FilesRepository filesRepo;
	@Autowired
	ProductRepository productRepo;
	
	// 1.상품등록
	@Override
	public void saveProduct(Product product) {
		productRepo.save(product);
	}
	// 1-2.상품파일등록(파일저장, if부분 파일수정)
	@Override
	public Files saveFile(MultipartFile files, Integer filenum) throws Exception{
		
		Files file = new Files();
		
		String sourceFileName = files.getOriginalFilename(); 
        		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        		File destinationFile; 
        		String destinationFileName;
        		String fileUrl = "D:\\Project\\mcs\\src\\main\\resources\\static\\images\\";

        		do { 
            			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
            			destinationFile = new File(fileUrl + destinationFileName); 
        		} while (destinationFile.exists()); 
        
        		destinationFile.getParentFile().mkdirs(); 
        		files.transferTo(destinationFile);
        		
        		if(filenum!=null) { //상품수정 filenum값 확인
        			file.setFilenum(filenum);
        		}
        
        		file.setFile_name(destinationFileName);
        		file.setFileoriname(sourceFileName);
        		file.setFile_url(fileUrl);
        		
        		Files fileinfo = filesRepo.save(file);
        		
			return fileinfo;
	}


	// 2.회원 상품리스트 조회
	@Override
	public List<Product> productlist() {
		return productRepo.findAll();
	}

	// 3.기업전용 상품리스트 조회
	@Override
	public List<Product> compProductList(String company) {
		return productRepo.findByCompany(company);
	}

	// 3-1.기업전용 상품수정
	@Override
	public Product productInfo(int pronum) {
		return productRepo.findByPronum(pronum);
	}

	// 3-2.기업전용 상품삭제
	@Override
	public void deleteProduct(Integer pronum) {
		productRepo.deleteByPronum(pronum);
		
	}


}
