package com.mcs.member.domain;


import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@DynamicInsert
@DynamicUpdate
@Data
@NoArgsConstructor
public class Member implements UserDetails {
	
	@Id
	private String userid;
	
	private String password;
	private String gender;	
	private String phone;
	private String email;
	private String name;
	private Date birth;
	private int pw_find;
	private String pw_answer;
	private int mileage;
	private String role;
	private Date join_date;
	
	private String addr_num; //우편번호
	private String addr; //주소
	private String addr2; //상세주소
	
	public void updateMember(MemberUpdateDto memberDto) {
		this.userid = memberDto.getUserid(); 
		this.phone = memberDto.getPhone();
		this.name = memberDto.getName();
		this.pw_find = memberDto.getPw_find();
		this.pw_answer = memberDto.getPw_answer();
		this.addr_num = memberDto.getAddr_num();
		this.addr = memberDto.getAddr();
		this.addr2 = memberDto.getAddr2();
	}
	
	//UserDetails
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(role));
		return auth;
	}
	@Override
	public String getPassword() {
		return password;
	}
	@Override
	public String getUsername() {
		return userid;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
