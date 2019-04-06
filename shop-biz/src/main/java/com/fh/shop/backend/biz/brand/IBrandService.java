/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:IBrandService.java 
 * 包名:com.fh.shop.backend.biz.brand 
 * 创建日期:2018年12月28日下午3:49:34 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.brand;

import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.common.FileVO;
import com.fh.shop.backend.po.Brand;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：IBrandService    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月28日 下午3:49:34    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月28日 下午3:49:34    
 * 修改备注：       
 * @version </pre>    
 */
public interface IBrandService {

	/** <pre>addBrand(品牌添加)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:14:59    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:14:59    
	 * 修改备注： 
	 * @param brand</pre>    
	 */
	public void addBrand(Brand brand);

	/** <pre>toUpdateBrand(品牌修改回显)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:15:05    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:15:05    
	 * 修改备注： 
	 * @param brandPo
	 * @return</pre>    
	 */
	public Brand toUpdateBrand(Brand brandPo);

	/** <pre>updateBrand(品牌修改)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:15:09    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:15:09    
	 * 修改备注： 
	 * @param brandPo</pre>    
	 */
	public void updateBrand(Brand brandPo);

	/** <pre>deleteBrand(单个删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午5:21:24    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午5:21:24    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	public void deleteBrand(Integer id);

	/** <pre>batchDalete(批量删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午5:21:36    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午5:21:36    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	public void batchDalete(String ids);

	/** <pre>findBrandSelect(动态下拉框查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月2日 下午6:37:20    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月2日 下午6:37:20    
	 * 修改备注： </pre>    
	 */
	public List<Brand> findBrandSelect();

    void updateBrandImage(Brand brandPo, String ids, String pictureNames, HttpServletRequest request, MultipartFile brandImageName, MultipartFile[] brandChildImageName);

    void addBrandImage(Brand brand, FileVO fileVO, List<FileVO> fileVOList, String rootPath);

    DatableResult findBrandDatable(Integer draw, Integer start, Integer length, Brand brand);
}
