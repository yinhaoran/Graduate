package com.sys.index.service;

import com.sys.dao.ShopCartDao;
import com.sys.impl.ShopCartImpl;

public class TipService {
	/**
	 * 	
	 * getShopCountByUserId:(根据用户id查找购物车的商品数量). <br/>  
	 *
	 * @param userid
	 * @return  
	 * @since JDK 1.8
	 */
	public int getShopCountByUserId(String userid){
		ShopCartDao cd = new ShopCartImpl();
		int count=cd.shopCartCount(userid);
		return count;
	}
}
