package com.project.sns.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sns.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int addlkie(int userId, int postId) {
		
		return likeDAO.insertLike(userId, postId);
	}
	
	// postId로 좋아요 개수 조회
	public int countLike(int postId) {
		
		return likeDAO.selectCountLike(postId);
	}
}