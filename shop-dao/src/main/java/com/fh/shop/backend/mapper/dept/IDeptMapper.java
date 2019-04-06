package com.fh.shop.backend.mapper.dept;

import com.fh.shop.backend.po.Dept;

import java.util.List;

public interface IDeptMapper {
    List<Dept> findZTreeDept();

    void addDeptInfo(Dept dept);

    void batchDelete(List<Integer> list);

    void updateDeptInfo(Dept dept);


}

