/** 
 * <pre>项目名称:shop_admin_v2 
 * 文件名称:Brand.java 
 * 包名:com.fh.shop.backend.po 
 * 创建日期:2018年12月27日下午4:02:22 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */
package com.fh.shop.backend.vo;

import java.io.Serializable;


public class BrandVo  implements Serializable {


	private static final long serialVersionUID = 6053017086404920512L;
	private Integer id;
	private String brandName;

	private String createTime;


	private String updateTime;


	private String  brandImagePath;

	@Override
	public String toString() {
		return "BrandVo{" +
				"id=" + id +
				", brandName='" + brandName + '\'' +
				", createTime='" + createTime + '\'' +
				", updateTime='" + updateTime + '\'' +
				", brandImagePath='" + brandImagePath + '\'' +
				'}';
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getBrandImagePath() {
		return brandImagePath;
	}

	public void setBrandImagePath(String brandImagePath) {
		this.brandImagePath = brandImagePath;
	}
}
