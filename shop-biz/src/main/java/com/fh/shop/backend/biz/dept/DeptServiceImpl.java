package com.fh.shop.backend.biz.dept;

import com.fh.shop.backend.mapper.dept.IDeptMapper;
import com.fh.shop.backend.mapper.user.IUserMapper;
import com.fh.shop.backend.po.Dept;
import com.fh.shop.backend.util.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DeptServiceImpl implements IDeptService {
    @Autowired
    private IDeptMapper deptMapper;
    @Autowired
    private IUserMapper userMapper;
    @Override
    public List<Dept> findZTreeDept() {
        //调出缓存
        CacheManager instance = CacheManager.getInstance();
        Object deptList = instance.getObj("zTreeDeptList");
        //判断缓存中是否有数据 如果有直接从缓存中取数据  如果没有则查询数据库
        if(deptList!=null){

           return (List<Dept>) deptList;
        }
         //查询数据库
        List<Dept> zTreeDeptList = deptMapper.findZTreeDept();
        //更新新缓存
        instance.putObj("zTreeDeptList",zTreeDeptList);
        return zTreeDeptList;
    }

    @Override
    public void addDeptInfo(Dept dept) {
        deptMapper.addDeptInfo(dept);
        //清除缓存
        CacheManager.getInstance().remove("zTreeDeptList");
    }

    @Override
    public void batchDelete(String ids) {
        List<Integer> list=new ArrayList<>();
      String[] idsArr= ids.split(",");
        for (int i = 0; i < idsArr.length; i++) {
            list.add(Integer.parseInt(idsArr[i])) ;
        }


        deptMapper.batchDelete(list);
        userMapper.batchDeleteByDeptId(list);
        //清除缓存
        CacheManager.getInstance().remove("deptList");
}

    @Override
    public void updateDeptInfo(Dept dept) {
        deptMapper.updateDeptInfo(dept);

        //清除缓存
        CacheManager.getInstance().remove("deptList");
    }


}
