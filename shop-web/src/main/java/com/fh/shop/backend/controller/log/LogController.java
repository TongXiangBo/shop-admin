package com.fh.shop.backend.controller.log;

import com.fh.shop.backend.biz.log.ILogService;
import com.fh.shop.backend.po.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("log")
public class LogController {

    @Autowired
    private ILogService logService;


    //查询前跳转
    @RequestMapping("toFindLogList")
    public String toFindLogList() {
        return "log/logList";
    }


    //查询

    @RequestMapping("findLogList")
    @ResponseBody
    public Map findLogList(Integer draw, Integer start, Integer length, LoginInfo log) {
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");

        log.setStartPos(start);
        log.setPageSize(length);

        List<LoginInfo> list = logService.findLogList(log);
        Long totalCount = logService.findTotalCount(log);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setStartTimeStr(sim.format(list.get(i).getStartTime()));
            list.get(i).setEndTimeStr(sim.format(list.get(i).getEndTime()));
        }
        Map map = new HashMap<>();
        map.put("draw", draw);
        map.put("recordsFiltered", totalCount);
        map.put("recordsTotal", totalCount);
        map.put("data", list);

        return map;
    }

}
