package com.sys.dao;

import java.util.List;

import com.sys.entity.ShipAddress;

/**
 * 
 * ClassName: ShipAddressDao <br/>  
 * Function:收货地址Dao<br/>  
 * Reason: TODO ADD REASON(可选). <br/>  
 * date: 2018年3月28日 下午4:49:59 <br/>  
 *  
 * @version   
 * @since JDK 1.8
 */
public interface ShipAddressDao {
	/**
	 * 
	 * addShipAddress:(添加收货地址). <br/>  
	 *
	 * @param shipAddress
	 * @return  
	 * @since JDK 1.8
	 */
	public int addShipAddress(ShipAddress shipAddress);
	/**
	 * 
	 * updateShipAddress:(修改收货地址). <br/>  
	 *
	 * @param shipAddress
	 * @return  
	 * @since JDK 1.8
	 */
	public int updateShipAddress(ShipAddress shipAddress);
	/**
	 * 
	 * deleteShipAddress:(删除收货地址). <br/>  
	 *
	 * @param addressid
	 * @return  
	 * @since JDK 1.8
	 */
	public int deleteShipAddress(String addressid);
	/**
	 * 
	 * findAllShipAddress:(). <br/>  
	 *
	 * @param shipAddress
	 * @return  
	 * @since JDK 1.8
	 */
	public List<ShipAddress> findAllShipAddress(ShipAddress shipAddress);
	/**
	 * 根据收货地址主键获取收货地址
	 * getShipAddressById:(这里用一句话描述这个方法的作用). <br/>  
	 *
	 * @param addressid
	 * @return  
	 * @since JDK 1.8
	 */
	public ShipAddress getShipAddressById(String addressid);
}
