package com.project.sns.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.sns.common.FileManagerService;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file://" + FileManagerService.IMAGE_UPLOAD_PATH);
	}
	
	// 인터셉터 등록
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**") // 어떤 경로(path)가 인터셉터를 거쳐서 수행될지 설정
		.excludePathPatterns("/static/**", "/images/**", "/user/sign/out");
	}
}
