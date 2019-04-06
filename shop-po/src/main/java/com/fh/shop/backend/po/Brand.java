/** 
 * <pre>项目名称:shop_admin_v2 
 * 文件名称:Brand.java 
 * 包名:com.fh.shop.backend.po 
 * 创建日期:2018年12月27日下午4:02:22 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */
package com.fh.shop.backend.po;


import com.fh.shop.backend.vo.DatatableVo;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * <pre>
 * 项目名称：shop_admin_v2    
 * 类名称：Brand    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月27日 下午4:02:22    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月27日 下午4:02:22    
 * 修改备注：       
 * &#64;version
 * </pre>
 */
public class Brand extends DatatableVo implements Serializable {

	private static final long serialVersionUID = -3674985657773334593L;

	private Integer id;
	private String brandName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date minCreateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date maxCreateTime;

	private Date updateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date minUpdateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date maxUpdateTime;

	private String  brandImagePath;

	@Override
	public String toString() {
		return "Brand{" +
				"id=" + id +
				", brandName='" + brandName + '\'' +
				", createTime=" + createTime +
				", minCreateTime=" + minCreateTime +
				", maxCreateTime=" + maxCreateTime +
				", updateTime=" + updateTime +
				", minUpdateTime=" + minUpdateTime +
				", maxUpdateTime=" + maxUpdateTime +
				", brandImagePath='" + brandImagePath + '\'' +
				", imagePath='" + imagePath + '\'' +
				", minCreateTimeStr='" + minCreateTimeStr + '\'' +
				", maxCreateTimeStr='" + maxCreateTimeStr + '\'' +
				", minUpdateTimeStr='" + minUpdateTimeStr + '\'' +
				", maxUpdateTimeStr='" + maxUpdateTimeStr + '\'' +
				'}';
	}

	public String getBrandImagePath() {
		return brandImagePath;
	}

	public void setBrandImagePath(String brandImagePath) {
		this.brandImagePath = brandImagePath;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	private String imagePath;

	// string类时间

	private String minCreateTimeStr;
	private String maxCreateTimeStr;

	private String minUpdateTimeStr;
	private String maxUpdateTimeStr;

	public String getMinCreateTimeStr() {
		return minCreateTimeStr;
	}

	public void setMinCreateTimeStr(String minCreateTimeStr) {
		this.minCreateTimeStr = minCreateTimeStr;
	}

	public String getMaxCreateTimeStr() {
		return maxCreateTimeStr;
	}

	public void setMaxCreateTimeStr(String maxCreateTimeStr) {
		this.maxCreateTimeStr = maxCreateTimeStr;
	}

	public String getMinUpdateTimeStr() {
		return minUpdateTimeStr;
	}

	public void setMinUpdateTimeStr(String minUpdateTimeStr) {
		this.minUpdateTimeStr = minUpdateTimeStr;
	}

	public String getMaxUpdateTimeStr() {
		return maxUpdateTimeStr;
	}

	public void setMaxUpdateTimeStr(String maxUpdateTimeStr) {
		this.maxUpdateTimeStr = maxUpdateTimeStr;
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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getMinCreateTime() {
		return minCreateTime;
	}

	public void setMinCreateTime(Date minCreateTime) {
		this.minCreateTime = minCreateTime;
	}

	public Date getMaxCreateTime() {
		return maxCreateTime;
	}

	public void setMaxCreateTime(Date maxCreateTime) {
		this.maxCreateTime = maxCreateTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getMinUpdateTime() {
		return minUpdateTime;
	}

	public void setMinUpdateTime(Date minUpdateTime) {
		this.minUpdateTime = minUpdateTime;
	}

	public Date getMaxUpdateTime() {
		return maxUpdateTime;
	}

	public void setMaxUpdateTime(Date maxUpdateTime) {
		this.maxUpdateTime = maxUpdateTime;
	}

}
