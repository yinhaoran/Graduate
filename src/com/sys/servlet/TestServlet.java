/**  
 * Project Name:TeamProject  
 * File Name:TestServlet.java  
 * Package Name:com.sys.servlet  
 * Date:2018年4月1日下午2:10:02  
 * Copyright (c) 2018,  
 *  
*/  
  
package com.sys.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sys.entity.Sort;
import com.sys.index.service.SortServiceImpl;
import com.sys.index.service.itf.SortService;

/**  
 * ClassName:TestServlet <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason:   TODO ADD REASON. <br/>  
 * Date:     2018年4月1日 下午2:10:02 <br/>  
 * @version    
 * @since    JDK 1.8  
 * @see        
 */
public class TestServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SortService sortsService = new SortServiceImpl();
		sortsService.findAllSort(new Sort());
	}
	
}
  
