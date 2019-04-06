package com.fh.shop.backend.controller.area;

import com.fh.shop.backend.biz.area.IAreaService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/area")
public class AreaController {
    @Autowired
    private IAreaService areaService;

  @RequestMapping("toFindAreaList")
  public String toFindAreaList(){
      return "area/areaList";
  }


    @RequestMapping("findZTreeArea")
    @ResponseBody
    public ServerResponse findZTreeArea(){
     List<Area> list= areaService.findZTreeArea();
      return ServerResponse.success(list);
    }


    @RequestMapping("addAreaInfo")
    @ResponseBody
    public ServerResponse addAreaInfo(Area dept){
        areaService. addAreaInfo( dept);
        return ServerResponse.success(dept.getId());
    }


    @RequestMapping("batchDeleteArea")
    @ResponseBody
    public ServerResponse batchDeleteArea(String ids){
        areaService.batchDelete(ids);

        return ServerResponse.success();
    }

    @RequestMapping("updateAreaInfo")
    @ResponseBody
    public ServerResponse updateAreaInfo(Area dept){
        areaService.updateAreaInfo(dept);


        return ServerResponse.success();
    }


    @RequestMapping(value = "/findCityList",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public ServerResponse findCityList(Area area){

        List<Area> cityList= areaService.findCityList(area);

        return ServerResponse.success(cityList);

    }






}
