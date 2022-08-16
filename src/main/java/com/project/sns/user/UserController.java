package com.project.sns.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	// 로그인 화면
	@GetMapping("/user/signin/view")
	public String signinView() {
		return "user/signin";
	}
	
	// 회원가입화면
	@GetMapping("/user/signup/view")
	public String signupView() {
		return "user/signup";
	}
	
	// 로그아웃
	@GetMapping("/user/signout")
	public String signOut(HttpServletRequest request) {
		// 로그아웃 과정
		// 세션에 로그인 정보 제거 
		
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/signin/view";
	}

}