package com.fh.shop.backend.biz.member;

import com.auth0.jwt.internal.org.apache.commons.lang3.StringUtils;
import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.mapper.member.IMemberMapper;
import com.fh.shop.backend.po.Member;
import com.fh.shop.backend.util.DateUtil;
import com.fh.shop.backend.util.Global;
import com.fh.shop.backend.util.TengXunYun;
import com.fh.shop.backend.vo.MemberVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class MemberServiceImpl implements IMemberService {


    @Resource
    private IMemberMapper memberMapper;
    @Override
    public DatableResult findMemberList(Integer draw, Integer start, Integer length, Member member) {

        DatableResult data = getDatableResult(draw, member);
        return data;
    }

    @Override
    public ServerResponse findMemberInfo(Integer id) {


        Member memberPo = memberMapper.findMemberInfo(id);
        MemberVo memberVo = new MemberVo();
        memberVo.setId(memberPo.getId());
        memberVo.setUserName(memberPo.getUserName());
        memberVo.setBirthday(DateUtil.Date2String(memberPo.getBirthday(),DateUtil.YEAR_MONTH_DATE));

        memberVo.setEmail(memberPo.getEmail());
        memberVo.setPhone(memberPo.getPhone());
        memberVo.setAddress(memberPo.getAddress());
        memberVo.setAddressIds(memberPo.getAddressIds());
        memberVo.setHeadImage(memberPo.getHeadImage());
        return ServerResponse.success(memberVo);

    }

    @Override
    public ServerResponse updateMemberInfo(Member member) {


        if(!StringUtils.isEmpty(member.getNewHeadImage())){
            /*删除云端图片*/
            String headImage = member.getHeadImage();
            TengXunYun.deleteImage(headImage.replace(Global.COS_URL_PREFIX,""));


            /* 更新数据库图片路径*/
            member.setHeadImage(member.getNewHeadImage());

        }


        memberMapper.updateMemberInfo(member);
        return ServerResponse.success();
    }

    @Override
    public void addMemberInfo(Member member) {



        member.setRegTime(new Date());

        memberMapper.addMemberInfo( member);
    }


    public DatableResult getDatableResult(Integer draw,Member member) {
        //会员列表查询
        List<MemberVo> memberVoList = new ArrayList<>();
        List<Member> list= memberMapper.findMemberList(member);
        for (Member memberPo : list) {
            MemberVo memberVo = new MemberVo();
            memberVo.setId(memberPo.getId());
            memberVo.setUserName(memberPo.getUserName());
            memberVo.setBirthday(DateUtil.Date2String(memberPo.getBirthday(),DateUtil.YEAR_MONTH_DATE));

            memberVo.setEmail(memberPo.getEmail());
            memberVo.setRegTime(DateUtil.Date2String(memberPo.getRegTime(),DateUtil.YEAR_MONTH_DATE));
            memberVo.setPhone(memberPo.getPhone());
            memberVo.setAddress(memberPo.getAddress());
            memberVo.setHeadImage(memberPo.getHeadImage());
            memberVoList.add(memberVo);

        }


        //总条数查询
        Long totalCount=  memberMapper.findTotalCount(member);
        //datable 数据组装
        return DatableResult.build(draw, totalCount, totalCount, memberVoList);
    }
}
