package com.lei.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.support.spring.annotation.ResponseJSONP;
import com.lei.entity.Notice;
import com.lei.model.JSONModel;
import com.lei.model.Result;
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
	
	@RequestMapping(params = "toNotice")
	public String toNotice(HttpServletRequest request) {
		Notice notice = noticeService.get();
		request.setAttribute("notice", notice);
		return "page/announcement";
	}
	
	@RequestMapping(params = "changeNotice")
	@ResponseJSONP
	public Result<Notice> change(Notice notice) {
		Result<Notice> result = new Result<>();
		try {
			noticeService.update(notice);
			result.setCode(0);
			result.setMsg("更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(100);
			result.setMsg("更新失败");
		}
		return result;
	}
	

}
