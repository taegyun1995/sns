package com.project.sns.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sns.post.comment.dao.CommentDAO;
import com.project.sns.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, int postId, String content) {
		
		return commentDAO.insertComment(userId, postId, content);
	}
	
	public List<Comment> getComment(int postId) {
		
		return commentDAO.selectComment(postId);
	}
}
