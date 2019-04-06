package com.fh.shop.backend.biz.dept;

import com.fh.shop.backend.po.Dept;

import java.util.List;

public interface IDeptService {
    List<Dept> findZTreeDept();

    void addDeptInfo(Dept dept);

    void batchDelete(String ids);

    void updateDeptInfo(Dept dept);


}

