package com.project.sns.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.sns.common.FileManagerService;
import com.project.sns.post.comment.bo.CommentBO;
import com.project.sns.post.comment.model.CommentDetail;
import com.project.sns.post.dao.PostDAO;
import com.project.sns.post.like.bo.LikeBO;
import com.project.sns.post.model.Post;
import com.project.sns.post.model.PostDetail;
import com.project.sns.user.bo.UserBO;
import com.project.sns.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	public int addPost(int userId, String content, MultipartFile file) {
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<PostDetail> getPostList(int loginUserId) {
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		List<Post> postList = postDAO.selectPostList();
		
		for(Post post : postList) {
			
			int userId = post.getUserId();
			int postId = post.getId();
			
			// user 테이블 조회
			// userBo를 통해서 userId 와 일치하는 사용자 정보 조회
			User user = userBO.getUserById(userId);
			int likeCount = likeBO.countLike(postId);
			List<CommentDetail> commentList = commentBO.getComment(postId);
			boolean islike = likeBO.isLike(postId, loginUserId);
			
			// 게시글과 사용자 정보를 합치는 과정
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			postDetail.setLikeCount(likeCount);
			postDetail.setComment(commentList);
			postDetail.setlike(islike);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
}