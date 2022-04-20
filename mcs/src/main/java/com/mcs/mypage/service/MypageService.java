package com.mcs.mypage.service;

import java.util.List;

import com.mcs.baumann.domain.Skintest;
import com.mcs.member.domain.Member;
import com.mcs.member.domain.MemberUpdateDto;
import com.mcs.order.domain.Order;
import com.mcs.order.domain.OrderDetail;

public interface MypageService {

	List<Order> findOrderList(Member member);

	List<OrderDetail> findOrderDetailList(Order order);

	Order findOrdernum(String ordernum);

	List<OrderDetail> findOrderDetailAll();

	void memberDelete(Member member);

	//회원 바우만 타입 조회
	Skintest findByBaumann(Member member);

	//회원수정
	void updateMember(Member member);



}
