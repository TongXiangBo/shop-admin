package com.fh.shop.backend.vo;

import java.io.Serializable;

public class DatatableVo implements Serializable {
    private static final long serialVersionUID = 4528744761313167989L;

    private Integer draw;  //分页开始下标
    private Integer length;//分页每页条数
    private Integer start;  //分页开始下标

    @Override
    public String toString() {
        return "DatatableVo{" +
                "draw=" + draw +
                ", length=" + length +
                ", start=" + start +
                '}';
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }
}
