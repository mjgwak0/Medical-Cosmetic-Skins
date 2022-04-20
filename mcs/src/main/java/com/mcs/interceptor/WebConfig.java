package com.mcs.interceptor;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class WebConfig implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry reg) {
		reg.addInterceptor(new LoginInterceptor())
		   .addPathPatterns("/baumann/**") //해당 requestURL에 대해 적용
		   .excludePathPatterns("/"
				   ,"/login"
				   ,"/logout"); //제외하고 싶은 White리스트
	}

}
