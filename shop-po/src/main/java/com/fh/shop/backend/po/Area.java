package com.fh.shop.backend.po;

import java.io.Serializable;

public class Area  implements Serializable {
    private static final long serialVersionUID = 7189342877374534144L;

    private Integer id;
    private String  cityName;
    private  Integer  pid;


    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", cityName='" + cityName + '\'' +
                ", pid=" + pid +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}
