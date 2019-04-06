package com.fh.shop.backend.po;

import java.io.Serializable;
import java.util.Date;

public class LogVO implements Serializable {
    private static final long serialVersionUID = 3397132852552781891L;

    private  Integer  id;
    private  String   userName;
    private  String   info;
    private  Integer  status;
    private    Date createTime;
    private   Integer   useTime;
    private  String   content;

    @Override
    public String toString() {
        return "logVO{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", info='" + info + '\'' +
                ", status=" + status +
                ", createTime=" + createTime +
                ", useTime=" + useTime +
                ", content='" + content + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUseTime() {
        return useTime;
    }

    public void setUseTime(Integer useTime) {
        this.useTime = useTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
