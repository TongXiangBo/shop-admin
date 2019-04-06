package com.fh.shop.backend.mapper.brand;


import com.fh.shop.backend.po.Brand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class testBrand extends AbstractJUnit4SpringContextTests {
    @Autowired
    private IBrandMapper brandMapper;

    @Test
    public  void testFindAll(){
        List<Brand> brandSelect = brandMapper.findBrandSelect();
        System.out.println(brandSelect);


    }


}
