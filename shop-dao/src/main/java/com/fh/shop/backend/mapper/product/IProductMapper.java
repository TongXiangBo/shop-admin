/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:IProductMapper.java 
 * 包名:com.fh.shop.backend.mapper.product 
 * 创建日期:2018年12月24日下午2:03:22 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.product;

import com.fh.shop.backend.po.ImageVO;
import com.fh.shop.backend.po.Product;

import java.util.List;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：IProductMapper    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月24日 下午2:03:22    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月24日 下午2:03:22    
 * 修改备注：       
 * @version </pre>    
 */
public interface IProductMapper {

	/** <pre>addProduct(添加产品)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月24日 下午2:04:58    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月24日 下午2:04:58    
	 * 修改备注： 
	 * @param product</pre>    
	 */
public	void addProduct(Product product);

	/** <pre>findProductList(分页查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午2:22:10    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午2:22:10    
	 * 修改备注： 
	 * @param product 
	 * @return</pre>    
	 */
	public List<Product> findProductList(Product product);

	/** <pre>deleteProduct(删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午2:41:57    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午2:41:57    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	public void deleteProduct(Integer id);

	/** <pre>batchDelete(批量删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午9:21:51    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午9:21:51    
	 * 修改备注： 
	 * @param list</pre>    
	 */
	public void batchDelete(List<Integer> list);

	/** <pre>toUpdateProduct(回显)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 下午2:29:01    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 下午2:29:01    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	public Product toUpdateProduct(Integer id);

	/** <pre>updateProduct(修改)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 下午2:44:53    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 下午2:44:53    
	 * 修改备注： 
	 * @param product</pre>    
	 */
	public void updateProduct(Product product);

	/** <pre>findTotalCount(总页数查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 下午8:21:27    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 下午8:21:27    
	 * 修改备注： 
	 * @param product
	 * @return</pre>    
	 */
	public Long findTotalCount(Product product);

	/**
	 * <pre>rankPriceAsc(价格降序)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月4日 下午3:34:32    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月4日 下午3:34:32    
	 * 修改备注： 
	 * @param product
	 * @return</pre>
	 */
	 List<Product> rankPriceAsc(Product product);

    List<Product> findProductExcel(Product product);

    void addImagePath(ImageVO imageVO);

	List<ImageVO> findProductImage();


	List<ImageVO> LookProductImage(Integer uuid);

    void updateImagePath(ImageVO imageVO);


    void deleteImage(String imagePath);

	List<ImageVO> findProductIdList(String imagePath);

	void deleteImageById(Integer id);


    List<Product> findProudctListAPI();
}


