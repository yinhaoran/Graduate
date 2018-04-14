package com.sys.entity;

import java.io.Serializable;

/**
 * 
 * ClassName: ShipAddress <br/>  
 * Function: 收货地址实体 <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年4月5日 上午10:33:43 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public class ShipAddress implements Serializable{
	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;
	private String addressid;// 收货地址主键
	private String userid;// 用户主键
	private String receiverperson;// 收货人
	private String shiptelephone;// 联系电话
	private String location;// 城市
	private String detailAddress;// 详细地址
	private String sign;// 标识

	public ShipAddress() {
		super();
	}

	public ShipAddress(String userid, String receiverperson, String shiptelephone, String location,
			String detailAddress) {
		super();
		this.userid = userid;
		this.receiverperson = receiverperson;
		this.shiptelephone = shiptelephone;
		this.location = location;
		this.detailAddress = detailAddress;
	}

	public ShipAddress(String addressid, String userid, String receiverperson, String shiptelephone, String location,
			String detailAddress) {
		super();
		this.addressid = addressid;
		this.userid = userid;
		this.receiverperson = receiverperson;
		this.shiptelephone = shiptelephone;
		this.location = location;
		this.detailAddress = detailAddress;
	}

	public String getAddressid() {
		return addressid;
	}

	public void setAddressid(String addressid) {
		this.addressid = addressid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getReceiverperson() {
		return receiverperson;
	}

	public void setReceiverperson(String receiverperson) {
		this.receiverperson = receiverperson;
	}

	public String getShiptelephone() {
		return shiptelephone;
	}

	public void setShiptelephone(String shiptelephone) {
		this.shiptelephone = shiptelephone;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}
}
