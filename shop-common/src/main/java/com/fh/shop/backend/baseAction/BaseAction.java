package com.fh.shop.backend.baseAction;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.Map;

public class BaseAction implements Serializable {
	

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 5933002109694523902L;
	
	
	public void ajaxOutCast(Object obj,HttpServletResponse resp){
		//创建json的工具JsonConfig
		JsonConfig config = new JsonConfig();
		//对象中含有的时间类型转换json格式的处理
		//config.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor());
		//过滤不转换的属性
		config.setExcludes(new String[]{"handler","hibernateLazyInitializer"});   
		//序列化将object转换成json格式
	    JSON json = JSONSerializer.toJSON(obj, config);
	
		ajaxOut(json.toString(),resp); 
	}
	
	public void ajaxOutSuccess(String tips,HttpServletResponse resp){
		String jsonStr = "{\"success\":true,\"tips\":\""+tips+"\"}";
		ajaxOutCast(jsonStr,resp);
	}
	public void ajaxOutError(String tips,HttpServletResponse resp){
		String jsonStr = "{\"success\":false,\"tips\":\""+tips+"\"}";
		ajaxOut(jsonStr,resp);
	}
	
	public void ajaxOut(String jsonStr,HttpServletResponse resp){
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		String jsonString = "{\"success\":true,\"tips\":\""+jsonStr+"\"}";
		try { 
			resp.getWriter().write(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public static String getRankName(Map<String, String[]> parameterMap, String rankColumn) {
		return parameterMap.get("columns[" + rankColumn + "][data]")[0];
	}



}
