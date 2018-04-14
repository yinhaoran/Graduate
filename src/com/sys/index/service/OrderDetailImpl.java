/**  
 * Project Name:TeamProject  
 * File Name:OrderDetailImpl.java  
 * Package Name:com.sys.index.service  
 * Date:2018年4月14日下午3:32:18  
 * Copyright (c) 2018,  
 *  
*/

package com.sys.index.service;

import java.util.List;

import com.sys.dao.OrderDetailDao;
import com.sys.entity.OrderDetail;
import com.sys.index.service.itf.IOrderDetailService;

/**
 * ClassName:OrderDetailImpl <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2018年4月14日 下午3:32:18 <br/>
 * 
 * @version
 * @since JDK 1.8
 * @see
 */
public class OrderDetailImpl implements IOrderDetailService {

	private OrderDetailDao detailDao;

	public OrderDetailDao getDetailDao() {
		if(detailDao == null) {
			return (OrderDetailDao) new com.sys.impl.OrderDetailImpl();
		}
		return detailDao;
	}

	public List<OrderDetail> getOrderDetailList(String orderid) {
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setOrderid(orderid);
		List<OrderDetail> list = getDetailDao().findAllOrderDetail(orderDetail);
		return list;
	}

}
