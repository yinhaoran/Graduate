package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.ShopCart;
import com.sys.entity.User;
import com.sys.index.service.ShopcartServiceImpl;
import com.sys.index.service.itf.ShopcartServiceInt;

public class ShopcartServlet extends HttpServlet {

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
		if ("addShopCart".equals(action)) {
			addShopCart(request, response);
		} else if ("loadShopCart".equals(action)) {
			loadShopCart(request, response);
		} else if ("deleteByCartId".equals(action)) {
			deleteByCartId(request, response);
		}
	}

	public void addShopCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			String userid = user.getUserid();
			String comid = request.getParameter("comid");
			Integer comcount = Integer.parseInt(request.getParameter("count"));
			ShopCart shopcart = shopcartservice.isExistCommodity(userid, comid);
			String alertMessage = getMessage(shopcart, comcount, comid, userid);
			out.print("<script type='text/javascript'>");
			out.print("alert('" + alertMessage + "');location='CommodityDetailServlet?comid=" + comid + "'");
			out.print("</script>");
		} else {
			out.print("<script type='text/javascript'>");
			out.print("alert('您还未登录,请登录');location='" + request.getContextPath() + "/home/login.jsp'");
			out.print("</script>");
		}
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void loadShopCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			String userid = user.getUserid();
			List<ShopCart> shopcartlist = shopcartservice.getShopCartByUserId(userid);
			session.setAttribute("shopcartlist", shopcartlist);
			request.getRequestDispatcher("/home/shopcart.jsp").forward(request, response);
		} else {
			out.print("<script type='text/javascript'>");
			out.print("alert('您还未登录,请登录');location='" + request.getContextPath() + "/home/login.jsp'");
			out.print("</script>");
		}
	}

	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteByCartId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String shopcartid = request.getParameter("shopcartid");
		boolean result = shopcartservice.deleShopcartByshopcartid(shopcartid);
		out.print("<script type='text/javascript'>");
		if (result) {
			out.print("alert('删除成功');location='" + request.getContextPath() + "/ShopcartServlet?action=loadShopCart'");
		} else {
			out.print("alert('删除失败');location='" + request.getContextPath() + "/ShopcartServlet?action=loadShopCart'");
		}
		out.print("</script>");
	}
	
	public String getMessage(ShopCart shopcart,int comcount,String comid,String userid) {
		boolean result;
		String alertMessage;
		try {
			if (shopcart != null) {
				int orgcomcount = shopcart.getComcount();
				shopcart.setComcount(orgcomcount += comcount);
				result = shopcartservice.updateShopcart(shopcart);
			}else {
				shopcart = new ShopCart();
				shopcart.setComcount(comcount);
				shopcart.setComid(comid);
				shopcart.setUserid(userid);
				result = shopcartservice.addShopcart(shopcart);
			}
			if (result) {
				alertMessage = "添加购物车成功!";
			} else {
				alertMessage = "添加购物车失败!";
			}
		}catch(Exception e) {
			alertMessage = e.getMessage();
		}
		return alertMessage;
	}
}
