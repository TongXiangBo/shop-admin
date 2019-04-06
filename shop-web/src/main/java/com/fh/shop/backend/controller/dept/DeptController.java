package com.fh.shop.backend.controller.dept;

import com.fh.shop.backend.biz.dept.IDeptService;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.Dept;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("dept")
public class DeptController {

    @Resource
    private IDeptService deptService;

/*
@RequestMapping("findZTreeDept")
@ResponseBody
   public ServerResponse findZTreeDept(){

     //  List<Map<String,Object>> mapList=new ArrayList<Map<String,Object>>();

       List<Dept> list = deptService.findZTreeDept();

       return ServerResponse.success(list);
   }
*/



    @RequestMapping("findZTreeDept")
    @ResponseBody
    public   ServerResponse findZTreeDept(){

       /* List<Map<String,Object>> mapList=new ArrayList<Map<String,Object>>();

        List<Dept> list = deptService.findZTreeDept();
        for (int i = 0; i < list.size(); i++) {
            Map<String,Object> map=new HashMap<>();
            map.put("id", list.get(i).getId());
            map.put("pId",list.get(i).getPid());
            map.put("name", list.get(i).getDeptName());
            mapList.add(map);

        }*/

        List<Dept> list = deptService.findZTreeDept();

        return ServerResponse.success(list);
    }

    @RequestMapping("addDeptInfo")
    @ResponseBody
    public ServerResponse addDeptInfo(Dept dept){
        deptService. addDeptInfo( dept);
        return ServerResponse.success(dept.getId());
    }


    @RequestMapping("batchDeleteDept")
    @ResponseBody
    public ServerResponse batchDeleteDept(String ids){
        deptService.batchDelete(ids);

        return ServerResponse.success();
    }

    @RequestMapping("updateDeptInfo")
    @ResponseBody
    public ServerResponse updateDeptInfo(Dept dept){
        deptService.updateDeptInfo(dept);


        return ServerResponse.success();
    }



}
