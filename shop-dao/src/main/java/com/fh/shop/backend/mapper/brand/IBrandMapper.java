/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:IBrandMapper.java 
 * 包名:com.fh.shop.backend.mapper.brand 
 * 创建日期:2018年12月28日下午4:19:46 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.mapper.brand;

import com.fh.shop.backend.po.Brand;

import java.util.List;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：IBrandMapper    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月28日 下午4:19:46    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月28日 下午4:19:46    
 * 修改备注：       
 * @version </pre>    
 */
public interface IBrandMapper {

	/** <pre>findTotalCount(总条数查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:23:48    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:23:48    
	 * 修改备注： 
	 * @param brand
	 * @return</pre>    
	 */
  public	Long findTotalCount(Brand brand);

	/** <pre>findBrandList(分页查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:24:00    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:24:00    
	 * 修改备注： 
	 * @param brand 
	 * @param brand
	 * @return</pre>    
	 */
	public List<Brand> findBrandList(Brand brand);

	/** <pre>addBrand(品牌添加)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:24:08    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:24:08    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	public void addBrand(Brand brand);

	/** <pre>toUpdateBrand(品牌修改回显)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:24:13    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:24:13    
	 * 修改备注： 
	 * @param brandPo
	 * @return</pre>    
	 */
	public Brand toUpdateBrand(Brand brand);

	/** <pre>updateBrand(品牌修改)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:24:21    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:24:21    
	 * 修改备注： 
	 * @param brandPo</pre>    
	 */
	public void updateBrand(Brand brand);

	/** <pre>deleteBrand(单条查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午5:26:30    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午5:26:30    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	public void deleteBrand(Integer id);

	/** <pre>batchDalete(批量删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午5:26:33    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午5:26:33    
	 * 修改备注： 
	 * @param list</pre>    
	 */
	public void batchDalete(List<Integer> list);

	/** <pre>findBrandSelect(动态下拉框查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月2日 下午6:37:58    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月2日 下午6:37:58    
	 * 修改备注： </pre>    
	 */
	public List<Brand> findBrandSelect();

    void updateBrandImage(Brand brandPo);

}
