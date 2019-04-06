package com.fh.shop.backend.controller.brand;

import com.fh.shop.backend.biz.brand.IBrandImageService;
import com.fh.shop.backend.po.BrandImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/brandImage")
public class BrandImageController {
    @Autowired
    private IBrandImageService brandImageService;

    //查看子图
    @RequestMapping("viewChildImages")
    public String viewChildImages(int id, ModelMap map){
     List<BrandImage> brandImageList=  brandImageService.viewChildImages(id);
        map.put("brandImageList",brandImageList)  ;
        return "brand/brandImage";
    }

}
