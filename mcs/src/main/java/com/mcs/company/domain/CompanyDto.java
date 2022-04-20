package com.mcs.company.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CompanyDto {


	private String userid;
	private Integer deli_num;
	private String password;
	private String gender;	
	private String phone;
	private String email;
	private String name;
	private Date birth;
	private int pw_find;
	private String pw_answer;
	private int mileage;
	private String role = "roleNot";
	
//	public Member toEntity() {
//		Member member = new Member();
//		member.setUserid(userid);
//		member.setPassword(password);
//		member.setDeli_num(deli_num);
//		member.setGender(gender);
//		member.setPhone(phone);
//		member.setEmail(email);
//		member.setName(name);
//		member.setBirth(birth);
//		member.setPw_find(pw_find);
//		member.setPw_answer(pw_answer);
//		member.setMileage(mileage);
//		member.setRole(role);
//		return member;
//	}
}