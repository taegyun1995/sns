package com.project.sns.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int deleteLike(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int selectCountLike(@Param("postId") int postId);
	
	public int selectCountLikeByPostUserId(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int deleteLikeByPostId(@Param("postId") int postId);
}
