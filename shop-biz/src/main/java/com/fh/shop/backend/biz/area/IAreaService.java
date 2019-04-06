package com.fh.shop.backend.biz.area;

import com.fh.shop.backend.po.Area;

import java.util.List;

public interface IAreaService {
    List<Area> findZTreeArea();

    void addAreaInfo(Area dept);

    void batchDelete(String ids);

    void updateAreaInfo(Area dept);

    List<Area> findCityList(Area city);
}
