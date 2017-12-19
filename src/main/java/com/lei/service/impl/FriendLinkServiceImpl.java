package com.lei.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lei.dao.FriendLinkMapper;
import com.lei.entity.FriendLink;
import com.lei.service.FriendLinkServiceI;

@Service("friendLinkService")
public class FriendLinkServiceImpl implements FriendLinkServiceI{

	@Resource
	private FriendLinkMapper friendLinkMapper;
	
	@Override
	public List<FriendLink> list(FriendLink friendLink) {
		
		return friendLinkMapper.findLinks(friendLink);
	}

}
