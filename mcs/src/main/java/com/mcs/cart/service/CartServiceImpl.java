package com.mcs.cart.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mcs.cart.domain.Basket;
import com.mcs.cart.domain.Cart;
import com.mcs.cart.repository.BasketRepository;
import com.mcs.cart.repository.CartRepository;
import com.mcs.member.domain.Member;
import com.mcs.product.domin.Product;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private BasketRepository basketRepository;

	public void Basket(Member member) {
		Cart cart = Cart.basket(member);
		cartRepository.save(cart);
	}

	// 장바구니에 상품 추가하기
	@Transactional
	@Override
	public void addCart(Member member, Product product, int count) {

		Cart cart = cartRepository.findByMember(member);
		// cart가 비어있다면 생성.
		if (cart == null) {
			cart = Cart.basket(member);
			cartRepository.save(cart);
		}

		// basket 생성
		Basket basket = basketRepository.findByCartAndProduct(cart, product);

		// basket이 비어있다면 새로 생성.
		if (basket == null) {
			basket = Basket.createCartItem(cart, product, count);
			basketRepository.save(basket);
		} else {
			// 비어있지 않다면 그만큼 갯수를 추가.
			basket.addCount(count);
		}

	}

	// 장바구니 조회하기
	@Override
	public List<Basket> userCartView(Cart cart) {
		List<Basket> baskets = basketRepository.findAll();
		List<Basket> userbaskets = new ArrayList<>();

		for (Basket basket : baskets) {
			if (basket.getCart().getCartid() == cart.getCartid()) {
				userbaskets.add(basket);
			}
		}
		return userbaskets;

	}
	//조회
	@Override
	public Cart findCart(Member member) {
		return cartRepository.findByMember(member);
	}


    //장바구니 제품 삭제
	@Override
    public void cartItemDelete(Integer basketid) {
    	basketRepository.deleteByBasketid(basketid);
    }
    
	//장바구니 제품 전체삭제
	@Override
	public void cartAllDelete(Basket basket) {
		basketRepository.deleteByBasketid(basket);
	}
  
    
    //장바구니 제품 전체삭제
//	@Override
//    public void cartDelete(Integer basketid) {
//    	List<Basket> baskets = basketRepository.findAll(); //전체 카트제품 찾기
//    	// 반복문을 이용하여 접속 user의 basket 만 찾아서 삭제
//    	for(Basket basket : baskets) {
//              if(basket.getCart().getMember().getUserid() == userid) {
//            	  basket.setCount(basket.getCount() -1);
//            	  basketRepository.deleteById(basket.getBasketid());
//            	  
//              }
//    	  }
//    		
//    	}
    
	//장바구니 결제하기
//	@Transactional
//    public void cartPayment(Integer basketid){
//        List<basket> cart_items = basketRepository.findAll(); // 전체 cart_item 찾기
//        List<basket> userCart_items = new ArrayList<>();
//        User buyer = userRepository.findById(basketid).get();
//
//        // 반복문을 이용하여 접속 User의 Cart_item만 찾아서 저장
//        for(Basket basket : baskets){
//            if(basket.getCart().getUser().getId() == buyer.getId()){
//                userCart_items.add(basket);
//            }
//        }
//
//        // 반복문을 이용하여 접속 User의 Cart_item 만 찾아서 삭제
//        for(Cart_item cart_item : userCart_items){
//            // 재고 변경
//            int stock = cart_item.getItem().getStock(); // 현재 재고를 변수에 저장
//            stock = stock - cart_item.getCount(); // 저장된 변수를 결제한 갯수만큼 빼준다
//            cart_item.getItem().setStock(stock); // 재고갯수 변경
//
//            // 금액 처리
//            User seller = cart_item.getItem().getUser();
//            int cash = cart_item.getItem().getPrice(); // 아이템 가격을 변수에 저장
//            buyer.setMoney(cash * -1);
//            seller.setMoney(cash);
//        }
//    }
//	

}
