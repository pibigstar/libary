package com.lei.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.support.spring.annotation.ResponseJSONP;
import com.lei.entity.SystemInfo;
import com.lei.model.Result;
import com.lei.service.SystemInfoServiceI;

@Controller
@RequestMapping(value = "sysInfo")
public class SystemInfoController {

	@Resource
	private SystemInfoServiceI systemInfoService;
	
	@RequestMapping(params = "toSysInfo")
	public String toSystemInfo(HttpServletRequest request) {
		SystemInfo systemInfo = systemInfoService.get();
		request.setAttribute("sysInfo", systemInfo);
		return "page/systemParameter/systemParameter";
	}
	
	@RequestMapping(params = "getInfo")
	@ResponseJSONP
	public Result<SystemInfo> getInfo(HttpServletRequest request) {
		SystemInfo systemInfo = systemInfoService.get();
		Result<SystemInfo> result = new Result<>();
		result.setCode(0);
		result.setData(systemInfo);
		result.setMsg("成功");
		return result;
	}
	
	@RequestMapping(params = "updateInfo")
	@ResponseJSONP
	public Result<SystemInfo> updateInfo(SystemInfo info) {
		systemInfoService.update(info);
		Result<SystemInfo> result = new Result<>();
		result.setCode(0);
		result.setMsg("成功");
		return result;
	}
	
}
