package com.fh.shop.backend.mapper.user;

import com.fh.shop.backend.po.LoginInfo;
import com.fh.shop.backend.po.User;

import java.util.ArrayList;
import java.util.List;

public interface IUserMapper {
  /**
   * <pre>findUser(登陆信息查询)   
   * 创建人：童湘博 2329157467@qq.com    
   * 创建时间：2019年1月7日 下午4:45:55    
   * 修改人：童湘博 2329157467@qq.com     
   * 修改时间：2019年1月7日 下午4:45:55    
   * 修改备注： 
   * @param user
   * @return</pre>
   */
  public User findUser(User user);
 /**
  * <pre>addNewUser(新用户注册)   
  * 创建人：童湘博 2329157467@qq.com    
  * 创建时间：2019年1月7日 下午9:23:42    
  * 修改人：童湘博 2329157467@qq.com     
  * 修改时间：2019年1月7日 下午9:23:42    
  * 修改备注： 
  * @param user</pre>
  */
 public void addNewUser(User user);
/** <pre>addLoginInfo(日志添加)   
 * 创建人：童湘博 2329157467@qq.com    
 * 创建时间：2019年1月20日 上午8:02:12    
 * 修改人：童湘博 2329157467@qq.com     
 * 修改时间：2019年1月20日 上午8:02:12    
 * 修改备注： 
 * @param loginInfo</pre>    
 */
public void addLoginInfo(LoginInfo loginInfo);

    void updateUser(User user);

    List<User> findUserList(User user);

    Long findTotalCount(User user);

    void addUserDept(User user);

    List<User> findUserById(Integer id);

    void updateUserDept(User user);

    void batchDelete(ArrayList<Integer> list);

    List<User> findUserByDept(List<Integer> list);

    void batchChangeDept(User list);

    void batchDeleteByDeptId(List<Integer> list);

    List<User> findDeptList(List<Integer> cellList);
}



