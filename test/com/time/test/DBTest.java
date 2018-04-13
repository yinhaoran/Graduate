/**  
 * Project Name:TeamProject  
 * File Name:DBTest.java  
 * Package Name:com.time.test  
 * Date:2018年3月27日下午6:05:43  
 * Copyright (c) 2018, chenzhou1025@126.com All Rights Reserved.  
 *  
*/  
  
package com.time.test;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.junit.Test;

import com.sys.entity.Sort;
import com.sys.index.service.SortServiceImpl;
import com.sys.index.service.itf.SortService;

/**  
 * ClassName:DBTest <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason:   TODO ADD REASON. <br/>  
 * Date:     2018年3月27日 下午6:05:43 <br/>  
 * @author   yin  
 * @version    
 * @since    JDK 1.8  
 * @see        
 */
public class DBTest {
	@Test
	public void dbTest() {
		Connection con = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/webdb");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	public void testSortService() {
		SortService sortService = new SortServiceImpl();
		List<Sort> sort = sortService.findAllSort(new Sort());
	}
}
  
