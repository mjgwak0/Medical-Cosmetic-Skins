package com.mcs.member.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Role {
//	USER("ROLE_USER","일반회원"),
//	COMPANY("ROLE_COMPANY",""),
//	ADMIN("ROLE_ADMIN");
	
	ROLE_USER, ROLE_COMPANY, ROLE_ADMIN;
	
}
