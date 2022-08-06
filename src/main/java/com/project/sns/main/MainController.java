package com.project.sns.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("sportgram/main/view")
	public String postList() {
		
		return "main/view";
	}
}
