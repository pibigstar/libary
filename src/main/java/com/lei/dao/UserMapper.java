package com.lei.dao;

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
}