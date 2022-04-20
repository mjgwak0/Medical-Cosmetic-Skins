package com.mcs.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.mcs.baumann.domain.Skintest;
import com.mcs.baumann.repository.BaumannRepository;
import com.mcs.member.domain.Member;
import com.mcs.member.domain.MemberUpdateDto;
import com.mcs.member.repository.MemberRepository;
import com.mcs.order.domain.Order;
import com.mcs.order.domain.OrderDetail;
import com.mcs.order.repository.OrderDetailRepository;
import com.mcs.order.repository.OrderRepository;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private OrderDetailRepository orderDetailRepo;
	@Autowired
	private MemberRepository memberRepo;
	@Autowired
	private BaumannRepository baumannRepo;
	
	@Override
	public List<Order> findOrderList(Member member) {
		List<Order> orderList = orderRepo.findByMember(member);
		return orderList;
	}

	@Override
	public List<OrderDetail> findOrderDetailList(Order order) {
		return orderDetailRepo.findByOrder(order);
	}

	@Override
	public Order findOrdernum(String ordernum) {
		return orderRepo.findByOrdernum(ordernum);
	}

	@Override
	public List<OrderDetail> findOrderDetailAll() {
		return orderDetailRepo.findAll(Sort.by(Sort.Direction.DESC, "statedate"));
	}

	//회원탈퇴
	@Override
	public void memberDelete(Member member) {
		try {
			memberRepo.delete(member);					
		}catch (Exception e) {
			
		}
	}

	//회원 바우만 타입 조회
	@Override
	public Skintest findByBaumann(Member member) {		
		return baumannRepo.findByMember(member);
	}

	//회원수정
	@Override
	public void updateMember(Member member) {
		memberRepo.save(member);
	}


	
	

}
