package com.mcs.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.mcs.member.service.MemberService;
import com.mcs.security.handler.LoginFailureHandler;
import com.mcs.security.handler.LoginSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	//유저 정보를 가져올 클래스
	@Autowired
	private MemberService memberService;

	//인증을 무시할 경로들을 설정
	@Override
	public void configure(WebSecurity web) {
		//static 하위 폴더 (css, js, img)는 무조건 접근이 가능해야하기 때문에 인증을 무시
		web.ignoring().antMatchers("/css/**", "/js/**", "/images/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.headers(headers -> headers.cacheControl(cache -> cache.disable()))
			.csrf().disable().authorizeRequests()
//					.antMatchers("/","/login","/sighupForm").permitAll()
					.antMatchers("/mypage/**").hasRole("USER")
					.antMatchers("/baumann/**").hasRole("USER")
//					.antMatchers("/admin/**").hasRole("ADMIN")
				    .anyRequest().permitAll() 
					//anyRequest : antMatchers에서 설정하지 않은 나머지 경로
					//permitAll : 누구나 접근 가능
					//authenticated : 권한이 있으면 무조건 접근 가능
					//hasRole : 특정 권한이 있는 사람만 접근 가능
				    .and()
			.formLogin()
					.loginPage("/loginForm") //로그인페이지(View매핑된곳)
					.loginProcessingUrl("/login") //로그인(submit버튼 action값 매핑된곳)
					.usernameParameter("userid")
//					.defaultSuccessUrl("/home",true) //로그인성공페이지
					.successHandler(new LoginSuccessHandler())
					.failureHandler(new LoginFailureHandler())
					.permitAll()
					.and()
			.logout()
					.logoutUrl("/logout")
					.invalidateHttpSession(true) //세션날리기
					.deleteCookies() //쿠키삭제
					.logoutSuccessUrl("/home"); //로그아웃성공페이지



	}
	
	
	@Bean 
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }
	
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(memberService).passwordEncoder(passwordEncoder());
    }


//    @Autowired
//    private DataSource dataSource;
//	@Autowired
//	public void authenticate(AuthenticationManagerBuilder auth) throws Exception {
////	    String query1 = "SELECT member_id username, concat('{noop}', member_pw) password, 'TRUE' FROM member where member_id =?";
//		String query1 = "SELECT member_id username, member_pw password, 'TRUE' FROM member where member_id =?";
//	    String query2 = "SELECT member_id, role FROM member where member_id =?";      
//	                                   
//		auth.jdbcAuthentication()
//	                            .dataSource(dataSource)
//	                            .usersByUsernameQuery(query1)
//	                            .authoritiesByUsernameQuery(query2);
//	                           
//		
//	}


}

