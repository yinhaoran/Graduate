package com.sys.index.service;

import java.util.List;

import com.sys.dao.CommodityDao;
import com.sys.entity.Commodity;
import com.sys.impl.CommodityImpl;

public class CommodityListService {
	CommodityDao commoditydao = new CommodityImpl();
	
	public List<Commodity> findCommodityBySortId(String sortid){
		Commodity commodity = new Commodity();
		commodity.setSortid(sortid);
		List<Commodity> list = commoditydao.findAllCommodity(commodity);
		return list;
	}
	
	public List<Commodity> commodity(String comname){
		CommodityDao cd=new CommodityImpl();
		List<Commodity> list=cd.CommoditySuggest(comname);
		return list;
		
	}
}
