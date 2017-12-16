package com.lei.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lei.dao.UserMapper;
import com.lei.dao.UserRoleMapper;
import com.lei.entity.User;
import com.lei.entity.UserRole;
import com.lei.service.UserServiceI;


@Service("userService")
public class UserServiceImpl implements UserServiceI{

	@Resource
	private UserMapper userMapper;
	
	@Resource
	private UserRoleMapper userRoleMapper;
	
	
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


	@Override
	@Transactional
	public void addUser(User user,String role) {
		String id = UUID.randomUUID().toString().replaceAll("-","");
		user.setUserId(id);
		user.setUpdateTime(new Date());
		user.setCreateTime(new Date());
		UserRole userRole = new UserRole();
		
		userRole.setRoleId(role);
		userRole.setUserId(id);
		userRoleMapper.insert(userRole);
		userMapper.insertSelective(user);
	}
}
