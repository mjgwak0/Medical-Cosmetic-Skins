package com.mcs.member.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberUpdateDto {


	private String userid;	
	private String phone;	
	private String name;	
	private int pw_find;
	private String pw_answer;
	private String addr_num; //우편번호
	private String addr; //주소
	private String addr2; //상세주소
	
	public void updateMember(MemberUpdateDto memberDto) {
//		Member member = new Member();
//		member.setUserid(userid);
//		member.setPhone(phone);
//		member.setName(name);
//		member.setPw_find(pw_find);
//		member.setPw_answer(pw_answer);
//		member.setAddr_num(addr_num);
//		member.setAddr(addr);
//		member.setAddr2(addr2);
		

	}
}
