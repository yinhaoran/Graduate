package com.sys.entity;

import java.io.Serializable;

/**
 * 
 * ClassName: Order <br/>
 * Function: TODO订单实体 <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018年4月5日 上午10:32:43 <br/>
 * 
 * @version
 * @since JDK 1.8
 */
public class Order implements Serializable {

	private String orderid;// 订单ID
	private String transtime;// 交易时间
	private String userid;// 用户id
	private String orderstatus;// 订单状态
	private String userwords;// 用户留言
	private String addressid;// 收货地址id
	private Float total;// 订单金额
	private OrderDetail orderDetail;

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Float getTotal() {
		return total;
	}

	public void setTotal(Float total) {
		this.total = total;
	}

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

	public String getUserwords() {
		return userwords;
	}

	public void setUserwords(String userwords) {
		this.userwords = userwords;
	}

	public String getAddressid() {
		return addressid;
	}

	public void setAddressid(String addressid) {
		this.addressid = addressid;
	}

	public Order() {
		super();
	}

	public Order(String transtime, String userid, String userwords, String addressid) {
		super();
		this.transtime = transtime;
		this.userid = userid;
		this.userwords = userwords;
		this.addressid = addressid;
	}

}
