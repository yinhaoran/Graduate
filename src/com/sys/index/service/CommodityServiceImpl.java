package com.sys.index.service;

import java.util.List;

import com.sys.dao.CommodityDao;
import com.sys.entity.Commodity;
import com.sys.impl.CommodityImpl;
import com.sys.index.service.itf.CommodityService;

public class CommodityServiceImpl implements CommodityService {
	CommodityDao commoditydao = new CommodityImpl();
	
	Commodity commodity = new Commodity();
	public boolean AddCommodity(Commodity comm) {
		int row = commoditydao.addCommodity(comm);
		if(row > 0) {
			return true;
		}
		return false;
	}

	public List<Commodity> showCommdity() {
		List<Commodity> list = commoditydao.CommodityInformat();
		return list;
	}

	public boolean deleteCommodity(String comid) {
		int row = commoditydao.deleteCommodity(comid);
		if(row > 0) {
			return true;
		}else {
			return false;
		}
	}

	public boolean updateCommodity(Commodity commodity) {
		int row = commoditydao.updateCommodity(commodity);
		if(row > 0) {
			return true;
		}
		return false;
	}

	public Commodity findCommodityById(String comid) {
		Commodity comm = commoditydao.getCommodityById(comid);
		return comm;
	}
	
}
