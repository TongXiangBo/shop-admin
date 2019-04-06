/** 
 * <pre>项目名称:shop_admin_v2 
 * 文件名称:Product.java 
 * 包名:com.fh.shop.backend.po 
 * 创建日期:2018年12月23日下午8:54:58 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;


/** 
 * <pre>项目名称：shop_admin_v2    
 * 类名称：Product    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月23日 下午8:54:58    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月23日 下午8:54:58    
 * 修改备注：       
 * @version </pre>    
 */
public class Product extends Page implements Serializable{
	private static final long serialVersionUID = 9094172919080414504L;
	
	private  Integer  id;
	private  String  productName;
	private  Float  price;
	
	private  Float  minPrice;
	private  Float  maxPrice;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private  Date   createTime;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private  Date   minCreateTime;
	@DateTimeFormat(pattern="yyyy-M-dd")
	private  Date   maxCreateTime;
	
	private  Date   updateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private  Date   minUpdateTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private  Date   maxUpdateTime;
	//图片展示
	private String  imagePath;
	private String  oldImagePath;
	//uuid
	private String  imageCode;
	//主图路径
	private String  imageHead;


	private ImageVO imageVO;

	@Override
	public String toString() {
		return "Product{" +
				"id=" + id +
				", productName='" + productName + '\'' +
				", price=" + price +
				", minPrice=" + minPrice +
				", maxPrice=" + maxPrice +
				", createTime=" + createTime +
				", minCreateTime=" + minCreateTime +
				", maxCreateTime=" + maxCreateTime +
				", updateTime=" + updateTime +
				", minUpdateTime=" + minUpdateTime +
				", maxUpdateTime=" + maxUpdateTime +
				", imagePath='" + imagePath + '\'' +
				", oldImagePath='" + oldImagePath + '\'' +
				", imageCode='" + imageCode + '\'' +
				", imageHead='" + imageHead + '\'' +
				", imageVO=" + imageVO +
				", minCreateTimeStr='" + minCreateTimeStr + '\'' +
				", maxCreateTimeStr='" + maxCreateTimeStr + '\'' +
				", minUpdateTimeStr='" + minUpdateTimeStr + '\'' +
				", maxUpdateTimeStr='" + maxUpdateTimeStr + '\'' +
				", rank=" + rank +
				", brand=" + brand +
				'}';
	}

	public ImageVO getImageVO() {
		return imageVO;
	}

	public void setImageVO(ImageVO imageVO) {
		this.imageVO = imageVO;
	}

	public String getImageHead() {
		return imageHead;
	}

	public void setImageHead(String imageHead) {
		this.imageHead = imageHead;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	public String getOldImagePath() {
		return oldImagePath;
	}

	public void setOldImagePath(String oldImagePath) {
		this.oldImagePath = oldImagePath;
	}
	//string类时间


	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	private  String   minCreateTimeStr;
	private  String   maxCreateTimeStr;
	

	private  String   minUpdateTimeStr;
	private  String   maxUpdateTimeStr;
	
	private  Integer   rank;
	
	
	
	public Integer getRank() {
		return rank;
	}


	public void setRank(Integer rank) {
		this.rank = rank;
	}


	private  Brand  brand =new  Brand();


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public Float getPrice() {
		return price;
	}


	public void setPrice(Float price) {
		this.price = price;
	}


	public Float getMinPrice() {
		return minPrice;
	}


	public void setMinPrice(Float minPrice) {
		this.minPrice = minPrice;
	}


	public Float getMaxPrice() {
		return maxPrice;
	}


	public void setMaxPrice(Float maxPrice) {
		this.maxPrice = maxPrice;
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


	public Brand getBrand() {
		return brand;
	}


	public void setBrand(Brand brand) {
		this.brand = brand;
	}


}
