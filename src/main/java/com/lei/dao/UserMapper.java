package com.lei.dao;

import java.util.List;

import com.lei.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
	/**
	 * 根据用户名返回用户实体
	 * @param userName
	 * @return
	 */
	public User findUserByUserName(String username);

	List<User> listUser();

	List<User> findUserByName(String username);
}