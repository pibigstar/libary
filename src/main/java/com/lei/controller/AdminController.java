package com.lei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("toLogin")
	public String toLogin() {
		System.out.println("*********");
		return "admin_login";
	}
	

}
