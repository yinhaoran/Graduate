package com.sys.index.service;

import java.util.ArrayList;
import java.util.List;

import com.sys.dao.SortDao;
import com.sys.entity.Commodity;
import com.sys.entity.Sort;
import com.sys.impl.SortImpl;
import com.sys.index.service.itf.SortService;

public class SortServiceImpl implements SortService {
	SortDao sortdao = new SortImpl();

	public List<Sort> findAllSort(Sort sort) {
		List<Sort> list = sortdao.findAllSort(sort);
		List<Commodity> commList = null;
		for(Sort sort1 : list) {
			 commList = getCommService().findCommodityBySortId(sort1.getSortid());
			 sort1.setCommodityList(commList);
		}
		return list;
	}

	public boolean addSorts(Sort sort) {
		boolean flag = false;
		int row = sortdao.addSort(sort);
		if (row > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean deleteSorts(String sortid) {
		boolean flag = false;
		int row = sortdao.deleteSort(sortid);
		if (row > 0) {
			flag = true;
		}
		return flag;
	}

	public CommodityListService getCommService(){
		return new CommodityListService();
	}
}
