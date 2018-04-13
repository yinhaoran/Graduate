package com.sys.dao;

import java.util.List;

import com.sys.entity.OrderDetail;

/**
 * 
 * ClassName: OrderDetailDao <br/>
 * Function: 订单明细Dao <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018年3月28日 下午4:50:22 <br/>
 * 
 * @version
 * @since JDK 1.8
 */
public interface OrderDetailDao {
	public int addOrderDetail(OrderDetail orderdetail) throws Exception;

	public int updateOrderDetail(OrderDetail orderdetail);

	public int deleteOrderDetail(String detailid);

	public List<OrderDetail> findAllOrderDetail(OrderDetail orderdetail);

	public OrderDetail getOrderDetailById(String detailid);
}
