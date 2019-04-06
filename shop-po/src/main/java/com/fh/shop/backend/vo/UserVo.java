package com.fh.shop.backend.vo;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

public class UserVo implements Serializable {

    private static final long serialVersionUID = -6459534168812881392L;
    private  Integer  id;
    private  String   userName;
    private  Integer  loginStatus;
    private  String realName;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private  String   birthday;
    private  Float  salary;
    private  int   sex;
    private  String   deptName;


    @Override
    public String toString() {
        return "UserVo{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", loginStatus=" + loginStatus +
                ", realName='" + realName + '\'' +
                ", birthday='" + birthday + '\'' +
                ", salary=" + salary +
                ", sex=" + sex +
                ", deptName='" + deptName + '\'' +
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

    public Integer getLoginStatus() {
        return loginStatus;
    }

    public void setLoginStatus(Integer loginStatus) {
        this.loginStatus = loginStatus;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Float getSalary() {
        return salary;
    }

    public void setSalary(Float salary) {
        this.salary = salary;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }
}
