/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:IProductService.java 
 * 包名:com.fh.shop.backend.biz.product 
 * 创建日期:2018年12月23日下午7:39:51 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.product;

import com.fh.shop.backend.po.ImageVO;
import com.fh.shop.backend.po.Product;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：IProductService    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月23日 下午7:39:51    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月23日 下午7:39:51    
 * 修改备注：       
 * @version </pre>    
 */
public interface IProductService {

	/** <pre>addProduct(产品添加)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月23日 下午7:40:45    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月23日 下午7:40:45    
	 * 修改备注： 
	 * @param product</pre>    
	 */
  public void addProduct(Product product);

	/** <pre>findProductList(分页查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午2:20:10    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午2:20:10    
	 * 修改备注： 
	 * @param product 
	 * @return</pre>    
	 */
	public List<Product> findProductList(Product product);

	/** <pre>deleteProduct(删除产品)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午2:40:56    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午2:40:56    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	public void deleteProduct(Integer id);

	/** <pre>batchDelete(批量删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午9:18:39    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午9:18:39    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	public void batchDelete(String ids);

	/** <pre>toUpdateProduct(产品回显)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 下午2:27:48    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 下午2:27:48    
	 * 修改备注： 
	 * @param id
	 * @return</pre>    
	 */
	public Product toUpdateProduct(Integer id);

	/** <pre>updateProduct(修改产品)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 下午2:44:01    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 下午2:44:01    
	 * 修改备注： 
	 * @param product</pre>    
	 */
	public void updateProduct(Product product);

	/** <pre>findTotalCount(总条数查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 下午8:20:14    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 下午8:20:14    
	 * 修改备注： 
	 * @param product
	 * @return</pre>    
	 */
	public Long findTotalCount(Product product);


    List<Product> findProductExcel(Product product);

	void addImagePath(ImageVO imageVO);

	List<ImageVO> findProductImage();



	List<ImageVO> LookProductImage(Integer uuid);

	void updateImagePath(ImageVO s);

    void deleteImage(String imagePath);

	List<ImageVO> findProductIdList(String imagePath);

	void deleteImageById(Integer id);

    void exitExcel(Product product, HttpServletResponse response);



}
