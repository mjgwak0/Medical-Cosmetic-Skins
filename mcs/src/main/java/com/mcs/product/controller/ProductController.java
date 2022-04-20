
package com.mcs.product.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mcs.board.domain.Board;
import com.mcs.board.service.BoardService;
import com.mcs.company.domain.Company;
import com.mcs.order.domain.Deli;
import com.mcs.order.domain.Order;
import com.mcs.order.domain.OrderDetail;
import com.mcs.order.domain.OrderDetailDto;
import com.mcs.order.service.OrderService;
import com.mcs.product.domin.Files;
import com.mcs.product.domin.Product;
import com.mcs.product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private BoardService boardService;
	
	// 1.상품등록페이지
	@GetMapping("/company/addproductForm")
	public String addProductView(@AuthenticationPrincipal Company comp, Model model) {
		model.addAttribute("comp",comp.getCompany_name());
		return "/company/companyAddProduct";
	}	
	
	// 1-1.상품등록
	@PostMapping("/company/addproduct")
	public String addProduct(@AuthenticationPrincipal Company comp, @ModelAttribute("product") Product product, @RequestPart MultipartFile filesinfo) throws Exception {
		Files file = productService.saveFile(filesinfo, null); //파일저장
		product.setFiles(file); //저장된파일 번호 가져옴	
		product.setCompany(comp.getCompany()); //로그인한 기업 아이디 가져옴
		productService.saveProduct(product); //상품등록
		return "redirect:/company/ProductList";
	}
	
	// 2.회원전용 상품리스트 페이지
	@GetMapping("/product/productList")
	public String productlist(Model model) {
		List<Product> productList = productService.productlist();
		List<Product> resultItem = new ArrayList<>();
		int count = 0;
		for (Product product : productList) {			
			if( count < 10) {
				resultItem.add(product);
				count++;
			}
		}
		model.addAttribute("bestProduct",resultItem);
		model.addAttribute("product",productList);
		return "/product/productList";
	}	
	// 2-1.회원전용 상품상세 페이지
	@RequestMapping("/productInfo")
	public String productInfo(@RequestParam("pronum") int pronum, Model model) {
		Product productInfo = productService.productInfo(pronum);
		List<Board> boardList = boardService.findByPronum(pronum);
		model.addAttribute("boardList",boardList);
		model.addAttribute("product",productInfo);
		return "/product/productInfo";
	}
	
	// 3.기업전용 상품리스트 페이지 (상품선택시 수정,삭제)
	@GetMapping("/company/ProductList")
	public String updateProductView(@AuthenticationPrincipal Company comp, Model model) {
		List<Product> compProductList = productService.compProductList(comp.getCompany());
		model.addAttribute("product",compProductList);
		return "/company/companyProductList";
	}	
	// 3.상품수정페이지
	@GetMapping("/company/ProductUpdate")
	public String compProductUpdateView(@AuthenticationPrincipal Company comp, Model model, @RequestParam("pronum") int pronum) {
		Product productInfo = productService.productInfo(pronum);
		model.addAttribute("product",productInfo);		
		return "/company/companyProductUpdate";
	}
	
	// 3.상품수정 and 파일수정
	@PostMapping("/company/updateProduct")
	public String updateProduct(@ModelAttribute("product") Product product,@RequestParam("filenum") Integer filenum, @RequestPart MultipartFile filesinfo) throws Exception {	
		Files file = productService.saveFile(filesinfo, filenum); //파일저장(수정 filenum값)	
		product.setFiles(file); //저장된파일 가져옴	
		productService.saveProduct(product); //상품등록
		return "redirect:/company/ProductList";
	}
	
	// 3-1.상품삭제
	@Transactional
	@GetMapping("/company/deleteProduct")
	public String deleteProduct(@RequestParam("pronum") Integer pronum) {
		productService.deleteProduct(pronum);
		return "redirect:/company/ProductList";
	}
	
	// 4.기업전용 원료페이지
	@GetMapping("/company/ProductIngredients")
	public String compProductIngredients(@AuthenticationPrincipal Company comp, Model model) {
		List<Product> compProductList = productService.compProductList(comp.getCompany());
		model.addAttribute("product",compProductList);
		return "/company/companyProductIngredients";
	}
	
	// 5.기업전용 주문리스트
	@GetMapping("/company/orderList")
	public String companyOrderList(@AuthenticationPrincipal Company comp, Model model){
		List<OrderDetail> orderDetailList = orderService.findByProduct(comp.getCompany());
		model.addAttribute("orderSize",orderDetailList.size());
		model.addAttribute("orderDetailList",orderDetailList);
		return "/company/companyOrderList";
	}
	
	// 6.기업전용 주문상세
	@GetMapping("/company/orderDetail")
	public String companyOrderDetail(Order orderinfo, Model model){
		Order order = orderService.findOrdernum(orderinfo.getOrdernum());
		List<OrderDetail> orderDetailList = orderService.findByOrder(orderinfo);
		model.addAttribute("order",order);
		model.addAttribute("orderDetailList",orderDetailList);
		return "/company/companyOrderDetail";
	}
	
	// 6-1.기업전용 배송저장
	@PostMapping("/company/orderSubmit")
	public String companyOrderSubmit(Order order, Deli deli, @RequestParam("detailnum") List<Integer> detailnum, @RequestParam("state") String state) {
		orderService.saveDeli(deli, detailnum, state); //배송정보가져오고 저장
		return "redirect:/company/orderDetail?ordernum=" + order.getOrdernum();
	}
	
	// 6-2.기업전용 배송상태 ajax
	@PostMapping("/company/orderState")
	@ResponseBody
	public int companyOrderRefund(OrderDetail orderdetail, @RequestParam("result") int result) {
		try {
			orderService.findById(orderdetail.getDetailnum(), result);
			return 0;
		}catch (Exception e) {
			return 1;
		}
	}
	
	// 7.기업전용 주문취소리스트
	@GetMapping("/company/orderCancelList")
	public String company(){
		return "/company/companyOrderCancelList";
	}
	

	
}
