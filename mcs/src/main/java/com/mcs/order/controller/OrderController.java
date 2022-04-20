package com.mcs.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mcs.member.domain.Member;
import com.mcs.mypage.service.MypageService;
import com.mcs.order.domain.Order;
import com.mcs.order.domain.OrderDetail;
import com.mcs.order.service.OrderService;
import com.mcs.product.domin.Product;
import com.mcs.product.service.ProductService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService productService;
	@Autowired
	private MypageService mypageService;
	
	// 1.바로구매 페이지
	@PostMapping("/product/orderview")
	public String orderView(@AuthenticationPrincipal Member member,
							@RequestParam("pronum") Integer pronum,
							@RequestParam("productCount") Integer count, Model model) {
		Product productInfo = productService.productInfo(pronum);
		int salePrice = productInfo.getPrice()-(productInfo.getPrice()*productInfo.getSale()/100);
		int totalPrice = salePrice*count;
		model.addAttribute("salePrice",salePrice);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("count",count);
		model.addAttribute("product",productInfo);
		model.addAttribute("member",member);
		return "/order/productOrder";
	}
	
	// 2.구매 (SUBMIT)
	@PostMapping("/product/order")
	public String order(@AuthenticationPrincipal Member member,
						@RequestParam("pronum") Integer pronum,
						Order order,
						OrderDetail orderDetail, Model model) {
		
		Product productInfo = productService.productInfo(pronum);
			
		//주문번호(orderId) 생성을 위한 로직
		  Calendar cal = Calendar.getInstance();
		  int year = cal.get(Calendar.YEAR);
		  String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		  String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		  String subNum = "";
		  
		  for(int i = 1; i <= 6; i ++) {
		   subNum += (int)(Math.random() * 10);
		  }
		  String orderId = ymd + subNum; //ex) 20200508373063
		  
		  order.setOrdernum(orderId);
		  order.setMember(member);
		  
		  orderDetail.setProduct(productInfo);
		  orderDetail.setOrder(order);
		  
		  orderService.saveOrder(order);
		  orderService.saveOrderDetail(orderDetail);
		  
		  model.addAttribute("orderDetail",orderDetail);
		  model.addAttribute("order",orderId);
		  
		return "/order/productOrderSuccess";
	}
	
	// 3.주문취소
	@GetMapping("/product/orderCancel")
	public String orderCancel(Model model, @RequestParam("ordernum") String ordernum, @RequestParam("detailnum") Integer detailnum, @RequestParam("result") int result) {
		Order order = mypageService.findOrdernum(ordernum);
		List<OrderDetail> orderDetailList = mypageService.findOrderDetailList(order);
		if(result == 1) {
			orderService.orderCancel(detailnum);
		}else {
			orderService.orderRefund(detailnum);
		}
			
		model.addAttribute("order",order);
		model.addAttribute("orderDetailList",orderDetailList);
		return "/mypage/memberOrderDetail";
	}
	
	// 4.환불하기
	@GetMapping("/order/orderRefund")
	public String orderRefund() {
		
		return "";
	}
	
}
