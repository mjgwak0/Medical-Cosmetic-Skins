package com.mcs.reivew.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.mcs.member.domain.Member;
import com.mcs.reivew.domain.Review;
import com.mcs.reivew.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;  //서비스와 연결
	
	@PostMapping("/mypage/review")
	public String reviewSave(@AuthenticationPrincipal Member member ,Review review) {
		review.setUserid(member.getUserid());
		reviewService.reviewSave(review);
		return "/mypage/memberOrderList";
	}
	
	
	
	
}
