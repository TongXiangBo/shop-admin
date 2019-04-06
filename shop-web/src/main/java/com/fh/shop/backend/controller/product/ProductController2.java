package com.fh.shop.backend.controller.product; /**
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:ProductController.java 
 * 包名:com.fh.shop.backend.controller.product 
 * 创建日期:2018年12月23日下午5:28:37 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */
/*
package com.fh.shop.backend.controller.product;

import IBrandService;
import com.fh.shop.backend.biz.product.IProductService;
import com.fh.shop.backend.common.FileUtil;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.controller.BaseController;
import com.fh.shop.backend.po.Brand;
import com.fh.shop.backend.po.ImageVO;
import com.fh.shop.backend.po.Product;
import com.opensymphony.oscache.util.StringUtil;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

*/
/**
 * <pre>
 * 项目名称：shop_admin_v1    
 * 类名称：ProductController    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月23日 下午5:28:37    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月23日 下午5:28:37    
 * 修改备注：       
 * &#64;version
 * </pre>
 *//*

@Controller
@RequestMapping("product")
public class ProductController2 extends BaseController {
 
	private  static final Logger LOG=LoggerFactory.getLogger(ProductController2.class);
	
	@Autowired()
	// 默认为实现类名（首字母小写）无需再@service后加任何自定义别名
	// @Qualifier("productServiceImpl")
	// @Qualifier("ttt")
	// @Resource(name="ttt")
	// 默认为实现类名（首字母小写）无需再@service后加任何自定义别名
	@Resource(name = "productServiceImpl")
	private IProductService productService;
    @Resource(name="brandServiceImpl")
	private IBrandService   brandService;
    @Autowired
    private HttpServletRequest  request;
//	@Autowired
//	private HttpServletResponse response;



	//图片详细展示
	@RequestMapping("lookPicture")
	public String lookPicture(Product product,ModelMap map){

		List<ImageVO>  imageVOList=	productService.LookProductImage(product.getImagePath());
		map.put("imageVOList",imageVOList);
		return "image/img";
	}


	*/
/**
	 poi导出
	 *//*

	@RequestMapping("exitExcel")
	public void exitExcel(Product product,HttpServletResponse response){

		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		XSSFWorkbook workbook = new XSSFWorkbook();
		List<Brand> brandList = brandService.findBrandSelect();
		List<Product> productList =null;
		int brandId=product.getBrand().getId();
		//循环品牌表 创建sheet
		for (int i = 0; i <brandList.size() ; i++) {
            if (brandId==-1) {
				product.getBrand().setId(brandList.get(i).getId());
				 productList = productService.findProductExcel(product);
			}else{
            	if (product.getBrand().getId()==brandList.get(i).getId()){
					productList = productService.findProductExcel(product);
				}else {
					productList=	new ArrayList<>();
				}
			}
			XSSFSheet sheet = workbook.createSheet(brandList.get(i).getBrandName()+"【"+productList.size()+"】");
			//XSSFRow headRow = sheet.createRow(0);
			XSSFRow titleRow = sheet.createRow(0);
			titleRow.createCell(0).setCellValue("编号");
			titleRow.createCell(1).setCellValue("产品名称");
			titleRow.createCell(2).setCellValue("产品价格 ");
			titleRow.createCell(3).setCellValue("产品品牌");
			titleRow.createCell(4).setCellValue("创建时间");
			titleRow.createCell(5).setCellValue("修改时间");

			int rowCode=1;
			for (int j = 0; j <productList.size() ; j++) {
				XSSFRow row = sheet.createRow(rowCode);
				row.createCell(0).setCellValue(productList.get(j).getId());
				row.createCell(1).setCellValue(productList.get(j).getProductName());
				row.createCell(2).setCellValue(productList.get(j).getPrice());
				row.createCell(3).setCellValue(productList.get(j).getBrand().getBrandName());
				row.createCell(4).setCellValue(sim.format(productList.get(j).getCreateTime()));
				row.createCell(5).setCellValue(sim.format(productList.get(j).getUpdateTime()));
				rowCode++;
			}

		}

		FileUtil.excelDownload(workbook,response);

	}


	*/
/**
	 * <pre>
	 * toAdd(添加前跳转)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午2:14:27    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午2:14:27    
	 * 修改备注： 
	 * &#64;return
	 * </pre>
	 *//*

	@RequestMapping("toAdd")
	public String toAdd(ModelMap map) {
		return "product/addProduct";
	}

	*/
/**
	 * <pre>
	 * addProduct(添加)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午2:15:13    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午2:15:13    
	 * 修改备注： 
	 * &#64;param product
	 * &#64;return
	 * </pre>
	 *//*

	@RequestMapping("addProduct")
	public String addProduct(Product product, @RequestParam MultipartFile[] pictureName ) {
//		String[] parameterValues = request.getParameterValues("pictureName");
//		String pictureName1 = request.getParameter("productName");
		String realPath = request.getServletContext().getRealPath("/image");
        String copyFile=null;


		Date date = new Date();
		product.setCreateTime(date);
		product.setUpdateTime(date);
		String uuid=UUID.randomUUID().toString();
		for (int i = 0; i <pictureName.length ; i++) {
			try {
				String originalFilename = pictureName[i].getOriginalFilename();

				if (!originalFilename.isEmpty()) {
					InputStream inputStream = pictureName[i].getInputStream();

					copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
					//product.setImagePath("/image/"+copyFile);
					ImageVO imageVO = new ImageVO();

					imageVO.setProductId(uuid);
					product.setImagePath(uuid);
					imageVO.setProductImagePath("/image/" + copyFile);
					productService.addImagePath(imageVO);
				}

				} catch(IOException e){
					e.printStackTrace();
				}

		}

		productService.addProduct(product);

//        try {
//            InputStream inputStream = pictureName.getInputStream();
//             copyFile = FileUtil.copyFile(inputStream, pictureName.getOriginalFilename(), realPath);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        product.setImagePath("/image/"+copyFile);
 //       productService.addProduct(product);

		return "redirect:/product/findProductList.jhtml";
	}
	//下载
    @RequestMapping("downloadPicture")
	public void downloadPicture(Product product,HttpServletResponse response,String imagePath){
        String realPath = request.getServletContext().getRealPath("");
        FileUtil.downloadFile(request,response,realPath+product.getImagePath(),product.getImagePath());
    }


	*/
/**
	 * <pre>
	 * findProductList(查询产品)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午2:17:38    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午2:17:38    
	 * 修改备注： 
	 * &#64;param map
	 * &#64;return
	 * </pre>
	 *//*

	@RequestMapping("findProductList")
	public String findProductList(ModelMap map, Product product, Integer flag) {
		*/
/*调用日期转换方法*//*

      // toDate(product);



		// 获取总条数
		Long totalCount = productService.findTotalCount(product);
		// 设置总条数
		product.setTotalCount(totalCount);
		// 计算分页信息
		product.calculatePage();
		List<Product> productList = productService.findProductList(product);
		List<ImageVO>  imageVOList=	productService.findProductImage();
//		//主图
//		List<ImageVO> imageVOList = new ArrayList<ImageVO>();
//		imageVOList.add(imageVOListAll.get(0));

		map.put("productList", productList);
		map.put("imageVOList", imageVOList);
		map.put("page", product);
		
		if (flag == null) {
			// 跳转到主页面
			return "product/productList";
  			
		} else {
			// 跳转到子页面
			return "product/productListChild";
		}
		
	}

	*/
/** <pre>toDate(日期转换)
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月12日 下午2:04:27    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月12日 下午2:04:27    
	 * 修改备注： 
	 * @param product</pre>    
	 *//*

	private void toDate(Product product) {
		SimpleDateFormat sim=new SimpleDateFormat("yyyy/MM/dd");
			
			try {
				if( !StringUtil.isEmpty(product.getMinCreateTimeStr())  ){
					product.setMinCreateTime(sim.parse(product.getMinCreateTimeStr()));
					}
					if( !StringUtil.isEmpty(product.getMaxCreateTimeStr())){
					product.setMaxCreateTime(sim.parse(product.getMaxCreateTimeStr()));
					}
					if(!StringUtil.isEmpty(product.getMinUpdateTimeStr())){
						product.setMinUpdateTime(sim.parse(product.getMinUpdateTimeStr()));
					}
					if(!StringUtil.isEmpty(product.getMaxUpdateTimeStr())){	
						product.setMaxUpdateTime(sim.parse(product.getMaxUpdateTimeStr()));
						}
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	*/
/**
	 * <pre>
	 * deleteProduct(单个删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月25日 下午9:16:40    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月25日 下午9:16:40    
	 * 修改备注： 
	 * &#64;param id
	 * &#64;param resp
	 * </pre>
	 *//*

	@RequestMapping("deleteProduct")
	@ResponseBody
	public ServerResponse deleteProduct(Integer id, HttpServletResponse resp) {
			productService.deleteProduct(id);
			return  ServerResponse.success();
	}

	*/
/**
	 * <pre>
	 * batchDelete(批量删除)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 上午12:00:00    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 上午12:00:00    
	 * 修改备注： 
	 * &#64;param ids
	 * &#64;param resp
	 * </pre>
	 *//*

	@RequestMapping("batchDelete")
	@ResponseBody
	public ServerResponse batchDelete(String ids, HttpServletResponse resp) {
		//Map<String, Object> map = new HashMap<>();
	
			productService.batchDelete(ids);
			*/
/*map.put("code", 200);
			map.put("msg", "ok");*//*

			return  ServerResponse.success();
	}

	*/
/**
	 * <pre>
	 * toUpdateProduct(回显)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 下午2:23:32    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 下午2:23:32    
	 * 修改备注： 
	 * &#64;return
	 * </pre>
	 *//*

	@RequestMapping("toUpdateProduct")
	public ModelAndView toUpdateProduct(Integer id) {
		ModelAndView mav = new ModelAndView("product/updateProduct");
		Product product = productService.toUpdateProduct(id);
		mav.addObject("product", product);
		List<ImageVO>  imageVOList=	productService.LookProductImage(product.getImagePath());
		mav.addObject("imageVOList",imageVOList);
		return mav;
	}

	*/
/**
	 * <pre>
	 * updateProduct(修改)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2018年12月26日 下午2:50:54    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2018年12月26日 下午2:50:54    
	 * 修改备注： 
	 * &#64;param product
	 * &#64;return
	 * </pre>
	 *//*

	@RequestMapping("updateProduct")
	public String updateProduct(Product product,@RequestParam MultipartFile[] pictureName) {



		String realPath = request.getServletContext().getRealPath("/image");
		//String uuid=UUID.randomUUID().toString();

		String oldImagePath = product.getOldImagePath();
		String[] imageId = oldImagePath.split("#");
		String imageCode = product.getImageCode();
		String[] imageCodes = imageCode.split("#");



		if(pictureName.length>0) {
			for (int i = 0; i < pictureName.length; i++) {
				try {
					String originalFilename = pictureName[i].getOriginalFilename();
					//过滤空图片
               if(!originalFilename.isEmpty()) {
				   InputStream inputStream = pictureName[i].getInputStream();
				   String copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
				   //product.setImagePath("/image/"+copyFile);
				   ImageVO imageVO = new ImageVO();
//
//					imageVO.setProductId(product.getImagePath());
//					product.setImagePath(product.getImagePath());

				   for (int j = i + 1; j < imageId.length; j++) {
					   imageVO.setId(Integer.valueOf(imageId[j]));
					   imageVO.setProductImagePath("/image/" + copyFile);
					   imageVO.setProductId(product.getImagePath());
					   productService.updateImagePath(imageVO);
					   break;
				   }

			   }

				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			//删除旧图片
			for (int j = 1; j < imageCodes.length; j++) {

				String oldPath = request.getServletContext().getRealPath(imageCodes[j]);
				File file = new File(oldPath);
				if(file.exists()){
					file.delete();
				}

			}


		}





       */
/* if(!originalFilename.isEmpty()){

            InputStream inputStream = null;
            String copyFile=null;
            try {
                inputStream = pictureName.getInputStream();
              copyFile = FileUtil.copyFile(inputStream, originalFilename, realPath);
            } catch (IOException e) {
                e.printStackTrace();
            }
             //删除旧图片
            String oldPath = request.getServletContext().getRealPath(product.getImagePath());
                File file = new File(oldPath);
                if(file.exists()){
                    file.delete();
            }
            product.setImagePath("/image/"+copyFile);

        }*//*


       //product.setImagePath(product.getOldImagePath());
		productService.updateProduct(product);
		return "redirect:/product/findProductList.jhtml";
	}

}
*/
