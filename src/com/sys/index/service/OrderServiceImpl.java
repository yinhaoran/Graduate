package com.sys.index.service;

import java.util.List;

import com.sys.dao.CommodityDao;
import com.sys.dao.OrderDao;
import com.sys.dao.OrderDetailDao;
import com.sys.dao.ShopCartDao;
import com.sys.entity.Order;
import com.sys.entity.OrderDetail;
import com.sys.entity.OrderMange;
import com.sys.entity.ShopCart;
import com.sys.impl.CommodityImpl;
import com.sys.impl.OrderDetailImpl;
import com.sys.impl.OrderImpl;
import com.sys.impl.ShopCartImpl;
import com.sys.index.service.itf.IOrderService;

/**
 * 用户订单表实现类
 * 
 * @author lenovo
 * 
 */
public class OrderServiceImpl implements IOrderService {

	public OrderDao getOrderDao() {
		return new OrderImpl();
	}

	public CommodityDao getCommDao() {
		return new CommodityImpl();
	}

	public ShopCartDao getShopCartDao() {
		return new ShopCartImpl();
	}
	
	public OrderDetailDao getOrderDetailDao() {
		return new OrderDetailImpl();
	}

	public Order insertOrder(Order order, List<ShopCart> list) throws Exception {
		String orderid = getOrderDao().addOrder(order);
		float total = 0;
		for (ShopCart shopCart : list) {
			OrderDetail orderdetail = new OrderDetail();
			String comid = shopCart.getComid();
			int count = shopCart.getComcount();
			orderdetail.setComid(comid);
			orderdetail.setComcount(count);
			orderdetail.setOrderid(orderid);
			getOrderDetailDao().addOrderDetail(orderdetail);
			float price = getCommDao().getCommodityById(comid).getPrice();
			total += price * count;
		}
		order = getOrderById(orderid);
		order.setTotal(total);
		getOrderDao().updateOrder(order);
		String userid = order.getUserid();
		getShopCartDao().deleteShopCartByUserid(userid);
		return order;
	}

	public boolean deleteOrder(String orderid) {
		int row = getOrderDao().deleteOrder(orderid);
		if (row > 0) {
			return true;
		}
		return false;
	}

	// 3修改用户订单
	public int updateOrder(Order order) {
		return getOrderDao().updateOrder(order);
	}

	// 4查询用户订单详情
	public Order getOrderById(String orderid) {
		return getOrderDao().getOrderById(orderid);
	}

	// 5查询用户所有订单
	public List<Order> findAllOrder(Order order) {
		List<Order> oList = getOrderDao().findAllOrder(order);
		return oList;
	}

	public List<Order> findAllOrder() {
		List<Order> oList = getOrderDao().findAllOrder();
		return oList;
	}

	public List<OrderMange> findDetail(String userid) {
		List<OrderMange> list = getOrderDao().getDetailByUserID(userid);
		return list;
	}

}
