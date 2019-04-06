/** 
 * <pre>项目名称:shop_admin_v2 
 * 文件名称:LoginInfo.java 
 * 包名:com.fh.shop.backend.po 
 * 创建日期:2019年1月12日下午8:13:31 
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/** 
 * <pre>项目名称：shop_admin_v2    
 * 类名称：LoginInfo    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2019年1月12日 下午8:13:31    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2019年1月12日 下午8:13:31    
 * 修改备注：       
 * @version </pre>    
 */
public class LoginInfo extends Page{
  private  Integer  id;	
  private  String  userName;
  private  String  method;
  private  String  classPath;
  private  Date    startTime;
  private  Date    endTime;
  private  String   ip;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
	private  Date    minStartTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private  Date    maxStartTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private  Date    minEndTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private  Date    maxEndTime;


	@Override
	public String toString() {
		return "LoginInfo{" +
				"id=" + id +
				", userName='" + userName + '\'' +
				", method='" + method + '\'' +
				", classPath='" + classPath + '\'' +
				", startTime=" + startTime +
				", endTime=" + endTime +
				", ip='" + ip + '\'' +
				", minStartTime=" + minStartTime +
				", maxStartTime=" + maxStartTime +
				", minEndTime=" + minEndTime +
				", maxEndTime=" + maxEndTime +
				", startTimeStr='" + startTimeStr + '\'' +
				", endTimeStr='" + endTimeStr + '\'' +
				'}';
	}

	public Date getMinStartTime() {
		return minStartTime;
	}

	public void setMinStartTime(Date minStartTime) {
		this.minStartTime = minStartTime;
	}

	public Date getMaxStartTime() {
		return maxStartTime;
	}

	public void setMaxStartTime(Date maxStartTime) {
		this.maxStartTime = maxStartTime;
	}

	public Date getMinEndTime() {
		return minEndTime;
	}

	public void setMinEndTime(Date minEndTime) {
		this.minEndTime = minEndTime;
	}

	public Date getMaxEndTime() {
		return maxEndTime;
	}

	public void setMaxEndTime(Date maxEndTime) {
		this.maxEndTime = maxEndTime;
	}

	public String getStartTimeStr() {
		return startTimeStr;
	}

	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}

	public String getEndTimeStr() {
		return endTimeStr;
	}

	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}

	private  String    startTimeStr;
	private  String    endTimeStr;

public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getMethod() {
	return method;
}
public void setMethod(String method) {
	this.method = method;
}
public String getClassPath() {
	return classPath;
}
public void setClassPath(String classPath) {
	this.classPath = classPath;
}
public Date getStartTime() {
	return startTime;
}
public void setStartTime(Date startTime) {
	this.startTime = startTime;
}
public Date getEndTime() {
	return endTime;
}
public void setEndTime(Date endTime) {
	this.endTime = endTime;
}
public String getIp() {
	return ip;
}
public void setIp(String ip) {
	this.ip = ip;
}


}
