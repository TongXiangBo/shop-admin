package com.fh.shop.backend.po;

import com.fh.shop.backend.vo.DatatableVo;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


public class User extends DatatableVo implements Serializable {
	private static final long serialVersionUID = -3456351749793046824L;
	private  Integer  id;
	private  String   userName;
	private  String   password;
	private  String    imageCode;
	private  String    salt;

	private   Date   loginTime;
	private  Integer   times;

	private  Date     errorLoginTime;
	private  Integer  loginStatus;
	private  Integer  errorTimes;


	private  String realName;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private  Date   birthday;
	private  Float  salary;
	private  int   sex;
	private  int   deptId;
	//批量删除
	private  String ids;
	//tree子级节点id集合
    private  Integer[] treeIds;

    private List<Integer> integerList;
	/*模糊查询*/

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private  Date  minBirthday;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private  Date  maxBirthday;

	private  Float  minSalary;
	private  Float  maxSalary;

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", userName='" + userName + '\'' +
				", password='" + password + '\'' +
				", imageCode='" + imageCode + '\'' +
				", salt='" + salt + '\'' +
				", loginTime=" + loginTime +
				", times=" + times +
				", errorLoginTime=" + errorLoginTime +
				", loginStatus=" + loginStatus +
				", errorTimes=" + errorTimes +
				", realName='" + realName + '\'' +
				", birthday=" + birthday +
				", salary=" + salary +
				", sex=" + sex +
				", deptId=" + deptId +
				", ids='" + ids + '\'' +
				", treeIds=" + Arrays.toString(treeIds) +
				", integerList=" + integerList +
				", minBirthday=" + minBirthday +
				", maxBirthday=" + maxBirthday +
				", minSalary=" + minSalary +
				", maxSalary=" + maxSalary +
				", dept=" + dept +
				", sessionBloon=" + sessionBloon +
				'}';
	}

	public List<Integer> getIntegerList() {
		return integerList;
	}

	public void setIntegerList(List<Integer> integerList) {
		this.integerList = integerList;
	}

	public Integer[] getTreeIds() {
        return treeIds;
    }

    public void setTreeIds(Integer[] treeIds) {
        this.treeIds = treeIds;
    }

    public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
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

	public Float getMinSalary() {
		return minSalary;
	}

	public void setMinSalary(Float minSalary) {
		this.minSalary = minSalary;
	}

	public Float getMaxSalary() {
		return maxSalary;
	}

	public void setMaxSalary(Float maxSalary) {
		this.maxSalary = maxSalary;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}


	private  Dept  dept=new Dept();

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
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

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	private  Integer   sessionBloon;

	public Integer getSessionBloon() {
		return sessionBloon;
	}

	public void setSessionBloon(Integer sessionBloon) {
		this.sessionBloon = sessionBloon;
	}

	public Date getErrorLoginTime() {
		return errorLoginTime;
	}

	public void setErrorLoginTime(Date errorLoginTime) {
		this.errorLoginTime = errorLoginTime;
	}

	public Integer getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(Integer loginStatus) {
		this.loginStatus = loginStatus;
	}

	public Integer getErrorTimes() {
		return errorTimes;
	}

	public void setErrorTimes(Integer errorTimes) {
		this.errorTimes = errorTimes;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public Integer getTimes() {
		return times;
	}

	public void setTimes(Integer times) {
		this.times = times;
	}

	public Date getLonginTime() {
		return loginTime;
	}

	public void setLonginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
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


}
