package com.lei.service;

import java.util.List;

import com.lei.entity.User;

public interface UserServiceI {

	/**
	 * ͨ根据用户名返回用户实体
	 * @param userName
	 * @return
	 */
	public User findUserByUserName(String username);

	public void updateUser(User user);

	public void changePwd(User user);

	public User getUserById(String id);

	public List<User> listUser();

	public void addUser(User user,String role);

	public List<User> findUserByName(String username);
	
}
