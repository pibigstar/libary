package com.lei.service;

import com.lei.entity.User;

public interface UserServiceI {

	/**
	 * ͨ根据用户名返回用户实体
	 * @param userName
	 * @return
	 */
	public User findUserByUserName(String username);
	
}
