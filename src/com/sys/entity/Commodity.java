package com.sys.entity;

import java.io.Serializable;

/**
 * 商品实体类 date: 2018年3月26日 下午9:39:15 <br/>
 * 
 * @version
 * @since JDK 1.8
 */
public class Commodity implements Serializable{
	private String comid;
	private String comname;
	private Float price;
	private Integer inventory;
	private String picture;
	private String describe;
	private String sortid;
	private String sortName;
	
	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getComid() {
		return comid;
	}

	public void setComid(String comid) {
		this.comid = comid;
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

	public Integer getInventory() {
		return inventory;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getSortid() {
		return sortid;
	}

	public void setSortid(String sortid) {
		this.sortid = sortid;
	}

	public Commodity() {
		super();
	}

	@Override
	public String toString() {
		return "Commodity [comid=" + comid + ", comname=" + comname + ", price=" + price + ", inventory=" + inventory
				+ ", picture=" + picture + ", describe=" + describe + ", sortid=" + sortid + "]";
	}

	public Commodity(String comid, String comname, Float price, Integer inventory, String picture, String describe,
			String sortid) {
		super();
		this.comid = comid;
		this.comname = comname;
		this.price = price;
		this.inventory = inventory;
		this.picture = picture;
		this.describe = describe;
		this.sortid = sortid;
	}

}
