package com.project.sns.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.project.sns.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(@Param("loginId") String loginId
							, @Param("password") String password
							, @Param("name") String name
							, @Param("phoneNum") String phoneNum);
	
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
}
