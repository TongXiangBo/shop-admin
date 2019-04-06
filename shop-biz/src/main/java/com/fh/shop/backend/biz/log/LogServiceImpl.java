package com.fh.shop.backend.biz.log;

import com.fh.shop.backend.mapper.log.ILogMapper;
import com.fh.shop.backend.po.LogVO;
import com.fh.shop.backend.po.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements ILogService{
    @Autowired
    private ILogMapper logMapper;

    @Override
    public List<LoginInfo> findLogList(LoginInfo log) {


        List<LoginInfo> logList = logMapper.findLogList(log);
        return logList;
    }

    @Override
    public Long findTotalCount(LoginInfo log) {

        return logMapper.findTotalCount(log);
    }

    @Override
    public void addLogMesseage(LogVO logVO) {
        logMapper.addLogMesseage(logVO);
    }
}
