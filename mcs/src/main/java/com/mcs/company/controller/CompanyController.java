package com.mcs.company.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mcs.company.domain.Company;
import com.mcs.company.service.CompanyService;
import com.mcs.order.domain.Order;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	@Autowired
	private PasswordEncoder encoder;
	
	// 1.회원가입(submit버튼)
	@PostMapping("/company/signup")
	public String join(@Valid Company dto) throws Exception {
		dto.setPassword(encoder.encode(dto.getPassword()));
		dto.setRole("ROLE_MANAGER");
		companyService.join(dto);
		return "/home";
	}
	
//	@GetMapping("/company/orderList")
//	public String companyOrderList(@AuthenticationPrincipal Company comp, Model model){
//		List<Order> orderList = companyService.findOrderList(comp); // Order테이블
//		model.addAttribute("orderList",orderList);
//		return "/company/companyOrderList";
//	}
	
//	@GetMapping("/company/orderCancelList")
//	public String company(){
//		return "/company/companyOrderCancelList";
//	}
	
}