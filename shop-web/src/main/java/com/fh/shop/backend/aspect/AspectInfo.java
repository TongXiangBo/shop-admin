/** 
 * <pre>项目名称:shop-admin-v1 
 * 文件名称:AspectInfo.java 
 * 包名:com.fh.shop.backend.aspect 
 * 创建日期:2019年1月18日下午1:46:34 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.aspect;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fh.shop.backend.biz.user.IUserservice;
import com.fh.shop.backend.po.LoginInfo;
import com.fh.shop.backend.po.User;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.fh.shop.backend.common.ResponseEnum;
import com.fh.shop.backend.common.ServerResponse;

public class AspectInfo {
	@Autowired
	private HttpServletRequest request;
	@Resource
	private IUserservice userService;

	private  static final  Logger LOG=LoggerFactory.getLogger(AspectInfo.class);
	public  Object around(ProceedingJoinPoint pjp){
		//HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		//动态获取类名
		String  className=pjp.getTarget().getClass().getName();
		//动态获取方法名
		String  methodName=pjp.getSignature().getName();
	    LOG.info("进入**{}**类==={}方法********开始",className,methodName);	
	    //获取登陆信息
		User user = (User) request.getSession().getAttribute("user");
		LoginInfo loginInfo = new  LoginInfo();
		
		if(null!=user){
			loginInfo.setStartTime(new Date());
	   }
		Object result=null;
		   try {
			   	   
			result = pjp.proceed();
			LOG.info("执行**{}**类==={}方法********成功",className,methodName);			
		} catch (Throwable e) {
			e.printStackTrace();
			LOG.info("执行**{}**类==={}方法********失败{}",className,methodName,e.getMessage());
			return  ServerResponse.error(ResponseEnum.SYSTEMERROR);
		}
		   if(null!=user){
				loginInfo.setUserName(user.getUserName());
				loginInfo.setEndTime(new Date());
				loginInfo.setClassPath(pjp.getTarget().getClass().getName() );
				loginInfo.setMethod(pjp.getSignature().getName() );
				loginInfo.setIp(request.getRemoteAddr());
				 userService.addLoginInfo(loginInfo);
		   }
		   LOG.info("执行**{}**类==={}方法********结束",className,methodName);		  
		return  result;
	}

}
