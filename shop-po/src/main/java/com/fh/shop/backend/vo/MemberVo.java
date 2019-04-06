package com.fh.shop.backend.vo;

import java.io.Serializable;

public class MemberVo  implements Serializable {
    private static final long serialVersionUID = 3990201502852001593L;



private  Integer   id ; //int(20) NOT NULL AUTO_INCREMENT,
private  String  userName ; //varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,

private  String  phone  ;//varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
private  String  email ; //varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,

private  String birthday  ;//date DEFAULT NULL,

private  String  regTime ; //datetime DEFAULT NULL,

private  String lastLoginTime ; //datetime DEFAULT NULL,


    private  String address;
    private  String   addressIds;
    private String    headImage;


    @Override
    public String toString() {
        return "MemberVo{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", birthday='" + birthday + '\'' +
                ", regTime='" + regTime + '\'' +
                ", lastLoginTime='" + lastLoginTime + '\'' +
                ", address='" + address + '\'' +
                ", addressIds='" + addressIds + '\'' +
                ", headImage='" + headImage + '\'' +
                '}';
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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getRegTime() {
        return regTime;
    }

    public void setRegTime(String regTime) {
        this.regTime = regTime;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
