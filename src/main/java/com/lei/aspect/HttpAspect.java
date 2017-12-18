package com.lei.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class HttpAspect {

	 private final static Logger logger = LoggerFactory.getLogger(HttpAspect.class);


	    //定义一个切面方法，拦截GirlController下面的所有方法,(..) ..代表所有参数
	    @Pointcut("execution(public * com.lei.controller.UserController.*(..))")
	    public void log(){
	    }

	    @Before("log()")
	    public void doBefore(JoinPoint joinPoint){
	        logger.info("调用方法前。。。。。");

	        ServletRequestAttributes attributes =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
	        HttpServletRequest request = attributes.getRequest();

	        //url
	        logger.info("url={}",request.getRequestURL());
	        //ip
	        logger.info("ip={}",request.getRemoteAddr());
	        //method
	        logger.info("method={}",request.getMethod());
	        //类方法
	        logger.info("class_method={}",joinPoint.getSignature().getDeclaringTypeName()+"."+joinPoint.getSignature().getName());
	        //参数
	        logger.info("args={}",joinPoint.getArgs());

	    }

	    @After("log()")
	    public void doAfter(){
	       logger.info("调用方法后。。。。。。");
	    }

	    //return 后
	    @AfterReturning(returning = "object",pointcut = "log()")
	    public void doAfterReturning(Object object){
	        logger.info("response={}",object.toString());
	    }
	
	
}
