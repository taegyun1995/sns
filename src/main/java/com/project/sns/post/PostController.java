package com.project.sns.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.sns.post.bo.PostBO;
import com.project.sns.post.model.PostDetail;

@Controller
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/post/main/view")
	public String mainView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postDetailList = postBO.getPostList(userId);
		model.addAttribute("postList", postDetailList);
		// 데이터 조회해서 model 객체에 값을 저장한다. 
		
		return "post/main";
	}

}