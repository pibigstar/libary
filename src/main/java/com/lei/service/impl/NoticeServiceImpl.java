package com.lei.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lei.dao.NoticeMapper;
import com.lei.entity.Notice;
import com.lei.service.NoticeServiceI;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeServiceI{
	
	@Resource
	private NoticeMapper noticeMapper;

	@Override
	public Notice get() {
		return noticeMapper.selectByPrimaryKey(1);
	}
	
}
