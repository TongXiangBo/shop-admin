/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:BrandServiceImpl.java 
 * 包名:com.fh.shop.backend.biz.brand 
 * 创建日期:2018年12月28日下午4:16:13 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.brand;


import com.fh.shop.backend.common.BaseController;
import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.common.FileUtil;
import com.fh.shop.backend.common.FileVO;
import com.fh.shop.backend.mapper.brand.IBrandImageMapper;
import com.fh.shop.backend.mapper.brand.IBrandMapper;
import com.fh.shop.backend.po.Brand;
import com.fh.shop.backend.po.BrandImage;
import com.fh.shop.backend.util.DateUtil;
import com.fh.shop.backend.util.Global;
import com.fh.shop.backend.util.RedisUtil;
import com.fh.shop.backend.vo.BrandVo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：BrandServiceImpl    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月28日 下午4:16:13    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月28日 下午4:16:13    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class BrandServiceImpl implements IBrandService {
	  @Autowired
   private IBrandMapper brandMapper;


	@Autowired
	private IBrandImageService brandImageService;
	@Autowired
	private IBrandImageMapper brandImageMapper;

	@Override
	public void addBrand(Brand brand) {

		brand.setCreateTime(new Date());
		brand.setUpdateTime(new Date());
		
		brandMapper.addBrand(brand);
		RedisUtil.del("brandList");
		//throw new RuntimeException("======123");
	}

	/* (non-Javadoc)    
	 * @see IBrandService#toUpdateBrand(com.fh.shop.backend.po.Brand)
	 */
	@Override
	public Brand toUpdateBrand(Brand brandPo) {

		Brand brand = brandMapper.toUpdateBrand(brandPo);
		RedisUtil.del("brandList");
		return brand;
	}

	/* (non-Javadoc)    
	 * @see IBrandService#updateBrand(com.fh.shop.backend.po.Brand)
	 */
	@Override
	public void updateBrand(Brand brandPo) {
		brandPo.setUpdateTime(new Date());
		brandMapper.updateBrand(brandPo);
		RedisUtil.del("brandList");

	}

	/* (non-Javadoc)    
	 * @see IBrandService#deleteBrand(java.lang.Integer)
	 */
	@Override
	public void deleteBrand(Integer id) {
		brandMapper.deleteBrand(id);
		RedisUtil.del("brandList");
		
	}

	/* (non-Javadoc)    
	 * @see IBrandService#batchDalete(java.lang.String)
	 */
	@Override
	public void batchDalete(String ids) {
		List<Integer> list=new  ArrayList<>();
        String[] split = ids.split(",");
		for (String id : split) {
			list.add(Integer.parseInt(id));
		}
		brandMapper. batchDalete(list);
		RedisUtil.del("brandList");
	}

	/* (non-Javadoc)    
	 * @see IBrandService#findBrandSelect()
	 */
	@Override
	public List<Brand> findBrandSelect() {

		String brandListJson = RedisUtil.get("brandList");
		Gson gson = new Gson();

		if(!StringUtils.isEmpty(brandListJson)){


			//jsonString 转换成list
			Type type = new TypeToken<List<Brand>>() {}.getType();
			List<Brand> brandList = gson.fromJson(brandListJson, type);

			return brandList;
		}


		List<Brand> list=brandMapper.findBrandSelect();
		String listStringJson = gson.toJson(list);
		RedisUtil.set("brandList",listStringJson);
		
		return list;
	}

    @Override
    public void updateBrandImage(Brand brandPo,
								 String ids,
								 String pictureNames,
								 HttpServletRequest request,
								 MultipartFile brandImageName,
								 MultipartFile[] brandChildImageName) {


		//   多图片更新
		//删除旧图片
		deleteOldImage(ids, pictureNames);

        //添加子图片
		List<Map> fileMapList = BaseController.getFileMapList(brandChildImageName,brandImageName);
		addChidImages(brandPo, request, fileMapList);

		//主图片更新
		Map fileMap = BaseController.getFileMap(brandImageName);
		addMainImage(brandPo, request, fileMap);

		brandPo.setUpdateTime(new Date());
		brandMapper.updateBrandImage( brandPo);
    }

	@Override
	public void addBrandImage(Brand brand, FileVO fileVO, List<FileVO> fileVOList, String rootPath) {
         //主图片上传
		addHeadImage(brand, fileVO, rootPath);
		//时间信息插入
		brand.setCreateTime(new Date());
		brand.setUpdateTime(new Date());
		//现将品牌信息存入数据库 获取brand 的品牌id
		brandMapper.addBrand(brand);

       //添加子图片
		addSonImages(brand, fileVOList, rootPath);


	}

    @Override
    public DatableResult findBrandDatable(Integer draw, Integer start, Integer length, Brand brand) {


		//数据查询
		Long totalCount=brandMapper.findTotalCount(brand);
		List<Brand> brandList=brandMapper.findBrandList(brand);
		//po转vo
		List<BrandVo> list = wrapperVo(brandList);

		//datatable 数据组装
		DatableResult data = DatableResult.build(draw, totalCount, totalCount, list);


     return data;
	}

	public List<BrandVo> wrapperVo(List<Brand> brandList) {
		List<BrandVo> list=	new ArrayList<BrandVo>();
		for (Brand brandInfo : brandList) {
		  BrandVo brandVo=	new BrandVo();
			brandVo.setId(brandInfo.getId());
			brandVo.setBrandName(brandInfo.getBrandName());
			brandVo.setBrandImagePath(brandInfo.getBrandImagePath());
			brandVo.setCreateTime(DateUtil.Date2String(brandInfo.getCreateTime(),DateUtil.YEAR_MONTH_DATE));
			brandVo.setUpdateTime(DateUtil.Date2String(brandInfo.getUpdateTime(),DateUtil.YEAR_MONTH_DATE));
			list.add(brandVo);
		}
		return list;
	}

	public void addSonImages(Brand brand, List<FileVO> fileVOList, String rootPath) {
		//添加子图片
		for (int i = 0; i <fileVOList.size() ; i++) {

			List<BrandImage> brandImageList = new ArrayList<>();

			//输出流构建
			InputStream inputStream = fileVOList.get(i).getInputStream();
			//文件名获取
			String originalFilename = fileVOList.get(i).getOriginalFilename();
			String realPath = rootPath+Global.IMAGE_PACKEG_NAME;
			String copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
			BrandImage brandImage = new BrandImage();
			brandImage.setBrandIamgeId(brand.getId());
			brandImage.setBrandImagePath(Global.IMAGE_PACKEG_NAME + copyFile);
			brandImageList.add(brandImage);
			//数据库添加

			brandImageService.addBrandImage(brandImageList);
		}
	}

	public void addHeadImage(Brand brand, FileVO fileVO, String rootPath) {
		//单个图片上传
		//判断图片非空
		if(fileVO.getSize()>0) {

			String realPath = rootPath+Global.IMAGE_PACKEG_NAME;
			String copyFile = FileUtil.copyFile(fileVO.getInputStream(), fileVO.getOriginalFilename(), realPath);
			brand.setBrandImagePath(Global.IMAGE_PACKEG_NAME+copyFile);

		}
	}

	public void addMainImage(Brand brandPo, HttpServletRequest request, Map fileMap) {
		//主图片更新
		//图片非空判断

		if(!fileMap.isEmpty()) {

			//删除服务器旧图片
			String realPathImage = request.getServletContext().getRealPath(brandPo.getBrandImagePath());
			//调用工具
			FileUtil.delteFile(realPathImage);

			InputStream inputStream = (InputStream) fileMap.get("inputStream");
			String originalFilename = fileMap.get("originalFilename").toString();
			String rootPath = request.getServletContext().getRealPath("/");
			String realPath =rootPath+ Global.IMAGE_PACKEG_NAME;
			String copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
			brandPo.setBrandImagePath(Global.IMAGE_PACKEG_NAME+copyFile);



		}
	}

	public void addChidImages(Brand brandPo, HttpServletRequest request,List<Map> fileMapList) {
		//添加子图片
		if (null!=fileMapList) {
			for (int i = 0; i < fileMapList.size(); i++) {
				//过滤空图片
				if (!fileMapList.get(i).isEmpty()) {
					List<BrandImage> brandImageList = new ArrayList<>();
					String rootPath = request.getServletContext().getRealPath("/");
					InputStream inputStream = (InputStream) fileMapList.get(i).get("inputStream");
					String originalFilename = fileMapList.get(i).get("originalFilename").toString();
					String realPath = rootPath + Global.IMAGE_PACKEG_NAME;
					String copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
					BrandImage brandImage = new BrandImage();
					brandImage.setBrandIamgeId(brandPo.getId());
					brandImage.setBrandImagePath(Global.IMAGE_PACKEG_NAME + copyFile);
					brandImageList.add(brandImage);
					brandImageService.addBrandImage(brandImageList);
				}
			}
		}
	}

	//删除图片
	public void deleteOldImage(String ids, String pictureNames) {

		if(!pictureNames.isEmpty()) {
			//删除服务器旧图片
			deleteTomcatImage(pictureNames);
			//删除数据库图片
			deleteDBImage(ids);

		}
	}

	public void deleteDBImage(String ids) {
		//删除数据库图片
		List<Integer> idsList = new ArrayList<>();
		String[] splitIds = ids.split(",");
		for (String splitId : splitIds) {
			idsList.add(Integer.parseInt(splitId));
		}
		brandImageMapper.deleteBrandImage(idsList);
	}

	public void deleteTomcatImage(String pictureNames) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

		String rootPath = request.getServletContext().getRealPath("/");
		//删除服务器旧图片
		String[] split = pictureNames.substring(0, pictureNames.length() - 1).split(",");
		for (int i = 0; i < split.length; i++) {
			String realPath = rootPath+split[i];
			FileUtil.delteFile(realPath);

		}
	}

}
