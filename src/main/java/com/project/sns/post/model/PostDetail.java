package com.project.sns.post.model;

import com.project.sns.post.comment.model.Comment;
import com.project.sns.user.model.User;

public class PostDetail {
	// User 정보
	private User user;
	// Post 정보
	private Post post;
	
	private int likeCount;
	
	private Comment comment;
	
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
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