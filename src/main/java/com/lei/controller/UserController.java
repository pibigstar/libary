package com.lei.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.lei.entity.User;
import com.lei.model.JSONModel;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("login")
	public void login(User user,HttpServletRequest request,HttpServletResponse response) throws IOException {
		//return "redirect:toLogin.do";
		JSONModel j = new JSONModel();
		
		//得到当前用户
		Subject subject = SecurityUtils.getSubject();
		//通过前台传递过来的用户名和密码生成token
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
		try {
			//登录
			subject.login(token);
			//登录成后，会将登录者的信息存到session中，登录失败则会进到catch
			Session session = subject.getSession();
			request.setAttribute("userSession", session);
			j.setSuccess(true);
			j.setMsg("登录成功！");
			response.getWriter().write(JSON.toJSONString(j));
		} catch (Exception e) {
			//登录失败
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("用户名或密码错误");
			response.getWriter().write(JSON.toJSONString(j));
		}
	}

}
