package com.mcs.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mcs.baumann.domain.Skintest;
import com.mcs.board.domain.Board;
import com.mcs.board.service.BoardService;
import com.mcs.member.domain.Member;
import com.mcs.member.service.MemberService;
import com.mcs.mypage.service.MypageService;
import com.mcs.order.domain.Order;
import com.mcs.order.domain.OrderDetail;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private BoardService boardService;
	
	
	// 1.마이페이지 주문 리스트
	@GetMapping("/mypage/orderList")
	public String memberOrderList(@AuthenticationPrincipal Member member, Model model) {
		List<Order> orderList = mypageService.findOrderList(member); // Order테이블
		model.addAttribute("orderList",orderList);
		return "/mypage/memberOrderList";
	}
	
	// 1-1.마이페이지 주문상세 리스트
	@GetMapping("/mypage/orderDetail")
	public String memberOrderDetail(Order order, Model model) {
		List<OrderDetail> orderDetailList = mypageService.findOrderDetailList(order);
		model.addAttribute("order",order);
		model.addAttribute("orderDetailList",orderDetailList);
		return "/mypage/memberOrderDetail";
	}
	
	// 2.마이페이지 주문취소/환불 리스트
	@GetMapping("/mypage/memberOrderCancelList")
	public String memberOrderCancleList(@AuthenticationPrincipal Member member, Model model) {
		List<OrderDetail> orderDetailList = mypageService.findOrderDetailAll();
		List<OrderDetail> orderDetail = new ArrayList<>();
		for(OrderDetail list : orderDetailList) {
			if(list.getOrder().getMember().getUserid().equals(member.getUserid())) {
				orderDetail.add(list);
			}
		}
		model.addAttribute("orderDetailList",orderDetail);
		return "/mypage/memberOrderCancelList";
	}
	
	// 3.마이페이지 FAQ게시판
	@GetMapping("/mypage/memberFAQ")
	public String memberFAQ() {
		return "/mypage/memberFAQ";
	}
	
	// 4.마이페이지 1:1문의게시판
	@GetMapping("/mypage/memberBoard")
	public String memberBoard(@AuthenticationPrincipal Member member, Model model) {
		List<Board> boardList = boardService.getBoardList(member.getUserid());
		model.addAttribute("boardList", boardList);
		System.out.println(model);
		return "/mypage/memberBoard";
	}
	
	// 5.마이페이지 회원수정
	@GetMapping("/mypage/memberModifyPwCheck")
	public String memberModifyPwCheck(@AuthenticationPrincipal Member member, Model model) {
		model.addAttribute("member", member);
		return "/mypage/memberModifyPwCheck";
	}
	
	// 5-1.마이페이지 비밀번호확인
	@PostMapping("/mypage/confirmPwd")
	public String findidForm(@AuthenticationPrincipal Member member, @RequestParam("password") String pw, Model model, RedirectAttributes rttr) {
		if(encoder.matches(pw, member.getPassword())==true) {
			return "redirect:/mypage/memberModify";
		}else {
			rttr.addAttribute("msg","올바른 비밀번호를 입력해주세요.");				
		}
		return "redirect:/mypage/memberModifyPwCheck";
	}
	
	// 5-1.마이페이지 회원수정 페이지
	@GetMapping("/mypage/memberModify")
	public String memberModify(@AuthenticationPrincipal Member member, Model model) {
		try {
			Skintest baumann = mypageService.findByBaumann(member);
			model.addAttribute("type",baumann.getBaumann());
			model.addAttribute("member",member);
		}catch (Exception e) {
			model.addAttribute("member",member);
		}
		return "/mypage/memberModify";
	}
	
	// 5-2.회원정보수정
	@PostMapping("/memberUpdate")
	@ResponseBody
	public int updateMember(Member member, HttpSession session) {
		try {
			mypageService.updateMember(member);
		}catch (Exception e) {
			return 0;
		}
		Authentication authentication = new UsernamePasswordAuthenticationToken(member, null, member.getAuthorities());
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
		session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		return 1;
	}
	
	// 6.마이페이지 회원탈퇴 페이지
	@GetMapping("/mypage/memberDeletePwCheck")
	public String memberDeleteView() {
		return "/mypage/memberDelete";
	}
	
	// 6-1.마이페이지 회원탈퇴 ajax
	@PostMapping("/mypage/pwCheck")
	@ResponseBody
	public int memberPwCheck(@AuthenticationPrincipal Member member, @RequestParam("password") String pw) {
		if(encoder.matches(pw, member.getPassword())==true) {
			return 1;
		}
		return 0;				
	}
	
	// 6-1.마이페이지 회원탈퇴
	@PostMapping("/mypage/memberDelete")
	public String memberDelete(@AuthenticationPrincipal Member member, @RequestParam("password") String pw) {
		mypageService.memberDelete(member);
		return "redirect:/logout";
	}
	
}

