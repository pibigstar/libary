package com.lei.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.support.spring.annotation.ResponseJSONP;
import com.lei.entity.Notice;
import com.lei.model.JSONModel;
import com.lei.service.NoticeServiceI;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	
	@Resource
	NoticeServiceI noticeService;
	
	@RequestMapping(params = "getNotice",method = RequestMethod.GET)
	@ResponseJSONP
	public JSONModel get() {
		JSONModel j = new JSONModel();
		Notice notice = noticeService.get();
		j.setMsg(notice.getContent());
		return j;
	}
	

}
