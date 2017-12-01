package com.lei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class IndexController {

	@RequestMapping(value = "toLogin")
	public String toLogin() {
		return "index";
		
	}
	@RequestMapping(value = "toMain")
	public String toMain() {
		return "main";
	}
	
}
