package com.lei.dao;

import java.util.List;

import com.lei.entity.FriendLink;

public interface FriendLinkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FriendLink record);

    int insertSelective(FriendLink record);

    FriendLink selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FriendLink record);

    int updateByPrimaryKey(FriendLink record);

	List<FriendLink> findLinks(FriendLink friendLink);
}