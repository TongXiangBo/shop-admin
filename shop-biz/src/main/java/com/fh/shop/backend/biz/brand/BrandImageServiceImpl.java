package com.fh.shop.backend.biz.brand;

import com.fh.shop.backend.mapper.brand.IBrandImageMapper;
import com.fh.shop.backend.po.BrandImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrandImageServiceImpl implements IBrandImageService {
    @Autowired
    private IBrandImageMapper brandImageMapper;

    @Override
    public void addBrandImage(List<BrandImage> brandImageList) {
        brandImageMapper.addBrandImage(brandImageList);
    }

    @Override
    public List<BrandImage> viewChildImages(int id) {
        List<BrandImage> viewChildImages = brandImageMapper.viewChildImages(id);
        return viewChildImages;
    }


}
