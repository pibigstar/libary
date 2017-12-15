package com.lei.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.lei.dao.UserMapper;
import com.lei.entity.User;
import com.lei.service.UserServiceI;


@Service("userService")
public class UserServiceImpl implements UserServiceI{

	@Resource
	private UserMapper userMapper;
	
	
	@Override
	public User findUserByUserName(String username) {
		return userMapper.findUserByUserName(username);
	}


	@Override
	public void updateUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}


	@Override
	public void changePwd(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}


	@Override
	public User getUserById(String id) {
		
		return userMapper.selectByPrimaryKey(id);
	}


	@Override
	public List<User> listUser() {
		return userMapper.listUser();
	}
}
