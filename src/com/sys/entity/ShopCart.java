package com.sys.entity;

import java.io.Serializable;

/**
 * 
 * ClassName: 购物车实体类 <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年3月29日 下午2:44:51 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public class ShopCart implements Serializable{
	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;
	private String shopcartid;
	private String comid;
	private Integer comcount;
	private String userid;
	private Commodity commodity;

	public ShopCart(String shopcartid, String comid, Integer comcount, String userid, Commodity commodity) {
		super();
		this.shopcartid = shopcartid;
		this.comid = comid;
		this.comcount = comcount;
		this.userid = userid;
		this.commodity = commodity;
	}

	public String getShopcartid() {
		return shopcartid;
	}

	public void setShopcartid(String shopcartid) {
		this.shopcartid = shopcartid;
	}

	public String getComid() {
		return comid;
	}

	public void setComid(String comid) {
		this.comid = comid;
	}

	public Integer getComcount() {
		return comcount;
	}

	public void setComcount(Integer comcount) {
		this.comcount = comcount;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	@Override
	public String toString() {
		return "ShopCart [shopcartid=" + shopcartid + ", comid=" + comid + ", comcount=" + comcount + ", userid="
				+ userid + ", commodity=" + commodity + "]";
	}

	public ShopCart() {
		super();
	}

}
