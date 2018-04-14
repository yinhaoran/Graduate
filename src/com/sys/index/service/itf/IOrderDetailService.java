/**  
 * Project Name:TeamProject  
 * File Name:IOrderDetail.java  
 * Package Name:com.sys.index.service.itf  
 * Date:2018年4月14日下午3:30:40  
 * Copyright (c) 2018,  
 *  
*/  
  
package com.sys.index.service.itf;

import java.util.List;

import com.sys.entity.OrderDetail;

/**  
 * ClassName:IOrderDetail <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason:   TODO ADD REASON. <br/>  
 * Date:     2018年4月14日 下午3:30:40 <br/>  
 * @version    
 * @since    JDK 1.8  
 * @see        
 */
public interface IOrderDetailService {

	public List<OrderDetail> getOrderDetailList(String orderid);
}
  
