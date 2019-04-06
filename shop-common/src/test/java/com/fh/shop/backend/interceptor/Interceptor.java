/** 
 * <pre>项目名称:shop_admin_v2 
 * 文件名称:Interceptor.java 
 * 包名:com.fh.shop.backend.interceptor 
 * 创建日期:2019年1月13日下午2:18:08 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.interceptor;


import com.fh.shop.backend.po.User;
import com.fh.shop.backend.util.CookieUtil;
import com.fh.shop.backend.util.Global;
import com.fh.shop.backend.util.RedisUtil;
import com.google.gson.Gson;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Interceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String requestURI = request.getRequestURI();
		StringBuffer requestURL = request.getRequestURL();
		//System.out.println(requestURI+":"+requestURL);

		if(Global.WHITE_LIST_URLS.contains(requestURI)){
			return true;}
		/*if(requestURI.contains("/user/toLogin.jhtml")||requestURI.contains("/user/findUser.jhtml")||requestURI.contains("/user/findUser.jhtml")||requestURI.contains("/user/addUser.jhtml")||requestURI.contains("/user/validateUserName.jhtml")){
			return true;
		}*/
		/*if(requestURI.endsWith("/user/toLogin.jhtml")||requestURI.endsWith("/user/findUser.jhtml")||requestURI.endsWith("/user/findUser.jhtml")||requestURI.endsWith("/user/addUser.jhtml")||requestURI.endsWith("/user/validateUserName.jhtml")){
			return true;
		}*/
		
		//User user = (User)request.getSession().getAttribute("user");
		String fh_id = CookieUtil.readCookie(request, Global.REDIS_SESSION_SESSIONID);
		if(StringUtils.isEmpty(fh_id)){

			response.sendRedirect(request.getContextPath()+"/user/toLogin.jhtml");
			return false;
		}
		String userDBJson = RedisUtil.get(Global.REDIS_SESSION_USERDB+fh_id);
		Gson gson = new Gson();
		User userRedis = gson.fromJson(userDBJson, User.class);
		request.getSession().setAttribute("user",userRedis);
		User user = (User)request.getSession().getAttribute("user");

		if(StringUtils.isNotEmpty(userDBJson)){
			/*session续命*/
		RedisUtil.expire(Global.REDIS_SESSION_USERDB+fh_id,30*60);


		return true;
		}
		response.sendRedirect(request.getContextPath()+"/user/toLogin.jhtml");
		return false;
	}

}
