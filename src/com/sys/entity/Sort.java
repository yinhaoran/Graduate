package com.sys.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * ClassName: Sort <br/>  
 * Function: 商品分类实体 <br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年4月5日 上午10:33:57 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public class Sort implements Serializable {
	private String sortid;
	private String sortname;
	private List<Commodity> commodityList;

	public List<Commodity> getCommodityList() {
		return commodityList;
	}
	public void setCommodityList(List<Commodity> commodityList) {
		this.commodityList = commodityList;
	}
	public String getSortid() {
		return sortid;
	}
	public void setSortid(String sortid) {
		this.sortid = sortid;
	}
	public String getSortname() {
		return sortname;
	}
	public void setSortname(String sortname) {
		this.sortname = sortname;
	}
	public Sort(String sortid, String sortname) {
		super();
		this.sortid = sortid;
		this.sortname = sortname;
	}
	public Sort() {
		super();
	}
	@Override
	public String toString() {
		return "Sort [sortid=" + sortid + ", sortname=" + sortname + "]";
	}
}
