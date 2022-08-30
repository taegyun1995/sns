package com.project.sns.config;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	// 요청이 들어올 때
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		// /post/main/view
		String uri = request.getRequestURI();
		
		//로그인이 되어있을 경우 로그인, 회원가입 화면으로 이동하지 못하도록
		if(userId != null) {
			// 회원가입 - /user/signup/view
			// 로그인 - /user/signin/view
			// /user로 시작하는 페이지로의 접근을 막고, 메인화면으로 이동
			if(uri.startsWith("/user")) {
				response.sendRedirect("/post/main/view");
				return false;
			}
		} else { // 로그인이 안되어있을 경우, 메인화면으로 이동하지 못하도록
			// post로 시작하는 페이지로의 접근을 막고, 로그인페이지로 이동
			if(uri.startsWith("/post")) {
				response.sendRedirect("/user/signin/view");
				return false;
			}
		}
		return true;
	}
	
	// 응답값이 만들어지기 전
	@Override
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView modelAndView) {
		
	}
	
	// 응답값이 완성된 이후
	@Override
	public void afterCompletion(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, Exception ex) {
		
	}
	

}
