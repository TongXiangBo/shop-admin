package com.fh.shop.backend.controller.user;

import com.fh.shop.backend.biz.user.IUserservice;
import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.common.ResponseEnum;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.controller.BaseController;
import com.fh.shop.backend.po.User;
import com.fh.shop.backend.util.*;
import com.google.gson.Gson;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("user")
public class UserController  extends BaseController {
	@Resource
	private IUserservice userService;

	@RequestMapping("toLogin")
	public String toLogin(){
		
		return "/user/userLogin";
	}



@RequestMapping("userLogin")
public String userLogin(User user, HttpSession session, HttpServletRequest request,HttpServletResponse response){







		//验证验证码是否正确
		//String imageCode = (String) session.getAttribute(Global.IMAGE_IMAGECODE);
	  String fh_id = CookieUtil.readCookie(request, Global.REDIS_SESSION_SESSIONID);
	   String imageCode = RedisUtil.get(Global.REDIS_SESSION_IMAGECODE+fh_id);


	if (!imageCode.equals(user.getImageCode())) {
			session.setAttribute("error", "验证码错误，请确认后登陆！！！");
			return "/user/userLogin";
		}




    User userDB=userService.findUser(user);

	if(userDB.getErrorTimes()>=Global.LOGIN_ERROR_COUNT_MAX){

		session.setAttribute("error", "您的账户已被锁定，请联系管理员！！！");
		return "/user/userLogin";
	}
	//错误登录超过三次 将登录状态改为锁定
	//判断错误登录次数


    /*//再次查询数据库
	User userDB=userService.findUser(user);*/



		//判断账号是否正确
		if (!userDB.getUserName().equals(user.getUserName()))  {
			session.setAttribute("error", "用户名错误，请确认后登陆！！！");
			return "/user/userLogin";
		}
		//判断密码是否正确
		//提交密码 salt加盐 MD5加密后对比
		String MD5Password = MD5Util.getStringMD5(user.getPassword() + userDB.getSalt());
		if (!MD5Password.equals(userDB.getPassword())) {

            //判断是否是当天
            Date date=	new Date();
            Date currentDate=DateUtil.String2Date(DateUtil.Date2String(date,DateUtil.FULL_DATE_FORMAT),DateUtil.YEAR_MONTH_DATE);
            Date errorDate=	DateUtil.String2Date(DateUtil.Date2String(userDB.getErrorLoginTime(),DateUtil.FULL_DATE_FORMAT),DateUtil.YEAR_MONTH_DATE);

            //判断是否是第一次错误登录
            if(null==userDB.getErrorLoginTime()){
                userDB.setErrorLoginTime(currentDate);
                userDB.setErrorTimes(Global.LOGIN_ERROR_COUNT_FIRST);
                userService.updateUser(userDB);
                session.setAttribute("error", "密码错误，您今天登录次数还剩"+(Global.LOGIN_ERROR_COUNT_MAX-1-userDB.getErrorTimes()));
                return "/user/userLogin";
            }


            if(currentDate.after(errorDate)){
                //判断错误登录次数

                    //重置错误登录次数
                    userDB.setErrorTimes(Global.LOGIN_ERROR_COUNT_DEFAULT);
                    //登录状态设为未登录
                    userDB.setLoginStatus(Global.LOGIN_STATUS_DEFAULT);
                    userService.updateUser(userDB);

            }





			//错误登录次数判断
			if(userDB.getErrorTimes()<Global.LOGIN_ERROR_COUNT_MAX) {

				userDB.setErrorLoginTime(date);


				session.setAttribute("user", userDB);
				session.setAttribute("error", "密码错误，您今天登录次数还剩"+(Global.LOGIN_ERROR_COUNT_MAX-1-userDB.getErrorTimes()));
				userDB.setErrorTimes(userDB.getErrorTimes()+1);
				userService.updateUser(userDB);
                return "/user/userLogin";
			}


                   //第三次错误登录
				userDB.setErrorLoginTime(date);
				userDB.setLoginStatus(Global.LONIN_LOCK_STATUS);
				userDB.setErrorTimes(userDB.getErrorTimes()+1);
				userService.updateUser(userDB);
				session.setAttribute("user", userDB);
				session.setAttribute("error", "连续错误登录次数超过三次，您的账户已被锁定，请联系管理员！！！");

			//session.setAttribute("error", "密码错误，请确认后登陆！！！");
			//记录用户错误登录信息



			return "/user/userLogin";
		}
	    //将用户登录信息存入session
			//session.setAttribute("user", userDB);
	Gson gson = new Gson();
	String userDBJson = gson.toJson(userDB);
	RedisUtil.set(Global.REDIS_SESSION_USERDB+fh_id,userDBJson);
	RedisUtil.expire(Global.REDIS_SESSION_USERDB+fh_id,30*60);


		//登录成功重置登录次数和登录状态
	   userDB.setLoginStatus(Global.LONIN_SUCCESS_STATUS);
	   userDB.setErrorTimes(Global.LOGIN_ERROR_COUNT_DEFAULT);
	   userService.updateUser(userDB);


    //跳转到成功页面
	return "redirect:/product/toFindList.jhtml";
		}





	@RequestMapping("userLoginAjax")
	public ServerResponse userLoginAjax(User user, HttpSession session){

		User userDBDate=userService.findUser(user);
		//错误登录超过三次 将登录状态改为锁定
		//判断错误登录次数
		//判断是否是当天
		Date date=	new Date();
	Date currentDate=DateUtil.String2Date(DateUtil.Date2String(date,DateUtil.FULL_DATE_FORMAT),DateUtil.YEAR_MONTH_DATE);
	Date errorDate=	DateUtil.String2Date(DateUtil.Date2String(userDBDate.getErrorLoginTime(),DateUtil.FULL_DATE_FORMAT),DateUtil.YEAR_MONTH_DATE);
       if(currentDate.after(errorDate)){
          	//重置错误登录次数
		   userDBDate.setErrorTimes(0);
		   //登录状态设为未登录
		   userDBDate.setLoginStatus(0);
		   userService.updateUser(userDBDate);
	   }

	   //再次查询数据库
		User userDB=userService.findUser(user);



    //验证验证码是否正确
		String imageCode = (String) session.getAttribute(Global.IMAGE_IMAGECODE);
		if (!imageCode.equals(user.getImageCode())) {
			session.setAttribute("error", "验证码错误，请确认后登陆！！！");
			return ServerResponse.error(ResponseEnum.LOGINRROR_IMAGECODE_ERROR);
		}
		//判断账号是否正确
		if (userDB == null) {

			session.setAttribute("error", "用户名错误，请确认后登陆！！！");
			return ServerResponse.error(ResponseEnum.LOGINRROR_USERNAME_ERROR);
		}

		//判断密码是否正确
		//提交密码 salt加盐 MD5加密后对比
		String MD5Password = MD5Util.getStringMD5(user.getPassword() + userDB.getSalt());
		if (!MD5Password.equals(userDB.getPassword())) {
            //错误登录次数判断
			/*if(userDB != null&&userDB.getErrorTimes()<3) {

				userDB.setErrorLoginTime(date);

				userDB.setErrorTimes(userDB.getErrorTimes()+1);
				userService.updateUser(userDB);
				session.setAttribute("user", userDB);
				session.setAttribute("error", "密码错误，您今天登录次数还剩"+(2-userDB.getErrorTimes()));
			}

			if(userDB != null&&userDB.getErrorTimes()>=3) {

				userDB.setErrorLoginTime(date);
				userDB.setLoginStatus(Global.LONIN_LOCK_STATUS);
				userDB.setErrorTimes(userDB.getErrorTimes()+1);
				userService.updateUser(userDB);
				session.setAttribute("user", userDB);
				session.setAttribute("error", "今天登录次数超过三次，您的账户已被锁定！！！");
			}*/





			return ServerResponse.error(ResponseEnum.LOGINRROR_PASSWORD_ERROR);
		}
		session.setAttribute("user", userDB);

							/*//记录用户错误登录信息

							userDB.setErrorLoginTime(new Date());
							userDB.setErrorTimes(userDB.getErrorTimes() + 1);
							//修改信息
							userService.updateUser(userDB);*/

		return ServerResponse.success(ResponseEnum.SUCCESS);
	}

     //账户解锁
    @RequestMapping("resetLockUser")
    @ResponseBody
    public ServerResponse resetLockUser(User user,HttpServletRequest request){

        //用户名 密码非空判断
        if(null==user.getUserName()||null==user.getPassword()){
            return ServerResponse.error(ResponseEnum.LOGINRROR_USERNAME_PASSWORD_EMPTY);
        }

        //验证验证码是否正确
        String imageCode = (String)request.getSession().getAttribute(Global.IMAGE_IMAGECODE);
        if (!imageCode.equals(user.getImageCode())) {
            return ServerResponse.error(ResponseEnum.LOGINRROR_IMAGECODE_ERROR);
        }
         User userDB=  userService.findUser(user);
        //用户名判断
       if(null==userDB.getUserName()){

           return ServerResponse.error(ResponseEnum.USERNAME_NOT_EXIT);
       }
       //判断密码
        //加密加盐反向编译对比密码
      String passwordMD5=MD5Util.getStringMD5(user.getPassword()+userDB.getSalt());
       if(!passwordMD5.equals(userDB.getPassword())){
           return ServerResponse.error(ResponseEnum.LOGINRROR_PASSWORD_ERROR);
       }
       //验证通过  解锁
        userDB.setLoginStatus(Global.LOGIN_STATUS_DEFAULT);
       userDB.setErrorTimes(Global.LOGIN_ERROR_COUNT_DEFAULT);
        userService.updateUser(userDB);
        return ServerResponse.error(ResponseEnum.USERLOCK_CLEAN);
    }


	/**
	 * <pre>validateUserName(注册时验证名称是否存在)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月7日 下午9:12:23    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月7日 下午9:12:23    
	 * 修改备注： 
	 * @param user
	 * @param </pre>
	 */
	@RequestMapping("validateUserName")
	@ResponseBody
	public  ServerResponse  validateUserName(User user){
		User userDB=userService.findUser(user);
		//判断账号是否正确
		//Map<String, Object> map = new HashMap<>();
		if(userDB!=null){
		   return  ServerResponse.error(ResponseEnum.LOGINRROR_USERNAME_REPEAT);
		      }else{
		   return ServerResponse.success();
		    	  }
		      //判断账号是不正确
		
	}
	/**
	 * <pre>addNewUser(注册新用户)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月7日 下午9:20:48    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月7日 下午9:20:48    
	 * 修改备注： 
	 * @param user
	 * @param response</pre>
	 */
	@RequestMapping("addNewUser")
	public void addNewUser(User user,HttpServletResponse response){
		//密码加盐加密
		String salt = UUID.randomUUID().toString();
		String MD5PassWord = MD5Util.getStringMD5(user.getPassword()+salt);
		user.setSalt(salt);
		user.setPassword(MD5PassWord);
		userService.addNewUser(user);
	//	outJson("201", response);
		
	}
	/**
	 * <pre>exitLogin(退出登陆)   
	 * 创建人：童湘博 2329157467@qq.com    
	 * 创建时间：2019年1月8日 上午8:51:14    
	 * 修改人：童湘博 2329157467@qq.com     
	 * 修改时间：2019年1月8日 上午8:51:14    
	 * 修改备注： 
	 * @param Request
	 * @return</pre>
	 */
	@RequestMapping("exitLogin")
	public  String  exitLogin(HttpServletRequest Request){
		HttpSession  session=Request.getSession();
		session.removeAttribute("user");
		return "redirect:/user/toLogin.jhtml";
	}



	//查询前跳转
	@RequestMapping("toFindUserList")
	public  String  toFindUserList(){
		return "user/userList";
	}


	//查询

    @RequestMapping("findUserList")
	@ResponseBody
	public ServerResponse   findUserList(Integer draw, Integer start, Integer length,User user) {

		DatableResult data=	userService.findUserDatatable(draw, start, length, user);





		return ServerResponse.success(data);
	}

	@RequestMapping("batchDelete")
	@ResponseBody
	public ServerResponse batchDelete(String ids){
		userService.batchDelete(ids);


		return ServerResponse.success();
	}

   //添加
	@RequestMapping("addUserDept")
	@ResponseBody
	public ServerResponse  addUserDept(User user){
		userService.addUserDept(user);


		return ServerResponse.success();
	}

	//回显
	@RequestMapping("findUserById")
	@ResponseBody
   public ServerResponse findUserById(String ids){
		Integer id=Integer.valueOf(ids);
	List<User> list=	userService. findUserById(id);

		return ServerResponse.success(list);
   }
   //修改
   @RequestMapping("updateUserDept")
   @ResponseBody
	public ServerResponse updateUserDept(User user){
	   userService.updateUserDept(user);


		return ServerResponse.success();
	}

	//按部门查询
	@RequestMapping("findUserByDept")
	@ResponseBody
	public ServerResponse findUserByDept(String ids){
	List<User> list =userService.findUserByDept(ids);


		return ServerResponse.success(list);
	}
    //批量换部门
	@RequestMapping("batchChangeDept")
	@ResponseBody
	public ServerResponse batchChangeDept(User user){
		userService.batchChangeDept(user);



		return ServerResponse.success();
	}


	@RequestMapping("exportExcelByDept")
	@ResponseBody
	public ServerResponse exportExcelByDept(String cellIds,String sheetName,HttpServletResponse response){

		userService.exportExcelByDept(cellIds,sheetName,response);
		return ServerResponse.success();
	}


    @RequestMapping("/quitLogin")
    public String quitLogin(HttpServletRequest request,HttpServletResponse response){
		String fh_id = CookieUtil.readCookie(request, Global.REDIS_SESSION_SESSIONID);
		if(StringUtils.isNotEmpty(fh_id)){
			RedisUtil.del(Global.REDIS_SESSION_USERDB+fh_id);
			CookieUtil.deleteCookie(response,Global.REDIS_SESSION_SESSIONID+fh_id,Global.REDIS_SESSION_DOMAIN);
			RedisUtil.del(Global.REDIS_SESSION_IMAGECODE+fh_id);
		}
		//删除session
         request.getSession().removeAttribute("user");

		return "redirect:/user/toLogin.jhtml";
	}


}
