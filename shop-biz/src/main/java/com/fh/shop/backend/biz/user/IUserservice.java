package com.fh.shop.backend.biz.user;

import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.po.LoginInfo;
import com.fh.shop.backend.po.User;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface IUserservice {
/**
 * <pre>findUserList(用户信息查询)   
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2019年1月7日 下午4:38:23    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2019年1月7日 下午4:38:23    
 * 修改备注： 
 * @param user
 * @return</pre>
 */
 public User findUser(User user);
/**
 * <pre>addNewUser(注册新用户)   
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2019年1月7日 下午9:22:26    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2019年1月7日 下午9:22:26    
 * 修改备注： 
 * @param user</pre>
 */
public void addNewUser(User user);
/** <pre>addLoginInfo(日志添加)   
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2019年1月20日 上午8:00:26    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2019年1月20日 上午8:00:26    
 * 修改备注： 
 * @param loginInfo</pre>    
 */
public void addLoginInfo(LoginInfo loginInfo);


    void updateUser(User user);





    void addUserDept(User user);

    List<User> findUserById(Integer id);

    void updateUserDept(User user);


    void batchDelete(String ids);


    List<User> findUserByDept(String ids);

    void batchChangeDept(User user);

    DatableResult findUserDatatable(Integer draw, Integer start, Integer length, User user);


    void exportExcelByDept(String cellIds, String sonId, HttpServletResponse response);
}
