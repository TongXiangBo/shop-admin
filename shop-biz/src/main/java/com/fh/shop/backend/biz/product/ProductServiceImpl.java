/** 
 * <pre>项目名称:shop_admin_v1 
 * 文件名称:ProductServiceImpl.java 
 * 包名:com.fh.shop.backend.biz.product 
 * 创建日期:2018年12月23日下午7:43:35 
 * Copyright (c) 2018, xxxxxx@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.backend.biz.product;


import com.fh.shop.backend.common.FileUtil;
import com.fh.shop.backend.mapper.brand.IBrandMapper;
import com.fh.shop.backend.mapper.product.IProductMapper;
import com.fh.shop.backend.po.Brand;
import com.fh.shop.backend.po.ImageVO;
import com.fh.shop.backend.po.Product;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/** 
 * <pre>项目名称：shop_admin_v1    
 * 类名称：ProductServiceImpl    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月23日 下午7:43:35    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月23日 下午7:43:35    
 * 修改备注：       
 * @version </pre>    
 */
//@Service("ttt")
 @Service
 public class ProductServiceImpl implements IProductService {
   @Autowired
	private IProductMapper   productMapper;
	@Resource(name = "productServiceImpl")
	private IProductService productService;
	//@Resource(name="brandServiceImpl")
	@Autowired
	private IBrandMapper brandMapper;
	/* (non-Javadoc)
	 * @see com.fh.shop.backend.biz.product.IProductService#addProduct(com.fh.shop.backend.po.Product)    
	 */
	@Override
	public void addProduct(Product product) {

		productMapper.addProduct(product);
		
	//	throw new RuntimeException("======rrrr");
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#findProductList()    
	 */
	@Override
	public List<Product> findProductList(Product product) {
			List<Product>	 list=productMapper.findProductList(product);
			return list;
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#deleteProduct(java.lang.Integer)    
	 */
	@Override
	public void deleteProduct(Integer id) {
		productMapper.deleteProduct(id);

	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#batchDelete(java.lang.String)    
	 */
	@Override
	public void batchDelete(String ids) {
		List<Integer> list=new ArrayList<Integer>();
		String[] split = ids.split(",");
		for (String id : split) {
			list.add(Integer.valueOf(id));
		}
		productMapper.batchDelete(list);
	///	throw new RuntimeException("-------------1111");
		
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#toUpdateProduct(java.lang.Integer)    
	 */
	@Override
	public Product toUpdateProduct(Integer id) {
		Product product = productMapper.toUpdateProduct(id);
		return product;
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#updateProduct(com.fh.shop.backend.po.Product)    
	 */
	@Override
	public void updateProduct(Product product) {
		product.setCreateTime(new Date());
		product.setUpdateTime(new Date());
		productMapper.updateProduct(product);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.product.IProductService#findTotalCount(com.fh.shop.backend.po.Product)    
	 */
	@Override
	public Long findTotalCount(Product product) {
		Long totalCount = productMapper.findTotalCount(product);
		return totalCount;
	}

    @Override
    public List<Product> findProductExcel(Product product) {
		List<Product> productExcel = productMapper.findProductExcel(product);
		return productExcel;
    }

    @Override
    public void addImagePath(ImageVO imageVO) {
        productMapper.addImagePath(imageVO);
    }

	@Override
	public List<ImageVO> findProductImage() {
		List<ImageVO> productImage = productMapper.findProductImage();
		return productImage;

	}




	@Override
	public List<ImageVO> LookProductImage(Integer productId) {
		return productMapper.LookProductImage(productId);
	}

    @Override
    public void updateImagePath(ImageVO imageVO) {
        productMapper.updateImagePath(imageVO);
    }

    @Override
    public void deleteImage(String imagePath) {
		productMapper.deleteImage(imagePath);
    }

	@Override
	public List<ImageVO> findProductIdList(String imagePath) {
		List<ImageVO> list=productMapper.findProductIdList(imagePath);
		return list;
	}

	@Override
	public void deleteImageById(Integer id) {
		productMapper.deleteImageById(id);
	}

	/**
	 * @param product
	 * @param response
	 */
    @Override
    public void exitExcel(Product product, HttpServletResponse response) {
          //查询品牌数据
		List<Brand> brandList = brandMapper.findBrandSelect();
		//创建工作簿
		XSSFWorkbook workbook = createWrokbook(product, brandList);
		//  调用工具类下载Excel
		FileUtil.excelDownload(workbook,response);

    }



    public XSSFWorkbook createWrokbook(Product product, List<Brand> brandList) {
    	//创建工作簿
		XSSFWorkbook workbook = new XSSFWorkbook();

		//创建sheet页 并给它命名
		buildSheet(product, brandList, workbook);

		return workbook;
	}
     ///创建sheet
	public void buildSheet(Product product, List<Brand> brandList, XSSFWorkbook workbook) {
		//品牌列表数据查询
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
			//创建sheet页 并给它命名
			XSSFSheet sheet = createSheetHead(brandList, workbook, productList, i);
			//插入表格主体内容
			buildSheetBody(workbook, productList, sheet);


		}
	}

	public void buildSheetBody(XSSFWorkbook workbook, List<Product> productList, XSSFSheet sheet) {
    	//创建表格主体格式
		//创建时间格式
		XSSFCellStyle dateStyle = workbook.createCellStyle();
		dateStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));
		//创建价格显示格式
		XSSFCellStyle priceStyle = workbook.createCellStyle();
		priceStyle.setFillForegroundColor(HSSFColor.RED.index);
		priceStyle.setFillPattern(HSSFCellStyle.ALIGN_FILL);
        //插入表格主体内容
		insertSheetContent(productList, sheet, dateStyle, priceStyle);

	}

	public void insertSheetContent(List<Product> productList, XSSFSheet sheet, XSSFCellStyle dateStyle, XSSFCellStyle priceStyle) {
		//插入表格主体内容
		int rowCode=7;
		int columnIndex=6;
		for (int j = 0; j <productList.size() ; j++) {
			XSSFRow row = sheet.createRow(rowCode);

			row.createCell(columnIndex+1).setCellValue(productList.get(j).getId());
			row.createCell(columnIndex+2).setCellValue(productList.get(j).getProductName());

			XSSFCell priceCell = row.createCell(columnIndex + 3);
			priceCell.setCellValue(productList.get(j).getPrice());
			//价格单元格颜色设定
			if(productList.get(j).getPrice()<3000){
				priceCell.setCellStyle(priceStyle);
			}
			row.createCell(columnIndex+4).setCellValue(productList.get(j).getBrand().getBrandName());
			XSSFCell createTimecell = row.createCell(columnIndex + 5);
			createTimecell.setCellValue(productList.get(j).getCreateTime());
			createTimecell.setCellStyle(dateStyle);
			XSSFCell updateTimeCell = row.createCell(columnIndex + 6);
			updateTimeCell.setCellValue(productList.get(j).getUpdateTime());
			updateTimeCell.setCellStyle(dateStyle);
			rowCode++;
		}
	}
	//创建sheet页
	public XSSFSheet createSheetHead(List<Brand> brandList, XSSFWorkbook workbook, List<Product> productList, int i) {

		//创建标题样式
		XSSFCellStyle titleStyle = buildTitleStyle(workbook);

		//创建sheet页 并给它命名
		XSSFSheet sheet = workbook.createSheet(brandList.get(i).getBrandName()+"【"+productList.size()+"】");
		XSSFCellStyle HeadStyle = buildTitleAndHeadStyle(workbook, titleStyle, sheet);


		XSSFRow HeadRow = sheet.createRow(6);
		String[]  titleCellName={"编号","产品名称","产品价格","产品品牌","创建时间","修改时间"};
		//插入表头内容
		insertTitleMessage(HeadStyle, HeadRow, titleCellName);
		return sheet;
	}

	//插入表头内容
	public void insertTitleMessage(XSSFCellStyle headStyle, XSSFRow headRow, String[] titleCellName) {
		for (int j = 0; j < titleCellName.length; j++) {

			XSSFCell HeadRowCell1 = headRow.createCell(j + 7);
			HeadRowCell1.setCellValue(titleCellName[j]);
			HeadRowCell1.setCellStyle(headStyle);
		}
	}

	public XSSFCellStyle buildTitleAndHeadStyle(XSSFWorkbook workbook, XSSFCellStyle titleStyle, XSSFSheet sheet) {
		//创建标题行信息
		//创建标题行样式
		buildTitleStyle(titleStyle, sheet);

		//创建表头样式
		XSSFCellStyle HeadStyle = buildHeadStyle(workbook);

		return HeadStyle;
	}

	public XSSFCellStyle buildHeadStyle(XSSFWorkbook workbook) {
		//创建表头样式
		XSSFCellStyle HeadStyle = workbook.createCellStyle();
		HeadStyle.setAlignment(HorizontalAlignment.CENTER);
		HeadStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		//背景色
		HeadStyle.setFillBackgroundColor(HSSFColor.YELLOW.index);//设置图案背景色
		HeadStyle.setFillPattern(HSSFCellStyle.ALIGN_FILL);

		XSSFFont TitleRowFont = workbook.createFont();
		TitleRowFont.setFontName("华文行楷");
		TitleRowFont.setBold(true);
		TitleRowFont.setFontHeightInPoints((short) 12);
		HeadStyle.setFont(TitleRowFont);
		return HeadStyle;
	}

	public void buildTitleStyle(XSSFCellStyle titleStyle, XSSFSheet sheet) {
		//创建标题行样式
		XSSFRow titleRow = sheet.createRow(2);
		XSSFCell titleRowCell =  titleRow.createCell(7);
		titleRowCell.setCellStyle(titleStyle);
		titleRowCell.setCellValue("商品表");
		CellRangeAddress cellRangeAddress = new CellRangeAddress(2,5,7,12);
		sheet.addMergedRegion(cellRangeAddress);
	}

	public XSSFCellStyle buildTitleStyle(XSSFWorkbook workbook) {
		//创建表名样式
		XSSFCellStyle HeadStyle = workbook.createCellStyle();
		//水平居中
		HeadStyle.setAlignment(HorizontalAlignment.CENTER);
		//垂直居中
		HeadStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		//背景色
		HeadStyle.setFillBackgroundColor(HSSFColor.GREEN.index);//设置图案背景色
		HeadStyle.setFillPattern(HSSFCellStyle.ALIGN_FILL);
		//字体样式
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setFontHeightInPoints((short)28);
		font.setFontName("黑体");
		font.setColor(HSSFColor.RED.index);
		HeadStyle.setFont(font);
		return HeadStyle;
	}

}

