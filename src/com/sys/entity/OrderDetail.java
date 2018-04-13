package com.sys.entity;

import java.io.Serializable;


/**
 * 
 * ClassName: OrderDetail <br/>  
 * Function: 订单明细实体 <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年4月5日 上午10:33:00 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public class OrderDetail implements Serializable{
	private String detailid;
	private String orderid;
	private String comid;
	private Integer comcount;

	public OrderDetail() {
		super();
	}

	public OrderDetail(String detailid, String orderid, String comid, Integer comcount) {
		super();
		this.detailid = detailid;
		this.orderid = orderid;
		this.comid = comid;
		this.comcount = comcount;
	}

	public String getDetailid() {
		return detailid;
	}

	public void setDetailid(String detailid) {
		this.detailid = detailid;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
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
}
