/**
 * <pre>项目名称:shop_admin_v1
 * 文件名称:ProductController.java
 * 包名:com.fh.shop.backend.controller.product
 * 创建日期:2018年12月23日下午5:28:37
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.controller.product;

import com.auth0.jwt.internal.org.apache.commons.lang3.StringUtils;

import com.fh.shop.backend.baseAction.BaseAction;
import com.fh.shop.backend.biz.product.IProductService;
import com.fh.shop.backend.biz.user.IUserservice;
import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.common.FileUtil;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.controller.BaseController;
import com.fh.shop.backend.po.ImageVO;
import com.fh.shop.backend.po.Product;
import com.fh.shop.backend.po.User;
import com.fh.shop.backend.util.DateUtil;
import com.fh.shop.backend.util.Global;
import com.fh.shop.backend.util.TengXunYun;
import com.opensymphony.oscache.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 */
@Controller
@RequestMapping("product")
public class ProductController extends BaseController {

	private  static final Logger LOG=LoggerFactory.getLogger(ProductController.class);

	@Autowired()
	// 默认为实现类名（首字母小写）无需再@service后加任何自定义别名
	// @Qualifier("productServiceImpl")
	// @Qualifier("ttt")
	// @Resource(name="ttt")
	// 默认为实现类名（首字母小写）无需再@service后加任何自定义别名
	@Resource(name = "productServiceImpl")
	private IProductService productService;
    //@Resource(name="brandServiceImpl")
	/*@Autowired
	private IBrandService brandService;*/
    @Autowired
    private HttpServletRequest  request;
//	@Autowired
//	private HttpServletResponse response;
    @Autowired
	private IUserservice userservice;


	//图片详细展示
	@RequestMapping("lookPicture")
	public String lookPicture(Product product, ModelMap map){

		List<ImageVO>  imageVOList=	productService.LookProductImage(product.getId());
		map.put("imageVOList",imageVOList);
		return "image/img";
	}


	/**
	 poi导出
	 */
	@RequestMapping("exitExcel")
	public void exitExcel(Product product,HttpServletResponse response){
		productService.exitExcel(product,response);



	}


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
	 */
	@RequestMapping("toAdd")
	public String toAdd(ModelMap map) {
		return "product/addProduct";
	}

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
	 */
	@RequestMapping("addProduct")
	public String addProduct(Product product,String ImgPath) {


		String realPath = request.getServletContext().getRealPath("\\image")+"\\";



		Date date = new Date();
		product.setCreateTime(date);
		product.setUpdateTime(date);
		String[] split = ImgPath.split(",");
		if(split.length>=2) {
			product.setImagePath("/image/" + split[1]);
			//COSUtil.postImageCOS("headPicture",realPath + split[1]);
		}


		productService.addProduct(product);
		if(!StringUtils.isEmpty(ImgPath)) {

			for (int i = 2; i < split.length; i++) {

				ImageVO imageVO = new ImageVO();

				imageVO.setProductId(product.getId());

				imageVO.setProductImagePath("/image/" + split[i]);
			//	COSUtil.postImageCOS("ChildPicture"+i,realPath + split[1]);
				productService.addImagePath(imageVO);
			}

		}

		return "redirect:/product/toFindList.jhtml";
	}
	//下载
    @RequestMapping("downloadPicture")
	public void downloadPicture(Product product,HttpServletResponse response,String imagePath){
        String realPath = request.getServletContext().getRealPath("");
        FileUtil.downloadFile(request,response,realPath+product.getImagePath(),product.getImagePath());
    }


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
	 */
	@RequestMapping("findProductList")
	public String findProductList(ModelMap map, Product product, Integer flag) {
		/*调用日期转换方法*/
      // toDate(product);



		// 获取总条数
		Long totalCount = productService.findTotalCount(product);
		// 设置总条数
		product.setTotalCount(totalCount);
		// 计算分页信息
		product.calculatePage();
		List<Product> productList = productService.findProductList(product);
	//	List<ImageVO>  imageVOList=	productService.findProductImage();
      // SimpleDateFormat sim=new SimpleDateFormat("yyyy/MM/dd");
		//登录信息展示
		User sessionUser = (User)request.getSession().getAttribute("user");
		//String format = sim.format(sessionUser.getLonginTime());

		//User userDB = userservice.findUser(sessionUser);
		Date date = new Date();
		//更新登录时间和登录次数
		//判断session过期时间
		if(sessionUser.getSessionBloon()==null) {

			//将时间格式精确到天 比较大小
			Date currentDate = DateUtil.String2Date(DateUtil.Date2String(date, DateUtil.FULL_DATE_FORMAT), DateUtil.YEAR_MONTH_DATE);
			Date lastDate = DateUtil.String2Date(DateUtil.Date2String(sessionUser.getLonginTime(), DateUtil.FULL_DATE_FORMAT), DateUtil.YEAR_MONTH_DATE);
			if (currentDate.after(lastDate)) {
				//重置登录次数为1
                sessionUser.setTimes(1);
			}else {
                sessionUser.setTimes(sessionUser.getTimes() + 1);
            }
            sessionUser.setLonginTime(date);



			userservice.updateUser(sessionUser);
			//在session中存入判断标志 用于刷新是判断  刷新时不更新数据
            sessionUser.setSessionBloon(2);
			request.getSession().setAttribute("user",sessionUser);
		}
		map.put("productList", productList);
		//map.put("imageVOList", imageVOList);
		map.put("page", product);
		//前台展示登录次数设定
		map.put("user", sessionUser);

		if (flag == null) {
			// 跳转到主页面
			return "product/productList";

		} else {
			// 跳转到子页面
			return "product/productListChild";
		}

	}

	/** <pre>toDate(日期转换)
	 * 创建人：童湘博 2329157467@qq.com
	 * 创建时间：2019年1月12日 下午2:04:27
	 * 修改人：童湘博 2329157467@qq.com
	 * 修改时间：2019年1月12日 下午2:04:27
	 * 修改备注：
	 * @param product</pre>
	 */
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
	 */
	@RequestMapping("deleteProduct")
	@ResponseBody
	public ServerResponse deleteProduct(Integer id, HttpServletResponse resp) {
			productService.deleteProduct(id);
			return  ServerResponse.success();
	}

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
	 */
	@RequestMapping("batchDelete")
	@ResponseBody
	public ServerResponse batchDelete(String ids, HttpServletResponse resp) {
		//Map<String, Object> map = new HashMap<>();

			productService.batchDelete(ids);
			/*map.put("code", 200);
			map.put("msg", "ok");*/
			return  ServerResponse.success();
	}

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
	 */
	/*@RequestMapping("toUpdateProduct")
	public ModelAndView toUpdateProduct(Integer id) {
		ModelAndView mav = new ModelAndView("product/updateProduct");
		Product product = productService.toUpdateProduct(id);
		mav.addObject("product", product);
		List<ImageVO>  imageVOList=	productService.LookProductImage(product.getId());
		mav.addObject("imageVOList",imageVOList);
		return mav;
	}*/

	@RequestMapping("/toUpdateProduct")
	@ResponseBody
	public ServerResponse toUpdateProduct(Integer id) {

		Product product = productService.toUpdateProduct(id);

		List<ImageVO>  imageVOList=	productService.LookProductImage(product.getId());
		return ServerResponse.success(product);
	}


	@RequestMapping("/toUpdateImage")
	@ResponseBody
	public ServerResponse toUpdateImage(Integer id) {
		List<ImageVO>  imageVOList=	productService.LookProductImage(id);
		return ServerResponse.success(imageVOList);
	}
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
	 */
	@RequestMapping("updateProduct")
	public String updateProduct(Product product,String ImgPath) {

          //删除数据库中商品图片信息----yiqigongcheng

		String realPath = request.getServletContext().getRealPath("/image");

		String oldImagePath = product.getOldImagePath();
		String[] imageId = oldImagePath.split("#");
		String imageCode = product.getImageCode();
		String[] imageCodes = imageCode.split("#");

		for (int j = 1; j <imageId.length ; j++) {
			productService.deleteImageById(Integer.valueOf(imageId[j]));
		}




			Date date = new Date();

			product.setUpdateTime(date);
			String[] split = ImgPath.split(",");
			//主图是否修改
			if(product.getImagePath()==null) {
				if (split.length >= 2) {
					product.setImagePath("/image/" + split[1]);
				}
			}

	    	productService.updateProduct(product);
			if(!StringUtils.isEmpty(ImgPath)) {

				for (int i = 2; i < split.length; i++) {

					ImageVO imageVO = new ImageVO();

					imageVO.setProductId(product.getId());

					imageVO.setProductImagePath("/image/" + split[i]);
					productService.addImagePath(imageVO);
				}

			}





			//删除服务器旧图片
			for (int j = 1; j < imageCodes.length; j++) {

				String oldPath = request.getServletContext().getRealPath(imageCodes[j]);
				File file = new File(oldPath);
				if(file.exists()){
					file.delete();
				}

			}






		return "redirect:/product/toFindList.jhtml";
	}



	//查询前跳转
	@RequestMapping("toFindList")
	public  String  toFindList(){
		return "product/shopProduct";
	}
	//
	/**
	 * <pre>findProductList(产品查询展示)
	 * 创建人：童湘博 2329157467@qq.com
	 * 创建时间：2018年12月25日 下午10:26:48
	 * 修改人：童湘博 2329157467@qq.com
	 * 修改时间：2018年12月25日 下午10:26:48
	 * 修改备注：
	 * @return</pre>
	 */
	@RequestMapping("findProductListByDatatable")
	@ResponseBody
	public ServerResponse findProductList(  Integer draw, Integer start, Integer length, Integer brandId, Product product,HttpServletRequest request){
   /* 方法一单个属性获取
       String rankColumn=  request.getParameter("order[0][column]");
		String rankDirection= request.getParameter("order[0][dir]");
		String rankName= request.getParameter("columns["+rankColumn+"][data]");
*/
       //构建排序数据
		getRankWhereData(product, request);


		product.setStartPos(start);
        product.setPageSize(length);
        product.getBrand().setId(brandId);

        List<Product> productList=productService.findProductList(product);


		Long totalCount=productService.findTotalCount(product);
		product.setTotalCount(totalCount);
		product.calculatePage();

       // User sessionUser = (User)request.getSession().getAttribute(Global.USER_LOGIN_SESSION);

        /*sessionUser.setLonginTime(new Date());
        request.getSession().setAttribute(Global.USER_LOGIN_SESSION,sessionUser);*/



		DatableResult data = DatableResult.build(draw, totalCount, totalCount, productList);
		return ServerResponse.success(data);

	}

	public void getRankWhereData(Product product, HttpServletRequest request) {
		//方法二单个属性获取
		Map<String, String[]> parameterMap = request.getParameterMap();
		String rankColumn = parameterMap.get(Global.RANK_NAME)[0];

		String rankDirection = parameterMap.get(Global.RANK_DIRECTION)[0];

		String rankName = BaseAction.getRankName(parameterMap, rankColumn);

		//如果前台属性和后台排序所需要表字段不一致  我们需要建立属性和字段之间的映射  让前后属性和台字段 一一对应
        Map fileMap=new HashMap<>();
		fileMap.put("price","price");
		fileMap.put("createTime","createTime");
		fileMap.put("updateTime","updateTime");


		//
		if(Integer.parseInt(rankColumn)!=0) {
			String rankNameMap = StringUtils.isEmpty(rankName) ? rankName : (String) fileMap.get(rankName);
			product.setData_rank_msg("p."+rankNameMap.toString());
			///product.setData_rank_msg("p."+rankName.toString());
			product.setData_rank(rankDirection);

		}


		product.setData_rank(rankDirection);
		product.setData_rank_msg(rankName);
	}




	//图片上传

	@RequestMapping(value ="uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public ServerResponse uploadFile(@RequestParam("uploadImgFile") MultipartFile uploadImgFile, HttpServletRequest request){


            TengXunYun.postImage(uploadImgFile);


		String copyFile=null;
		try {
			String realPath = request.getServletContext().getRealPath("/image");

			InputStream inputStream = uploadImgFile.getInputStream();
			 copyFile = FileUtil.copyFile(inputStream, uploadImgFile.getOriginalFilename(), realPath );

		} catch (IOException e) {
			e.printStackTrace();
		}




		return ServerResponse.success(copyFile);
	}



}
