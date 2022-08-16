package com.project.sns.post.model;

import com.project.sns.user.model.User;

public class PostDetail {
	// User 정보
	private User user;
	// Post 정보
	private Post post;
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}

}