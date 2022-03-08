package com.mcs.member.domain;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Entity
@DynamicInsert
@Data
public class Member {
	
	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	private String member_id;
	private String member_pw;
	private Integer deli_num;	
	private String name;
	private String email;
	private String gender;
	private String phone;
	private Date birth;
	private int pw_find;
	private String pw_answer;
	private String role;

}
