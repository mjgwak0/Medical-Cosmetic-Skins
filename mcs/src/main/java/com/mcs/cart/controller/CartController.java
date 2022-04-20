package com.mcs.cart.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mcs.cart.domain.Basket;
import com.mcs.cart.domain.Cart;
import com.mcs.cart.service.CartService;
import com.mcs.member.domain.Member;
import com.mcs.product.domin.Product;

@Controller
public class CartController {

	@Autowired
	CartService cartService;

	// 장바구니 추가
	@PostMapping("/cart")
	public String cart(@AuthenticationPrincipal Member member, Product product, @RequestParam("count") int count,
			Model model) {
		model.addAttribute("mem", member);
		cartService.addCart(member, product, count);
		return "redirect:/cart/cartList";
	}

	// 장바구니 조회
	@GetMapping("/cart/cartList")
	public String myCartPage(@AuthenticationPrincipal Member member, Model model) {
		// 로그인 user == 접속 user
		if (member != null) {
			// user의 장바구니를 가져온다
			Cart cart = cartService.findCart(member);
			// 장바구니의 아이템을 가져온다.
			List<Basket> baskets = cartService.userCartView(cart);

			int totalPrice = 0;
			List<Integer> salePrice = new ArrayList<>();
			List test = new ArrayList<>();
			for (Basket basket : baskets) {
				totalPrice += (basket.getProduct().getPrice() * basket.getCount()); // 총상품금액(할인x)
				salePrice.add(basket.getProduct().getPrice()
						- (basket.getProduct().getPrice() * basket.getProduct().getSale() / 100)); // 세일가격

				test.add(basket);
				test.add(salePrice);
			}


			model.addAttribute("basket", baskets);
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("salePrice", salePrice);
			model.addAttribute("user", cartService.findCart(member));
			System.out.println("model" + model);
			System.out.println("saleprice"+ salePrice);
			System.out.println("basket" + baskets);
			// User의 장바구니를 가져온다.
			return "/cart/cart";
		} else {
			return "redirect:/main";
		}
	}

	//특정 상품 장바구니 삭제
    @PostMapping("/delete")
	public String myCartDelete(@RequestParam("basketid")Integer basketid) {
		cartService.cartItemDelete(basketid);
		System.out.println(basketid); 
	      return "redirect:/cart/cartList";	
	}
    
    //장바구니 전체 삭제
    @PostMapping("alldelete")
    public String CartAllDelete(Basket basket) {
    	cartService.cartAllDelete(basket);
		return "redirect:/cart/cartList";
    	
    }


	
		
}
