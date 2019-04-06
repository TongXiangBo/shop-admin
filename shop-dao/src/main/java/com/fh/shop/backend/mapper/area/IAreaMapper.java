package com.fh.shop.backend.mapper.area;

import com.fh.shop.backend.po.Area;

import java.util.List;

public interface IAreaMapper {
    List<Area> findZTreeArea();

    void addAreaInfo(Area area);

    void batchDelete(List<Integer> list);

    void updateAreaInfo(Area area);


    List<Area> findCityList(Area city);
}

