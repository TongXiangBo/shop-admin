package com.fh.shop.backend.biz.log;

import com.fh.shop.backend.po.LogVO;
import com.fh.shop.backend.po.LoginInfo;

import java.util.List;

public interface ILogService {
    List<LoginInfo> findLogList(LoginInfo log);

    Long findTotalCount(LoginInfo log);

    void addLogMesseage(LogVO logVO);
}
