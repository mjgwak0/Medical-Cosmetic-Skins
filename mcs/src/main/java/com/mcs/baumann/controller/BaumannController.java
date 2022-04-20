package com.mcs.baumann.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mcs.baumann.domain.Skintest;
import com.mcs.baumann.service.BaumannService;
import com.mcs.member.domain.Member;
import com.mcs.product.domin.Product;

@Controller
public class BaumannController {
	
	@Autowired
	private BaumannService baumannService;
	
	@GetMapping("/baumann/baumannTest")
	public String baumannTest1(@AuthenticationPrincipal Member member) {
		return "/baumann/test1";
	}
	
	@PostMapping("/baumann/baumannTest2")
	public String baumannTest2() {
		return "/baumann/test2";
	}
	
	@PostMapping("/baumann/baumannTest3")
	public String baumannTest3() {
		return "/baumann/test3";
	}
	
	@PostMapping("/baumann/baumannTest4")
	public String baumannTest4() {
		return "/baumann/test4";
	}
	
	@PostMapping("/baumann/baumannResult")
	public String baumannResult(Skintest skintest, Model model) {
		System.out.println("RESULT : " + skintest); //save
		List<Product> productList = baumannService.findProduct(skintest.getBaumann());
		
		List<Product> resultItem = new ArrayList<>();
		int count = 0;
		for (Product product : productList) {			
			if( count < 4) {
				resultItem.add(product);
				count++;
			}
		}
		model.addAttribute("resultItem", resultItem);
		System.out.println(model);

		return "/baumann/testResult";
	}
	
	@PostMapping("/main")
	public String main(@RequestParam("baumann") String testResult, @AuthenticationPrincipal Member member) {
		System.out.println("REAL RESULT : " + testResult); //save
		Skintest baumann = new Skintest();
		baumann.setBaumann(testResult);
		baumann.setMember(member);
		System.out.println("결과: " + baumann);
		baumannService.saveBaumann(baumann);
		
		return "/home";
	}
	
}
