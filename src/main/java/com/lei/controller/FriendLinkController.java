package com.lei.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.support.spring.annotation.ResponseJSONP;
import com.lei.entity.FriendLink;
import com.lei.model.Result;
import com.lei.service.FriendLinkServiceI;

@Controller
@RequestMapping(value = "link")
public class FriendLinkController {
	
	@Resource
	private FriendLinkServiceI friendLinkService;
	
	@RequestMapping(params = "list")
	@ResponseJSONP
	public Result<List<FriendLink>> list(FriendLink friendLink) {
		Result<List<FriendLink>> result = new Result<>();
		try {
			List<FriendLink> links = friendLinkService.list(friendLink);
			result.setCode(0);
			result.setData(links);
		} catch (Exception e) {
			e.printStackTrace();
			result.setCode(100);
			result.setMsg(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(params = "toLink")
	public String toListLink() {
		return "page/links/listLink";
	}
	
}
