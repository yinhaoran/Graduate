package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.OrderMange;
import com.sys.entity.User;
import com.sys.index.service.OrderServiceImpl;
import com.sys.index.service.itf.IOrderService;

public class OrderServlet extends HttpServlet {


	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		if("show".equals(action)){
			User user=(User) session.getAttribute("user");
			IOrderService orderService = new OrderServiceImpl();
			List<OrderMange> list = orderService.findDetail(user.getUserid());
			request.setAttribute("orderlist", list);
			request.getRequestDispatcher("/person/order.jsp").forward(request, response);
		}
		out.flush();
		out.close();
	}

}
