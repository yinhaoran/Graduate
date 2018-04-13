package com.sys.dao;

import java.util.List;

import com.sys.entity.Order;
import com.sys.entity.OrderMange;

/**
 * 
 * ClassName: OrderDao <br/>
 * Function: 订单Dao <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018年3月28日 下午4:50:43 <br/>
 * 
 * @version
 * @since JDK 1.8
 */
public interface OrderDao {
	public String addOrder(Order order);

	public int updateOrder(Order order);

	public int deleteOrder(String orderid);

	public List<Order> findAllOrder(Order order);

	public List<Order> findAllOrder();

	public Order getOrderById(String orderid);

	public List<OrderMange> getDetailByUserID(String userid);
}
