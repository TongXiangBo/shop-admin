package com.fh.shop.backend.po;


import com.fh.shop.backend.vo.DatatableVo;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Member extends DatatableVo implements Serializable {
    private static final long serialVersionUID = 3990201502852001593L;



private  Integer   id ; //int(20) NOT NULL AUTO_INCREMENT,
private  String  userName ; //varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
private  String  password ; //varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
private  String  phone  ;//varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
private  String  email ; //varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    @DateTimeFormat(pattern = "yyyy-MM-dd")
private  Date birthday  ;//date DEFAULT NULL,
    @DateTimeFormat(pattern = "yyyy-MM-dd")
private  Date  regTime ; //datetime DEFAULT NULL,
    @DateTimeFormat(pattern = "yyyy-MM-dd")
private  Date lastLoginTime ; //datetime DEFAULT NULL,
private  Integer  shengid ; //int(11) DEFAULT NULL,
private  Integer  shiid ; //int(11) DEFAULT NULL,
private  Integer  xianid  ;//int(11) DEFAULT NULL,
private  Integer  phoneCode  ;




    @DateTimeFormat(pattern = "yyyy-MM-dd")
   private  Date minBirthday  ;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private  Date maxBirthday  ;



    private  String   address;
    private  String   addressIds;

    private String    headImage;
    private String newHeadImage;

    @Override
    public String toString() {
        return "Member{}";
    }

    public String getNewHeadImage() {
        return newHeadImage;
    }

    public void setNewHeadImage(String newHeadImage) {
        this.newHeadImage = newHeadImage;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public String getAddressIds() {
        return addressIds;
    }

    public void setAddressIds(String addressIds) {
        this.addressIds = addressIds;
    }

    public Date getMinBirthday() {
        return minBirthday;
    }

    public void setMinBirthday(Date minBirthday) {
        this.minBirthday = minBirthday;
    }

    public Date getMaxBirthday() {
        return maxBirthday;
    }

    public void setMaxBirthday(Date maxBirthday) {
        this.maxBirthday = maxBirthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public Integer getPhoneCode() {
        return phoneCode;
    }

    public void setPhoneCode(Integer phoneCode) {
        this.phoneCode = phoneCode;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Integer getShengid() {
        return shengid;
    }

    public void setShengid(Integer shengid) {
        this.shengid = shengid;
    }

    public Integer getShiid() {
        return shiid;
    }

    public void setShiid(Integer shiid) {
        this.shiid = shiid;
    }

    public Integer getXianid() {
        return xianid;
    }

    public void setXianid(Integer xianid) {
        this.xianid = xianid;
    }
}
