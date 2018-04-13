package com.sys.index.service.itf;

import java.util.List;

import com.sys.entity.Commodity;

public interface CommodityService {
	public boolean AddCommodity(Commodity comm);

	public List<Commodity> showCommdity();

	public boolean deleteCommodity(String comid);

	public boolean updateCommodity(Commodity commodity);

	public Commodity findCommodityById(String comid);
}
