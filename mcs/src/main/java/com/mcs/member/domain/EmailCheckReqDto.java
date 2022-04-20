package com.mcs.member.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EmailCheckReqDto {

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
	private String role;

}
