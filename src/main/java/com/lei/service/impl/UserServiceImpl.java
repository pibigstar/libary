package com.lei.service.impl;

import java.util.HashSet;
import java.util.Set;
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
}
