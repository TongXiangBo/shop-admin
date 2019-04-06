package com.fh.shop.backend.controller.brand; /**
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:BrandController.java 
 * 包名:com.fh.shop.backend.controller.brand 
 * 创建日期:2018年12月28日下午3:45:29 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 *//*

package com.fh.shop.backend.controller.brand;

import IBrandImageService;
import IBrandService;
import com.fh.shop.backend.common.FileUtil;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.controller.BaseController;
import com.fh.shop.backend.mapper.brand.IBrandImageMapper;
import com.fh.shop.backend.po.Brand;
import com.fh.shop.backend.po.BrandImage;
import com.opensymphony.oscache.util.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

*/
/**
 * <pre>项目名称：shop_admin_v1    
 * 类名称：BrandController    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月28日 下午3:45:29    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月28日 下午3:45:29    
 * 修改备注：       
 * @version </pre>    
 *//*

	@Controller
	@RequestMapping("brand")
public class BrandController2 extends BaseController {
    @Autowired		
   private IBrandService  brandService;

     @Autowired
     private IBrandImageService brandImageService;
     @Autowired
     private IBrandImageMapper brandImageMapper;


    */
/**
     * <pre>findBrandList(分页查询)   
     * 创建人：童湘博 2329157467@qq.com    
     * 创建时间：2019年1月6日 下午11:11:39    tg
     * 修改人：童湘博 2329157467@qq.com     
     * 修改时间：2019年1月6日 下午11:11:39    
     * 修改备注： 
     * @param map
     * @param brand
     * @param flag
     * @param session
     * @return</pre>
     *//*

	@RequestMapping("findBrandList")
	
    public String findBrandList(ModelMap map,Brand brand, Float flag,HttpSession session){
		
		///动态表格   修改取消时   我们不去查数据库  而是将上次查询出来的信息通过session调出来，然后传递到前台展示出来
		//减小数据库的负担，提高效率
		if(flag!=null&&flag==2){
	    	@SuppressWarnings("unchecked")
	   //将session 中的 	List<Brand>取出来
			List<Brand> list=(List<Brand>) session.getAttribute("brand");
	   //将数据再次放入 	放入session中带到前台
	    	session.setAttribute("brandList", list);
	   //用ajax请求跳到子级页面  异步刷新 	
		return "brand/brandListChild";	
		}
		//调用时间转换方法
		//toDate(brand);
		
        Long totalCount=brandService.findTotalCount(brand);
        brand.setTotalCount(totalCount);
        brand.calculatePage();
        map.put("page", brand);
    	List<Brand> brandList=brandService.findBrandList(brand);

    	///放入session
    	session.setAttribute("brand", brandList);
    	map.put("brandList", brandList);
    	if(flag==null){
	
    	return "brand/brandList";
    	}
    	else{
    		return "brand/brandListChild";	
    	}

    }


	*/
/** <pre>toDate(时间转换)
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月12日 下午2:45:02    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月12日 下午2:45:02    
	 * 修改备注： 
	 * @param brand</pre>    
	 * @throws ParseException 
	 *//*

	private void toDate(Brand brand) throws ParseException {
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		
	
			if( !StringUtil.isEmpty(brand.getMinCreateTimeStr())  ){
				brand.setMinCreateTime(sim.parse(brand.getMinCreateTimeStr()));
				}
				if( !StringUtil.isEmpty(brand.getMaxCreateTimeStr())){
				brand.setMaxCreateTime(sim.parse(brand.getMaxCreateTimeStr()));
				}
				if(StringUtils.isNotEmpty(brand.getMinUpdateTimeStr())){
					brand.setMinUpdateTime(sim.parse(brand.getMinUpdateTimeStr()));
				}
				if(StringUtils.isNotEmpty(brand.getMaxUpdateTimeStr())){	
					brand.setMaxUpdateTime(sim.parse(brand.getMaxUpdateTimeStr()));
					}
	
	}
	
	
    */
/**
     * <pre>toAdd(增加前跳转)   
     * 创建人：童湘博 2329157467@qq.com    
     * 创建时间：2018年12月28日 下午3:51:32    
     * 修改人：童湘博 2329157467@qq.com     
     * 修改时间：2018年12月28日 下午3:51:32    
     * 修改备注： 
     * @return</pre>
     *//*

	@RequestMapping("toAdd")	
	public String  toAdd(){
	return "brand/addBrand";	
	}
	*/
/**
	 * <pre>addBrand(添加品牌)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午3:54:27    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午3:54:27    
	 * 修改备注： 
	 * @return</pre>
	 *//*

	@RequestMapping("addBrand")	
	@ResponseBody
	*/
/*public Map<String, Object> addBrand(Brand brand,HttpServletResponse response){*//*

	public ServerResponse addBrand(Brand brand,HttpServletResponse response){	
		//Map<String, Object> map=new HashMap<>();
			brandService.addBrand(brand);
			*/
/*map.put("code", 200);
			map.put("msg", "ok");*//*

			return  ServerResponse.success();
	}

    //图片上传添加
	@RequestMapping("addBrandImage")
	public String addBrandImage(Brand brand, HttpServletRequest request, @RequestParam MultipartFile brandImageName,@RequestParam MultipartFile[] brandChildImageName){
		String realPath = request.getServletContext().getRealPath("/image/");
//



		//单个图片上传
		//判断图片非空
		if(brandImageName.getSize()>0) {
			try {
				InputStream inputStream = brandImageName.getInputStream();
				String originalFilename = brandImageName.getOriginalFilename();
				String copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
				brand.setBrandImagePath("/image/"+copyFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}



		//多个图片上传
		//现将品牌信息存入数据库 获取brand 的品牌id
		brandService.addBrand(brand);


		for (int i = 0; i <brandChildImageName.length ; i++) {
			try {
				//图片非空判断
				if(brandChildImageName[i].getSize()>0) {
					//输出流构建
					InputStream inputStream = brandChildImageName[i].getInputStream();
					//文件名获取
					String originalFilename = brandChildImageName[i].getOriginalFilename();
					String copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
					BrandImage brandImage = new BrandImage();
					brandImage.setBrandIamgeId(brand.getId());
					brandImage.setBrandImagePath("/image/" + copyFile);
					//数据库添加
					brandImageService.addBrandImage(brandImage);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}


		}



		return "redirect:/brand/findBrandList.jhtml";

	}

	*/
/**
	 * <pre>deleteBrand(单个删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午5:18:25    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午5:18:25    
	 * 修改备注： 
	 * @param id
	 * @return</pre>
	 *//*

	@RequestMapping("deleteBrand")
     @ResponseBody
	public  ServerResponse deleteBrand(Integer id,HttpServletResponse response){
			brandService.deleteBrand(id);
			return ServerResponse.success();
	}
	*/
/**
	 * <pre>batchDalete(批量删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午5:20:22    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午5:20:22    
	 * 修改备注： 
	 * @param ids
	 * @return</pre>
	 *//*

	@RequestMapping("batchDalete")
	@ResponseBody
	public  ServerResponse batchDalete(String ids){
		//Map<String, Object> map=new HashMap<>();
			brandService.batchDalete(ids);
			return  ServerResponse.success();
	}
	
	*/
/**
	 * <pre>toUpdateBrand(回显品牌)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:07:48    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:07:48    
	 * 修改备注： 
	 * @return</pre>
	 *//*

	@RequestMapping("toUpdateBrand")
	public  ModelAndView  toUpdateBrand(Brand brandPo){
		ModelAndView mav=new ModelAndView("brand/updateBrand");
      Brand brand=brandService.toUpdateBrand(brandPo);
		List<BrandImage> brandImageList = brandImageService.viewChildImages(brandPo.getId());
		mav.addObject("brand",brand);
		mav.addObject("brandImageList",brandImageList);
		return mav;
	}
	*/
/*@RequestMapping("toUpdateBrand")
	@ResponseBody
	public  ServerResponse  toUpdateBrand(Brand brandPo){
      Brand brand=brandService.toUpdateBrand(brandPo);
    
		return ServerResponse.success(brand);
	}*//*

	
	
	
	*/
/**
	 * <pre>updateBrand(修改品牌)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月28日 下午4:12:39    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月28日 下午4:12:39    
	 * 修改备注： 
	 * @return</pre>
	 *//*

	@RequestMapping("updateBrand")
	@ResponseBody
	public ServerResponse updateBrand(Brand brandPo){
			brandService.updateBrand(brandPo);
			 Brand brand=brandService.toUpdateBrand(brandPo);
		    return ServerResponse.success(brand);
	}
	//品牌图片修改
    @RequestMapping("updateBrandImage")
    public String updateBrandImage(Brand brandPo,
                                   String ids,
                                   String pictureNames,
                                   HttpServletRequest request,
                                   @RequestParam MultipartFile brandImageName,
                                   @RequestParam MultipartFile[] brandChildImageName)
    {
      //   多图片更新

		//删除服务器旧图片
		if(!pictureNames.isEmpty()) {
			String[] split = pictureNames.substring(0, pictureNames.length() - 1).split(",");
			for (int i = 0; i < split.length; i++) {
				String realPath = request.getServletContext().getRealPath(split[i]);
				FileUtil.delteFile(realPath);

			}
			//删除数据库图片
			List<Integer> idsList = new ArrayList<>();
			String[] splitIds = ids.split(",");
			for (String splitId : splitIds) {
				idsList.add(Integer.parseInt(splitId));
			}
			brandImageMapper.deleteBrandImage(idsList);
		}


		//添加字图片
		for (int i = 0; i <brandChildImageName.length ; i++) {
			//过滤空图片
			if (brandChildImageName[i].getSize()>0) {

				try {

					InputStream inputStream = brandChildImageName[i].getInputStream();
					String originalFilename = brandChildImageName[i].getOriginalFilename();
					String realPath = request.getServletContext().getRealPath("/image/");
					String copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
					BrandImage brandImage = new BrandImage();
					brandImage.setBrandIamgeId(brandPo.getId());
					brandImage.setBrandImagePath("/image/" + copyFile);
					brandImageService.addBrandImage(brandImage);
				} catch (IOException e) {
					e.printStackTrace();
				}


			}
		}




        //单个图片更新
        //图片非空判断
        if(brandImageName.getSize()>0) {

			//删除服务器旧图片
			String realPathImage = request.getServletContext().getRealPath(brandPo.getBrandImagePath());
			//调用工具
			FileUtil.delteFile(realPathImage);

             //添加新图片
			try {

				InputStream inputStream = brandImageName.getInputStream();
				//获取图片名称
				String   originalFilename= brandImageName.getOriginalFilename();
				String realPath = request.getServletContext().getRealPath("/image/");
				String copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
				brandPo.setBrandImagePath("/image/"+copyFile);

			} catch (IOException e) {
				e.printStackTrace();
			}


        }

        brandService.updateBrandImage(brandPo);



        return "redirect:/brand/findBrandList.jhtml";
    }




	*/
/**
	 * <pre>findBrandSelect(动态下拉框查询)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月9日 下午6:51:54    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月9日 下午6:51:54    
	 * 修改备注： 
	 * @return</pre>
	 *//*

	@RequestMapping("findBrandSelect")
	@ResponseBody
	public ServerResponse  findBrandSelect(){
		List<Brand> brandList;
		Map<String,Object> map = new HashMap<String,Object>();
			brandList = brandService.findBrandSelect();
			return  ServerResponse.success(brandList);
	
		
		
	}
}
*/
