package com.mcs.order.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mcs.company.domain.Company;
import com.mcs.member.domain.Member;
import com.mcs.order.domain.Order;

public interface OrderRepository extends JpaRepository<Order, String> {

	//회원 주문정보 리스트
	List findByMember(Member member);

	Order findByName(String name);
	
	@Query(value = "select o.*, d.price, d.order_count from order_info o inner join order_detail d on o.ordernum = d.ordernum inner join product p on d.pronum = p.pronum where o.userid = :userid", nativeQuery=true)
	List<Order> oCheck(@Param("userid") String userid);

	Order findByOrdernum(String ordernum);
	
//	@Query(value = "select *"
//			+ "from order_detail d"
//			+ "        inner join order_info o"
//			+ "            on d.ordernum = o.ordernum"
//			+ "        inner join product p"
//			+ "            on p.pronum = d.pronum"
//			+ "    where o.userid = :userid;", nativeQuery=true)
//	List<Order> oCheck(@Param("userid") String userid);

}
