package com.lei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/portal")
public class IndexController {

	@RequestMapping(params = "toIndex")
	public String toLogin() {
		return "index";
	}
	
}
