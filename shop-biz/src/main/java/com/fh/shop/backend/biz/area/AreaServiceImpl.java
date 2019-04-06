package com.fh.shop.backend.biz.area;

import com.fh.shop.backend.mapper.area.IAreaMapper;
import com.fh.shop.backend.po.Area;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class AreaServiceImpl implements IAreaService {
    @Resource
 private IAreaMapper areaMapper;

    @Override
    public List<Area> findZTreeArea() {
        List<Area>  list=  areaMapper.findZTreeArea();

        return list;
    }

    @Override
    public void addAreaInfo(Area area) {
        areaMapper.addAreaInfo(area);

    }

    @Override
    public void batchDelete(String ids) {
        List<Integer> list=new ArrayList<>();
        String[] idsArr= ids.split(",");
        for (int i = 0; i < idsArr.length; i++) {
            list.add(Integer.parseInt(idsArr[i])) ;
        }
        areaMapper.batchDelete(list);

    }

    @Override
    public void updateAreaInfo(Area area) {
        areaMapper.updateAreaInfo(area);
    }

    @Override
    public List<Area> findCityList(Area city) {

        return areaMapper.findCityList( city);
    }
}
