package com.project.sns.post.model;

import java.util.List;

import com.project.sns.post.comment.model.Comment;
import com.project.sns.post.comment.model.CommentDetail;
import com.project.sns.user.model.User;

public class PostDetail {
	// User 정보
	private User user;
	// Post 정보
	private Post post;
	
	private int likeCount;
	
	private List<CommentDetail> comment ;
	
	private boolean islike;
	
	
	public boolean islike() {
		return islike;
	}
	public void setlike(boolean islike) {
		this.islike = islike;
	}
	public void setComment(List<CommentDetail> comment) {
		this.comment = comment;
	}
	public List<CommentDetail> getComment() {
		return comment;
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