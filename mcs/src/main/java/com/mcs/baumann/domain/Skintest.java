package com.mcs.baumann.domain;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.DynamicInsert;

import com.mcs.member.domain.Member;

import lombok.Data;

@Entity
@Data
@DynamicInsert
public class Skintest {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "bau_seq")
	@SequenceGenerator(sequenceName = "baumann_seq", allocationSize = 1, name = "bau_seq")
	private Integer test_num;
	
	private Integer balance;
	private Integer sensitivity;
	private Integer melanin;
	private Integer elasticity;
	private String baumann;
	private Date test_date;
	
	@OneToOne
	@JoinColumn(name = "userid")
	private Member member;
}
