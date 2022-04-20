package com.mcs.order.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mcs.order.domain.Order;
import com.mcs.order.domain.OrderDetail;
import com.mcs.product.domin.Product;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {

	List<OrderDetail> findByOrder(Order order);

	@Query(value = "select *"
			+ "from order_detail d"
			+ "        inner join order_info o"
			+ "            on d.ordernum = o.ordernum"
			+ "        inner join product p"
			+ "            on p.pronum = d.pronum"
			+ "    where o.userid = :userid;", nativeQuery=true)
	List<OrderDetail> oCheck(@Param("userid") String userid);

	OrderDetail findByDetailnum(Integer detailnum);

	//기업 주문리스트
	List<OrderDetail> findByProduct(Product product);




}
