package com.sys.index.service.itf;

import java.util.List;

import com.sys.entity.Order;
import com.sys.entity.OrderMange;
import com.sys.entity.ShopCart;

/**
 * 用户订单表接口
 * 
 * @author lenovo
 * 
 */
public interface IOrderService {

	// 2删除用户订单
	public boolean deleteOrder(String orderid);

	// 3修改用户订单
	public int updateOrder(Order order);

	// 4查询用户订单详情
	public Order getOrderById(String orderid);

	// 5查询用户所有订单
	public List<Order> findAllOrder(Order order);

	public List<Order> findAllOrder();
	
	//6查询订单管理页面
	
	public List<OrderMange> findDetail(String userid);

	public Order insertOrder(Order order, List<ShopCart> list) throws Exception;

}
