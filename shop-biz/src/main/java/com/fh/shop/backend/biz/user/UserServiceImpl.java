package com.fh.shop.backend.biz.user;

import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.common.FileUtil;
import com.fh.shop.backend.mapper.dept.IDeptMapper;
import com.fh.shop.backend.mapper.user.IUserMapper;
import com.fh.shop.backend.po.LoginInfo;
import com.fh.shop.backend.po.User;
import com.fh.shop.backend.util.DateUtil;
import com.fh.shop.backend.util.MD5Util;
import com.fh.shop.backend.vo.UserVo;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service

public class UserServiceImpl implements IUserservice {
   @Autowired
	private  IUserMapper  userMapper;
   @Autowired
   private IDeptMapper   deptMapper;

	@Override
	public User findUser(User user) {
     User userInfo = userMapper.findUser(user);
		
		return userInfo; 
	}

	@Override
	public void addNewUser(User user) {
		userMapper.addNewUser(user);
		
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.backend.biz.user.IUserservice#addLoginInfo(com.fh.shop.backend.po.LoginInfo)    
	 */
	@Override
	public void addLoginInfo(LoginInfo loginInfo) {
		userMapper.addLoginInfo(loginInfo);
		
	}

    @Override
    public void updateUser(User user) {
		userMapper.updateUser(user);
    }



    @Override
    public void addUserDept(User user) {
		//生成盐
	String salt=	UUID.randomUUID().toString();
	   //加盐加密
	String passwordMd5=	MD5Util.getStringMD5(MD5Util.getStringMD5(user.getPassword())+salt);
      //加密后存入数据库
		user.setSalt(salt);
		user.setPassword(passwordMd5);
		userMapper.addUserDept(user);
    }

	@Override
	public List<User> findUserById(Integer id) {


		List<User> userById = userMapper.findUserById(id);

		return userById;
	}

	@Override
	public void updateUserDept(User user) {
		userMapper.updateUserDept(user);
	}

	@Override
	public void batchDelete(String ids) {
		ArrayList<Integer> list = new ArrayList<>();
		String[] split = ids.split(",");
		for (String s : split) {
			list.add(Integer.parseInt(s));
		}
		userMapper.batchDelete(list);
	}

    @Override
    public List<User> findUserByDept(String ids) {
       List<Integer> list = new ArrayList<>();
        String[] split = ids.split(",");
        for (String s : split) {
           list.add(Integer.parseInt(s));
        }
        List<User>  userList=  userMapper.findUserByDept(list);
        return userList;
    }

    @Override
    public void batchChangeDept(User user) {
        List<Integer> list=new ArrayList<>();
		String ids = user.getIds();
		String[] split = ids.split(",");


		for (String s : split) {
			list.add(Integer.parseInt(s));

		}

		user.setIntegerList(list);

		userMapper.batchChangeDept(user);
    }

	@Override
	public DatableResult findUserDatatable(Integer draw, Integer start, Integer length, User user) {
           //排序数据整合
		  buildRankData(user);

         //datatable 数据组装
		DatableResult data = getDatableResult(draw, user);


		return data;
	}

	@Override
	public void exportExcelByDept(String cellIds, String sheetName, HttpServletResponse response) {


		String[] cellIdList = cellIds.split(";");
		String[] sheetNameArr = sheetName.split(",");
		XSSFWorkbook workbook = new XSSFWorkbook();
		for (int j = 0; j < cellIdList.length; j++) {
			List<Integer>  cellList=new ArrayList<>();
			String sheets = sheetNameArr[j];
			XSSFSheet sheet = workbook.createSheet(sheets);
			XSSFRow row = sheet.createRow(0);
			row.createCell(0).setCellValue("用户姓名");
			row.createCell(1).setCellValue("性别");
			row.createCell(2).setCellValue("生日");
			row.createCell(3).setCellValue("部门");
			row.createCell(4).setCellValue("薪资");
			String[] idArr = cellIdList[j].split(",");
			for (int i = 0; i <idArr.length ; i++) {
				cellList.add(Integer.valueOf(idArr[i]));
			}

			int rowCode=1;
			List<User> userList=userMapper.findDeptList(cellList);
			for (int q = 0; q < userList.size(); q++) {
				User user = userList.get(q);
				XSSFRow rowSingle = sheet.createRow(rowCode);
				rowSingle.createCell(0).setCellValue(user.getRealName());
				rowSingle.createCell(1).setCellValue(user.getSex());
				rowSingle.createCell(2).setCellValue(user.getBirthday());
				rowSingle.createCell(3).setCellValue(user.getDept().getDeptName());
				rowSingle.createCell(4).setCellValue(user.getSalary());
				rowCode++;
			}

		}
		FileUtil.excelDownload(workbook, response);




	}

	/*=============================================================================================*/
   /* @Override
    public void exportExcelByDept(Integer sonId,HttpServletResponse response) {

		//查询所需要数据
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		XSSFWorkbook workbook = new XSSFWorkbook();
		List<Dept> deptList = deptMapper.findDeptById(sonId);




		for (int i = 0; i < deptList.size(); i++) {





		XSSFSheet sheet = workbook.createSheet(deptList.get(i).getDeptName()+"【"+productList.size()+"】");
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







}*/

    public DatableResult getDatableResult(Integer draw, User user) {
		//用户列表查询
		List<User> list= userMapper.findUserList(user);
          //po转vo
		List<UserVo> voList = wrapperVo(list);

		//总条数查询
		Long totalCount=  userMapper.findTotalCount(user);
        //datable 数据组装
		return DatableResult.build(draw, totalCount, totalCount, voList);
	}

	public List<UserVo> wrapperVo(List<User> list) {
		//po转vo
		List<UserVo> voList = new ArrayList<>();
		for (User userInfo : list) {
			UserVo userVo = new UserVo();
			userVo.setId(userInfo.getId());
			userVo.setUserName(userInfo.getUserName());
			userVo.setRealName(userInfo.getRealName());
			userVo.setSex(userInfo.getSex());
			userVo.setSalary(userInfo.getSalary());
			userVo.setLoginStatus(userInfo.getLoginStatus());
			userVo.setBirthday(DateUtil.Date2String(userInfo.getBirthday(),DateUtil.YEAR_MONTH_DATE));
			userVo.setDeptName(userInfo.getDept().getDeptName());

			voList.add(userVo);
		}
		return voList;
	}

	public void buildRankData(User user) {
		//排序数据整合
		if(user.getIds()!=null&&user.getIds()!="") {
			List<Integer> list = new ArrayList<>();
			String ids = user.getIds();
			String[] split = ids.split(",");


			for (String s : split) {
				list.add(Integer.parseInt(s));

			}

			user.setIntegerList(list);
		}
	}

}
