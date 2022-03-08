package com.mcs;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.mcs.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	private final MemberService memberService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
				.authorizeRequests()					 				//HttpServletRequest에 따라 접근을 제한
					.antMatchers("/","/login","/memberForm").permitAll() 						// 해당 요청은 인증이 필요 없다.
					.antMatchers("/mypage/**").hasRole("USER")			// 해당 요청은 USER 권한만 접근하도록...
					.antMatchers("/admin/**").hasRole("ADMIN") 			// 해당 요청은 ADMIN 권한만 접근하도록...
																		// .anyRequest().authenticated(); 
																		// 이외의 모든 요청은 인증을 거친다.
			.and()
				.formLogin()
					.loginPage("/member/login")
					.defaultSuccessUrl("/loginSuccess",true)
			.and()
				.logout()
					.invalidateHttpSession(true)
					.deleteCookies()
					.logoutSuccessUrl("/");



	}
	
	@Autowired
	private DataSource dataSource;
	
	@Bean 
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }


	@Autowired
	public void authenticate(AuthenticationManagerBuilder auth) throws Exception {
	    String query1 = "SELECT member_id username, concat('{noop}', member_pw) password, 'TRUE' FROM member where member_id =?";
	    String query2 = "SELECT member_id, role FROM member where member_id =?";      
	                                   
		auth.jdbcAuthentication()
	                            .dataSource(dataSource)
	                            .usersByUsernameQuery(query1)
	                            .authoritiesByUsernameQuery(query2);
	                           
	}
	
	//service에서 유저정보 가져오는 메소드 작성

}

