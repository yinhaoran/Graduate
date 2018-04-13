package com.sys.index.service;

import java.util.List;

import com.sys.dao.CommodityDao;
import com.sys.dao.ShopCartDao;
import com.sys.entity.ShopCart;
import com.sys.impl.CommodityImpl;
import com.sys.impl.ShopCartImpl;
import com.sys.index.service.itf.ShopcartServiceInt;

public class ShopcartServiceImpl implements ShopcartServiceInt {

	ShopCartDao shopcartdao = new ShopCartImpl();
	CommodityDao commDao = new CommodityImpl();
	public List<ShopCart> getShopCartByUserId(String userid) {
		ShopCart shopcart = new ShopCart();
		shopcart.setUserid(userid);
		List<ShopCart> list = shopcartdao.findAllShopCart(shopcart);
		return list;
	}

	public int deleShopcartByuserid(String userid) {
		int row = shopcartdao.deleteShopCartByUserid(userid);
		return row;
	}

	public boolean addShopcart(ShopCart shopcart) throws Exception {
		String comid = shopcart.getComid();
		int comCount = shopcart.getComcount();
		int inventory = commDao.getCommodityById(comid).getInventory();
		if(comCount > inventory) {
			throw new Exception("数量超出范围!");
		}
		int row = shopcartdao.addShopCart(shopcart);
		if(row > 0) {
			return true;
		}
		return false;
	}

	public boolean deleShopcartByshopcartid(String shopcartid) {
		int row = shopcartdao.deleteShopCart(shopcartid);
		if (row > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateShopcart(ShopCart shopcart) throws Exception {
		String comid = shopcart.getComid();
		int comCount = shopcart.getComcount();
		int inventory = commDao.getCommodityById(comid).getInventory();
		if(comCount > inventory) {
			throw new Exception("数量超出范围!");
		}
		int row = shopcartdao.updateShopCart(shopcart);
		if(row > 0) {
			return true;
		}
		return false;
	}

	public ShopCart isExistCommodity(String userid, String comid) {
		ShopCart shopcart = new ShopCart();
		shopcart.setComid(comid);
		shopcart.setUserid(userid);
		List<ShopCart> list = shopcartdao.findAllShopCart(shopcart);
		if (list.size() > 0) {
			ShopCart cartitem = list.get(0);
			return cartitem;
		} else {
			return null;
		}
	}
}
