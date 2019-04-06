package com.fh.shop.backend.mapper.member;

import com.fh.shop.backend.po.Member;

import java.util.List;

public interface IMemberMapper {
    List<Member> findMemberList(Member member);

    Long findTotalCount(Member member);


    Member findMemberInfo(Integer id);

    void updateMemberInfo(Member member);

    void addMemberInfo(Member member);
}
