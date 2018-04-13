package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sys.entity.Commodity;
import com.sys.entity.Sort;
import com.sys.index.service.CommodityListService;
import com.sys.index.service.CommodityServiceImpl;
import com.sys.index.service.SortServiceImpl;
import com.sys.index.service.itf.CommodityService;
import com.sys.index.service.itf.SortService;

public class CommodityListServlet extends HttpServlet {

	
	SortService sortservice = new SortServiceImpl();
	CommodityService commodityservice = new CommodityServiceImpl();
	Sort sort = new Sort();
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset:utf-8");
		PrintWriter out = response.getWriter();
		List<Sort> sortsList = sortservice.findAllSort(sort);
		request.setAttribute("sortsList", sortsList);
		request.getRequestDispatcher("/home/home.jsp").forward(request, response);
	}
}
