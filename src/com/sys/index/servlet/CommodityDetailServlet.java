package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.StringUtils;
import com.sys.entity.Comment;
import com.sys.entity.Commodity;
import com.sys.index.service.CommentService;
import com.sys.index.service.CommodityServiceImpl;
import com.sys.index.service.itf.CommodityService;

public class CommodityDetailServlet extends HttpServlet {

	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 * 
	 * @since JDK 1.8
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset:utf-8");
		String comid = request.getParameter("comid");
		CommodityService commodityservice = new CommodityServiceImpl();
		Commodity commdetail = commodityservice.findCommodityById(comid);
		CommentService commentservice = new CommentService();
		List<Comment> commentList = commentservice.getCommentByComId(comid);
		request.setAttribute("commentList", commentList);
		request.setAttribute("commdetail", commdetail);
		request.getRequestDispatcher("/home/CommodityDetail.jsp").forward(request, response);
	}
}
