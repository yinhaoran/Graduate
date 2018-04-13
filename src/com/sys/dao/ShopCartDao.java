package com.sys.dao;

import java.util.List;

import com.sys.entity.ShopCart;

/**
 * 
 * 
 * ClassName: ShopCartDao <br/>
 * Function: 购物车DAO <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018年3月28日 下午4:49:30 <br/>
 * 
 * @version
 * @since JDK 1.8
 */
public interface ShopCartDao {
	/**
	 * 
	 * addShopCart:(添加购物车). <br/>
	 *
	 * @param shopcart
	 * @return
	 * @since JDK 1.8
	 */
	public int addShopCart(ShopCart shopcart);

	/**
	 * 
	 * updateShopCart:(修改购物车). <br/>
	 *
	 * @param shopcart
	 * @return
	 * @since JDK 1.8
	 */
	public int updateShopCart(ShopCart shopcart);

	/**
	 * 
	 * deleteShopCart:(移出购物车). <br/>
	 *
	 * @param shopcartid
	 * @return
	 * @since JDK 1.8
	 */
	public int deleteShopCart(String shopcartid);

	public List<ShopCart> findAllShopCart(ShopCart shopcart);

	public ShopCart getShopCartById(String shopcartid);

	public int deleteShopCartByUserid(String userid);

	public int shopCartCount(String userid);
}
