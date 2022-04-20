package com.mcs.order.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;

import com.mcs.product.domin.Product;

import lombok.Data;

@Entity
@Data
@Table(name = "order_detail")
@DynamicInsert
public class OrderDetail implements Comparable<OrderDetail> {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "orderDetail_seq")
    @SequenceGenerator(sequenceName = "order_detail_seq", allocationSize = 1, name = "orderDetail_seq")
	private Integer detailnum; //주문상세번호 1~x
	
	private String pay_method; //결제수단
	private Integer order_count; //수량
	private Integer price; //가격
	private String state; //배송상태
	private String pay_refund; //환불여부
	private Date statedate; //취소,환불날짜

	
	@ManyToOne
	@JoinColumn(name = "ordernum")
	private Order order;
	
	@ManyToOne
    @JoinColumn(name = "pronum")
    private Product product;
	
	//Product.addStock() 메소드를 호출하는 주문취소 메소드 추가
	public void cancel() {
		this.getProduct().addStock(order_count);
	}
	
	//회원 주문취소
	public void cancelOrder() {
		this.state = "주문취소";
		cancel();
		this.getOrder().subtractPrice(price);
	}
	//회원 주문환불
	public void refundOrder() {
		this.state = "환불신청";
	}
	
	//기업 배송준비	
	public void deliReadyConfirm() {
		this.state = "배송준비중";
	}
	//기업 주문취소	
	public void deliCancelConfirm() {
		this.state = "주문취소";
		cancel();
		this.getOrder().subtractPrice(price);
	}
	//기업 배송중
	public void deliShipConfirm() {
		this.state = "배송중";
	}
	//기업 배송중
	public void deliConfirm() {
		this.state = "배송완료";
	}

	@Override
	public int compareTo(OrderDetail o) {
		if (o.detailnum < detailnum) {
			return 1;
		}else if(o.detailnum > detailnum) {
			return -1;
		}
		return 0;
	}
}
