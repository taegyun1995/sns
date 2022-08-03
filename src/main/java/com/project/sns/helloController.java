package com.project.sns;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class helloController {
	
	@GetMapping("/project/hello")
	public String hello() {
		
		return "hello/helloworld";
	}

}
