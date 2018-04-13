package com.sys.entity;

import java.io.Serializable;


/**
 * 
 * ClassName: User <br/>  
 * Function: 用户实体 <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年4月5日 上午10:34:15 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public class User implements Serializable{

	private String userid;//用户主键
	private String password;//密码
	private String email;//邮箱
	private String realname;//真实名
	private String nickname;//昵称
	private String idnumber;//id号
	private String sex;//性别
	private String telephone;//电话
	private String birthday;//生日
	private String sign;//管理员标识

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public User(String userid, String password, String email, String realname, String nickname, String idnumber,
			String sex, String telephone, String birthday, String sign) {
		super();
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.realname = realname;
		this.nickname = nickname;
		this.idnumber = idnumber;
		this.sex = sex;
		this.telephone = telephone;
		this.birthday = birthday;
		this.sign = sign;
	}

	public User() {
		super();
	}

	public User(String email, String password) {
		super();
		this.password = password;
		this.email = email;
	}
}
