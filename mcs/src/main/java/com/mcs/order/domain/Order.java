package com.mcs.order.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.mcs.member.domain.Member;

import lombok.Data;

@Entity
@Data
@Table(name="order_info")
@DynamicInsert
@EntityListeners(AuditingEntityListener.class)
public class Order {
	
	@Id
	private String ordernum; //주문번호 오늘날짜0001~x
	
	private String name; //수령인 
	private String phone; //수령인 연락처
	private String addr_num; //우편번호
	private String addr; //주소
	private String addr2; //상세주소
	private Date orderdate; //주문날짜
	private Integer amount;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	private Member member;
	
	@BatchSize(size=20)
	@OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
	private List<OrderDetail> orderdetail = new ArrayList<>();
	
	
	public void subtractPrice(Integer amount) {
		this.amount -= amount;
		System.out.println("amount : " + amount);
	}
	
}
