/** 
 * <pre>项目名称:shop_admin_v2 
 * 文件名称:Product.java 
 * 包名:com.fh.shop.backend.po 
 * 创建日期:2018年12月23日下午8:54:58 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.po;

import java.io.Serializable;


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
public class ProductApiVo implements Serializable{
	private static final long serialVersionUID = 9094172919080414504L;

	private  Integer  id;
	private  String  productName;
	private  Float  price;
	private String  imagePath;


	@Override
	public String toString() {
		return "ProductApiVo{" +
				"id=" + id +
				", productName='" + productName + '\'' +
				", price=" + price +
				", imagePath='" + imagePath + '\'' +
				'}';
	}

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

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
}
