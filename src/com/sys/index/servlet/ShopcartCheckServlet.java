package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.ShipAddress;
import com.sys.entity.ShopCart;
import com.sys.entity.User;
import com.sys.index.service.AddressService;
import com.sys.index.service.ShopcartServiceImpl;
import com.sys.index.service.itf.ShopcartServiceInt;

public class ShopcartCheckServlet extends HttpServlet {
	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 * 
	 * @since JDK 1.8
	 */
	private static final long serialVersionUID = 1L;
	ShopcartServiceInt shopcartservice = new ShopcartServiceImpl();

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset:utf-8");
		String action = request.getParameter("action");
		if ("checkout".equals(action)) {
			doCheckout(request, response);
		}
	}

	public void doCheckout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String userid = user.getUserid();
		AddressService addrservice = new AddressService();
		List<ShipAddress> addrlist = addrservice.getAddress(userid);
		request.setAttribute("addList", addrlist);
		List<ShopCart> shopcartlist = shopcartservice.getShopCartByUserId(userid);
		request.setAttribute("shopcartlist", shopcartlist);
		try {
			request.getRequestDispatcher("/home/pay.jsp").forward(request, response);
		} catch (Exception e) {
			out.print("<script type='text/javascript'>");
			out.print("alert('结算错误');");
			out.print("</script>");
		}
	}
}
