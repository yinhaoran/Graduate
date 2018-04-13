package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sys.entity.Commodity;
import com.sys.index.service.CommodityListService;

public class CommodityBySortServlet extends HttpServlet {

	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 * 
	 * @since JDK 1.8
	 */
	private static final long serialVersionUID = 1L;
	CommodityListService commlistservice = new CommodityListService();

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset:utf-8");
		// PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if ("findcommBysort".equals(action)) {
			FindCommodityBySortId(request, response);
		}
	}

	public void FindCommodityBySortId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sortid = request.getParameter("sortid");
		List<Commodity> commoditylist = commlistservice.findCommodityBySortId(sortid);
		request.setAttribute("commoditylist", commoditylist);
		request.getRequestDispatcher("/home/FindCommodityBySort.jsp").forward(request, response);
	}
}
