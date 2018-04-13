package com.sys.entity;

import java.io.Serializable;

/**
 * 
 * ClassName: OrderMange <br/>  
 * Function: 订单管理实体 <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年4月5日 上午10:33:18 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public class OrderMange implements Serializable {
	private String orderid; // 订单编号
	private String transtime; // 生成时间
	private String userid; // 用户id
	private String orderstatus; // 订单状态
	private String comid; // 商品ID
	private Integer comcount; // 商品数量
	private String comname; // 商品名字
	private Float price; // 商品价格
	private String picture; // 商品图片

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getTranstime() {
		return transtime;
	}

	public void setTranstime(String transtime) {
		this.transtime = transtime;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
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

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public OrderMange(String orderid, String transtime, String userid, String orderstatus, String comid,
			Integer comcount, String comname, Float price, String picture) {
		super();
		this.orderid = orderid;
		this.transtime = transtime;
		this.userid = userid;
		this.orderstatus = orderstatus;
		this.comid = comid;
		this.comcount = comcount;
		this.comname = comname;
		this.price = price;
		this.picture = picture;
	}

	public OrderMange() {
		super();
	}

	@Override
	public String toString() {
		return "OrderMange [orderid=" + orderid + ", transtime=" + transtime + ", userid=" + userid + ", orderstatus="
				+ orderstatus + ", comid=" + comid + ", comcount=" + comcount + ", comname=" + comname + ", price="
				+ price + ", picture=" + picture + "]";
	}
}
