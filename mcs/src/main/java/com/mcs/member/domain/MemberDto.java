package com.mcs.member.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {


	private String userid;
	private Integer delinum;
	private String password;
	private String gender;	
	private String phone;
	private String email;
	private String name;
	private Date birth;
	private int pw_find;
	private String pw_answer;
	private int mileage;
	private String role = "ROLE_GUEST";
	private String addr_num; //우편번호
	private String addr; //주소
	private String addr2; //상세주소
	
	public Member toEntity() {
		Member member = new Member();
		member.setUserid(userid);
		member.setPassword(password);
		member.setGender(gender);
		member.setPhone(phone);
		member.setEmail(email);
		member.setName(name);
		member.setBirth(birth);
		member.setPw_find(pw_find);
		member.setPw_answer(pw_answer);
		member.setMileage(mileage);
		member.setRole(role);
		member.setAddr_num(addr_num);
		member.setAddr(addr);
		member.setAddr2(addr2);
		return member;
	}
}
