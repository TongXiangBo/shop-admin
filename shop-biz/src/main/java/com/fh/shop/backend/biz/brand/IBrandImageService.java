package com.fh.shop.backend.biz.brand;

import com.fh.shop.backend.po.BrandImage;

import java.util.List;

public interface IBrandImageService {

    void addBrandImage(List<BrandImage> brandImage);

    List<BrandImage> viewChildImages(int id);

}
