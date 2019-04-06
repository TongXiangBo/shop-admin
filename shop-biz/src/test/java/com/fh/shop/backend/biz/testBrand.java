package com.fh.shop.backend.biz;

import com.fh.shop.backend.biz.brand.IBrandService;
import com.fh.shop.backend.po.Brand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-common.xml"})
public class testBrand extends AbstractJUnit4SpringContextTests {
    @Autowired
    private IBrandService brandService;

    @Test
    public void testFindAll(){

        List<Brand> brandSelect = brandService.findBrandSelect();
        System.out.println(brandSelect);

    }


}
