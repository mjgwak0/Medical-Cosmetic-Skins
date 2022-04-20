package com.mcs.security.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mcs.product.domin.Product;
import com.mcs.product.service.ProductService;

@Controller
public class SecurityController {
	
	@Autowired
	private ProductService productService;
	
	// 1.메인페이지(/,/home)
	@GetMapping(value = { "/", "/home" })
	public String homeView(Model model) throws Exception {
		List<Product> productList = productService.productlist();
		List<Product> resultItem = new ArrayList<>();
		int count = 0;
		for (Product product : productList) {			
			if( count < 3) {
				resultItem.add(product);
				count++;
			}
		}
		model.addAttribute("bestProduct",resultItem);
		return "/home";
	}

	// 2.로그인페이지
	@RequestMapping("/loginForm")
	public String loginView() {
		return "/member/loginForm";
	}

	// 3.회원가입페이지
	@GetMapping("/signupForm")
	public String signupForm() {
		return "/member/signupForm";
	}
	
	// 3.회원가입페이지(기업용)
	@GetMapping("/companyForm")
	public String companyForm() {
		return "/company/companyForm";
	}
		
	@PostMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && auth.isAuthenticated()) {
		    new SecurityContextLogoutHandler().logout(request, response, auth);
		    }
	return "redirect:/home";
	}
}
