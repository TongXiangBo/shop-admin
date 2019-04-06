
 
 
package com.fh.shop.backend.controller;

import com.fh.shop.backend.common.FileVO;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  
 * <pre>项目名称：shop_admin_v1    
 * 类名称：BaseController    
 * 类描述：    
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2018年12月26日 下午6:35:10    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2018年12月26日 下午6:35:10    
 * 修改备注：       
 * @version </pre>
 */
 
public class BaseController {

	//获取FileMP实体类
	public static Map getFileMap(MultipartFile multipartFile){
       Map<String,Object>  fileMap=   new HashMap<>();

		InputStream inputStream =null;
		String originalFilename =null;
		long size =0;
		try {
			inputStream = multipartFile.getInputStream();
		     originalFilename = multipartFile.getOriginalFilename();
			 size = multipartFile.getSize();
			fileMap.put("inputStream",inputStream);
			fileMap.put("originalFilename",originalFilename);
			fileMap.put("size",size);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return fileMap;

	}



	//获取FileVO实体类
	protected FileVO getFileVO(MultipartFile multipartFile){

		FileVO fileVO=new FileVO();
		InputStream inputStream =null;
		try {
			inputStream = multipartFile.getInputStream();
			fileVO.setInputStream(inputStream);
			fileVO.setOriginalFilename(multipartFile.getOriginalFilename());
			fileVO.setSize(multipartFile.getSize());
		} catch (IOException e) {
			e.printStackTrace();
		}



		return fileVO;

	}

	//获取FileVOList实体类
	protected List<FileVO> getFileVOList(MultipartFile[] multipartFiles,MultipartFile multipartFile){
		List<FileVO> fileVOList = new ArrayList<>();

		for (int i = 0; i <multipartFiles.length ; i++) {
			if(multipartFiles[i].getSize()>0) {
				/*FileVO fileVO = new FileVO();
				InputStream inputStream = null;
				try {

					inputStream = multipartFile[i].getInputStream();
					fileVO.setInputStream(inputStream);
					fileVO.setOriginalFilename(multipartFile[i].getOriginalFilename());
					fileVO.setSize(multipartFile[i].getSize());

				} catch (IOException e) {
					e.printStackTrace();
				}*/
                 //调用单个获取file方法
				FileVO fileVO = getFileVO(multipartFile);

				fileVOList.add(fileVO);
			}

		}


		return fileVOList;
	}

	//获取FileVOList实体类
	public static List<Map> getFileMapList(MultipartFile[] multipartFiles,MultipartFile multipartFile){
		List<Map> fileVOList = new ArrayList<>();

		for (int i = 0; i <multipartFiles.length ; i++) {
			if(multipartFiles[i].getSize()>0) {

				/*Map<String,Object>  fileMap=   new HashMap<>();
				InputStream inputStream =null;
				String originalFilename =null;
				long size =0;

				try {

					inputStream = multipartFiles[i].getInputStream();
					originalFilename = multipartFiles[i].getOriginalFilename();
					size = multipartFiles[i].getSize();
					fileMap.put("inputStream",inputStream);
					fileMap.put("originalFilename",originalFilename);
					fileMap.put("size",size);

				} catch (IOException e) {
					e.printStackTrace();
				}*/
				Map fileMap = getFileMap(multipartFile);
				fileVOList.add(fileMap);
			}

		}


		return fileVOList;
	}





	public void outJson(String json, HttpServletResponse response) {
		
		//response.setContentType("application/json;character=utf-8");
		//response.setCharacterEncoding("utf-8");
		//提取关流
		PrintWriter writer = null;
		try {
			//response调用getWriter方法创建writer
			 writer = response.getWriter();
			 //将字符串写入write，返回到前台，响应ajax
			 writer.write(json);
			 //刷新
			 writer.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//关流
			if (null != writer) {
				//关闭writer
				writer.close();
				//将writer 制空，释放资源
				writer = null;
			}
		}
	}

}
