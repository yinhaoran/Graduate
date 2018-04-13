package com.sys.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sys.entity.Order;
import com.sys.index.service.OrderServiceImpl;
import com.sys.index.service.itf.IOrderService;

public class ManageOrderServlet extends HttpServlet {
	/**
	 * 用户订单管理
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if ("findAllOrder".equals(action)) {// 1查询用户所有订单
			findAllOrder(request, response);
		} else if ("deleteOrder".equals(action)) {// 2删除用户订单
			deleteOrder(request, response);
		} else if ("getOrder".equals(action)) {// 3查询用户订单详情
			getOrderById(request, response);
		}
		out.flush();
		out.close();
	}

	// 1查询用户所有订单
	private void findAllOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		IOrderService iorder = new OrderServiceImpl();
		List<Order> oList = iorder.findAllOrder();
		request.setAttribute("oList", oList);
		request.getRequestDispatcher("/Manage/ManageOrder.jsp").forward(
				request, response);
	}

	// 2删除用户订单
	private void deleteOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String orderid = request.getParameter("orderid");
		IOrderService iorder = new OrderServiceImpl();
		boolean result = iorder.deleteOrder(orderid);
		out.print("<script type='text/javascript'>");
		if(result){
			out.print("alert('删除订单成功');");
		}else{
			out.print("alert('删除订单失败');");
		}
		out.print("</script>");
		request.getRequestDispatcher("/Manage/ManageOrder.jsp").forward(
				request, response);
	}

	// 3查询用户订单详情
	private void getOrderById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("orderid");
		IOrderService iorder = new OrderServiceImpl();
		Order order = iorder.getOrderById(orderid);
		request.setAttribute("order", order);
		request.getRequestDispatcher("/Manage/ManageOrderl.jsp").forward(
				request, response);
	}

}
