package com.project.sns.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.sns.user.bo.UserBO;
import com.project.sns.user.model.User;

@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 회원가입 API
	@PostMapping("/user/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("phoneNum") String phoneNum) {
		
		int count = userBO.addUser(loginId, password, name, phoneNum);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	// 아이디 중복 확인 API
	@GetMapping("/user/duplicate_id")
	public Map<String, Boolean> isDuplicate(String loginId) {
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicate(loginId)) { // 중복된 경우
			result.put("is_duplicate", true);
		} else { // 중복되지 않은 경우
			result.put("is_duplicate", false);
		}
		
		return result;
	}
	
	// 로그인 API
	@PostMapping("/user/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> map = new HashMap<>();
		
		if(user != null) {
			map.put("result", "success");
			
			HttpSession session = request.getSession();
			// userId, loginId, name
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId",  user.getLoginId());
			session.setAttribute("userName", user.getName());
			
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	

}
