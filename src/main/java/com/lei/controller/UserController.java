package com.lei.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.support.spring.annotation.ResponseJSONP;
import com.lei.entity.User;
import com.lei.model.DataListModel;
import com.lei.model.JSONModel;
import com.lei.service.UserServiceI;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserServiceI userService;
	
	
	@RequestMapping(params = "login")
	@ResponseJSONP
	public JSONModel login(User user,String code,HttpSession httpsession) throws IOException {
		//return "redirect:toLogin.do";
		JSONModel j = new JSONModel();
		
		String imgCode = (String) httpsession.getAttribute("code");
		if (!imgCode.equals(code.toUpperCase())) {
			j.setSuccess(false);
			j.setMsg("验证码错误！");
			return j;
		}
		//得到当前用户
		Subject subject = SecurityUtils.getSubject();
		//通过前台传递过来的用户名和密码生成token
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
		try {
			//登录
			subject.login(token);
			//登录成后，会将登录者的信息存到session中，登录失败则会进到catch
			Session session = subject.getSession();
			User exitUser = userService.findUserByUserName(user.getUsername());
			session.setAttribute("user", exitUser);
			session.setAttribute("userSession", session);
			j.setSuccess(true);
			j.setMsg("登录成功！");
		} catch (Exception e) {
			//登录失败
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("用户名或密码错误");
		}
		return j;
	}
	
	@RequestMapping(params = "update")
	@ResponseJSONP
	public JSONModel updateUser(User user) {
		JSONModel j = new JSONModel();
		try {
			userService.updateUser(user);
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		}
		return j;
		
	}
	
	
	@RequestMapping(params = "changePwd")
	@ResponseJSONP
	public JSONModel changePwd(User user,String newPassword) {
		JSONModel j = new JSONModel();
		try {
			User exitUser = userService.getUserById(user.getUserId());
			String inputPwd = user.getPassword();
			String sysPwd = exitUser.getPassword();
			if (!sysPwd.equals(inputPwd)) {
				j.setSuccess(false);
				j.setMsg("旧密码输入错误！");
				return j;
			}
			user.setPassword(newPassword);
			userService.changePwd(user);
			j.setMsg("密码修改成功");
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg(e.getMessage());
			j.setSuccess(false);
		}
		return j;
		
	}
	
	
	@RequestMapping(params = "listUser")
	@ResponseJSONP
	public DataListModel listUser() {
		DataListModel d = new DataListModel();
		try {
			List<User> users = userService.listUser();
			d.setData(users);
		} catch (Exception e) {
			e.printStackTrace();
			d.setMsg(e.getMessage());
		}
		return d;
		
	}
	
	@RequestMapping(params = "addUser")
	@ResponseJSONP
	public DataListModel addUser(User user,String role) {
		DataListModel d = new DataListModel();
		try {
			userService.addUser(user,role);
			d.setMsg("添加用户成功！");
			d.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			d.setSuccess(false);
			d.setMsg("添加用户失败！");
			d.setMsg(e.getMessage());
		}
		return d;
		
	}
	
	
	@RequestMapping(params = "toLogin")
	public String toLogin() {
		return "page/login/login";
	}
	
	@RequestMapping(params = "toUserInfo")
	public String toUserInfo() {
		return "page/user/userInfo";
	}
	
	@RequestMapping(params = "toChangePwd")
	public String toChangePwd() {
		return "page/user/changePwd";
	}
	
	@RequestMapping(params = "toListUser")
	public String toListUser() {
		return "page/user/listUser";
	}
	
	@RequestMapping(params = "toAddUser")
	public String toAddUser() {
		return "page/user/addUser";
	}

}