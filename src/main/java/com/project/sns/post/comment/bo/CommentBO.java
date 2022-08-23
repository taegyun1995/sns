package com.project.sns.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sns.post.comment.dao.CommentDAO;
import com.project.sns.post.comment.model.Comment;
import com.project.sns.post.comment.model.CommentDetail;
import com.project.sns.user.bo.UserBO;
import com.project.sns.user.model.User;

@Service
public class CommentBO {
	
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, int postId, String content) {
		
		return commentDAO.insertComment(userId, postId, content);
	}
	
	// post id를 대상으로 해당하는 댓글들을 조회하는 기능
	public List<CommentDetail> getComment(int postId) {
		
		List<Comment> commentList = commentDAO.selectComment(postId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for(Comment comment : commentList) {
			
			int userId = comment.getUserId();
			User user = userBO.getUserById(userId);
			
			CommentDetail commentDetail = new CommentDetail();
			commentDetail.setComment(comment);
			commentDetail.setUser(user);
			
			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;
	}
	
	// 해당하는 postId의 모든 댓글 삭제
	public int deleteComment(int postId) {
		
		return commentDAO.deleteComment(postId);
	}
}
