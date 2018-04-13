package com.sys.index.service.itf;

import java.util.List;

import com.sys.entity.ShopCart;

public interface ShopcartServiceInt {

	public List<ShopCart> getShopCartByUserId(String userid);

	public int deleShopcartByuserid(String userid);

	public boolean deleShopcartByshopcartid(String shopcartid);

	public boolean addShopcart(ShopCart shopcart) throws Exception;

	public boolean updateShopcart(ShopCart shopcart) throws Exception;

	public ShopCart isExistCommodity(String userid, String comid);
}
