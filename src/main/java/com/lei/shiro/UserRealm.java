package com.lei.shiro;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.lei.entity.Permission;
import com.lei.entity.Role;
import com.lei.entity.User;
import com.lei.service.UserServiceI;

public class UserRealm extends AuthorizingRealm{

	@Resource
	private UserServiceI userService;
	
	/**
	 * 此函数在身份认证后也被调用
	 * 为当前登录的用户赋予角色和权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//得到当前登录用户的信息
		String username = (String) principals.getPrimaryPrincipal();
		
		SimpleAuthorizationInfo author = new SimpleAuthorizationInfo();
		
		Set<Role> roles = userService.findUserByUserName(username).getRoleSet();
		Set<Permission> permissions = new HashSet<>();
		//赋予角色
		for (Role role : roles) {
			author.addRole(role.getName());
			System.out.println(role.getName());
			permissions.addAll(role.getPermissionSet());
		}
		System.out.println("==============");
		//赋予权限
		for (Permission permission : permissions) {
			System.out.println(permission.getName());
			author.addStringPermission(permission.getName());
		}
		return author;
	}

	/**
	 * 验证身份信息  
	 * subject.login(token)调用后会调用此函数
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String userName =(String) token.getPrincipal();
		User user = userService.findUserByUserName(userName);
		if (user!=null) {
			//如果数据库里面有此用户，就进行身份验证
			AuthenticationInfo authen = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), "xx");
			return authen;
		}
		return null;
	}

}
