package com.fh.shop.backend.controller.member;

import com.fh.shop.backend.biz.member.IMemberService;
import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private IMemberService memberService;


    //查询前跳转
    @RequestMapping("toFindMemberList")
    public  String  toFindUserList(){
        return "member/memberListBackend";
    }

       @RequestMapping("/findMemberList")
    @ResponseBody
    public ServerResponse  findMemberList(Integer draw, Integer start, Integer length,Member member){
        DatableResult data=   memberService.findMemberList(draw, start, length,member );


        return ServerResponse.success(data);
    }

    @RequestMapping("/toUpdateMember")
    @ResponseBody
    public ServerResponse  toUpdateMember(Integer id){
        ServerResponse serverResponse= memberService.findMemberInfo(id);
        return serverResponse;
    }



    @RequestMapping("/updateMemberInfo")
    @ResponseBody
    public ServerResponse  updateMemberInfo(Member member){
        ServerResponse serverResponse= memberService.updateMemberInfo(member);
        return ServerResponse.success();
    }

    @RequestMapping("/addMemberInfo")
    @ResponseBody
    public ServerResponse  addMemberInfo(Member member){
        memberService.addMemberInfo(member);
        return ServerResponse.success();
    }


}
