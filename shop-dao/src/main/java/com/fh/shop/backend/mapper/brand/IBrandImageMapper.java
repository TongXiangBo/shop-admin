package com.fh.shop.backend.mapper.brand;

import com.fh.shop.backend.po.BrandImage;

import java.util.List;

public interface IBrandImageMapper {
    void addBrandImage(List<BrandImage> brandImage);

    List<BrandImage> viewChildImages(int id);

    void deleteBrandImage(List<Integer> idsList);

}
