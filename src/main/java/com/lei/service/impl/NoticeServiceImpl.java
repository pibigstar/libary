package com.lei.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lei.dao.NoticeMapper;
import com.lei.entity.Notice;
import com.lei.service.NoticeServiceI;
import com.sun.tools.corba.se.idl.constExpr.Not;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeServiceI{
	
	@Resource
	private NoticeMapper noticeMapper;

	@Override
	public Notice get() {
		return noticeMapper.selectByPrimaryKey(1);
	}

	@Override
	public void update(Notice notice) {
		noticeMapper.updateByPrimaryKeySelective(notice);
	}
	
}
