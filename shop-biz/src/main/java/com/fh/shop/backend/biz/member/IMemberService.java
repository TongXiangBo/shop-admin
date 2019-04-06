package com.fh.shop.backend.biz.member;

import com.fh.shop.backend.common.DatableResult;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.Member;

public interface IMemberService {
    DatableResult findMemberList(Integer draw, Integer start, Integer length, Member member);


    ServerResponse findMemberInfo(Integer id);


    ServerResponse updateMemberInfo(Member member);

    void addMemberInfo(Member member);
}
