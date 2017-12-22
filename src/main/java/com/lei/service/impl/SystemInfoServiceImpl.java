package com.lei.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lei.dao.SystemInfoMapper;
import com.lei.entity.SystemInfo;
import com.lei.service.SystemInfoServiceI;

@Service("systemInfoService")
public class SystemInfoServiceImpl implements SystemInfoServiceI{

	@Resource
	private SystemInfoMapper systemInfoMapper;
	
	@Override
	public SystemInfo get() {
		return systemInfoMapper.selectByPrimaryKey(1);
	}

	@Override
	public void update(SystemInfo info) {
		systemInfoMapper.updateByPrimaryKeySelective(info);
	}

	
	
}
