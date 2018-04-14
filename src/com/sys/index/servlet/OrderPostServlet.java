package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.Order;
import com.sys.entity.ShipAddress;
import com.sys.entity.ShopCart;
import com.sys.entity.User;
import com.sys.index.service.AddressService;
import com.sys.index.service.OrderServiceImpl;
import com.sys.index.service.itf.IOrderService;

public class OrderPostServlet extends HttpServlet {

	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;
	public IOrderService getOrderService() {
		return new OrderServiceImpl();
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset:utf-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		AddressService as = new AddressService();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if ("orderPost".equals(action)) {
			orderPost(request, response);
		} else if ("changeAddress".equals(action)) {
			String addressid = request.getParameter("addressid");
			boolean isOK = as.updateSign(addressid);
			out.print(isOK);
		} else if ("deleteAddress".equals(action)) {
			String addressid = request.getParameter("addressid");
			boolean flag = as.deleteAddress(addressid);
			out.print(flag);
		} else if ("address".equals(action)) {
			StringBuffer location = new StringBuffer();
			String receiverperson = request.getParameter("receiverperson");
			String shiptelephone = request.getParameter("shiptelephone");
			location.append(request.getParameter("province") + " ");
			location.append(request.getParameter("city"));
			String detailAddress = request.getParameter("detailaddress");
			if (request.getParameter("addressid") != "") {
				String addressid = request.getParameter("addressid");
				boolean flag = as.updateAddress(new ShipAddress(addressid, user.getUserid(), receiverperson,
						shiptelephone, location.toString(), detailAddress));
				if (flag) {
					out.print("<script>alert('修改地址成功！');location='" + request.getContextPath()
							+ "/ShopcartCheckServlet?action=checkout'</script>");
				} else {
					out.print("<script>alert('修改地址失败！');location='" + request.getContextPath()
							+ "/ShopcartCheckServlet?action=checkout'</script>");
				}
			} else {
				boolean flag = as.addAddress(new ShipAddress(user.getUserid(), receiverperson, shiptelephone,
						location.toString(), detailAddress));
				if (flag) {
					out.print("<script>alert('添加地址成功！');location='" + request.getContextPath()
							+ "/ShopcartCheckServlet?action=checkout'</script>");
				} else {
					out.print("<script>alert('添加地址失败！');location='" + request.getContextPath()
							+ "/ShopcartCheckServlet?action=checkout'</script>");
				}
			}
		}
	}
	public void orderPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String userid = user.getUserid();
		String addressid = getAddressService().getDefAddrByUserid(userid).getAddressid();
		String transtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		@SuppressWarnings("unchecked")
		List<ShopCart> list = (List<ShopCart>) session.getAttribute("shopcartlist");
		String userwords = request.getParameter("userwords");
		Order order = new Order(transtime, userid, userwords, addressid);
		try {
			order = getOrderService().insertOrder(order, list);
		} catch (Exception e) {
			out.print("<script type='text/javascript'>");
			out.print("alert('"+e.getMessage()+"');location='" + request.getContextPath() + "/ShopcartCheckServlet?action=checkout'");
			out.print("</script>");
		}
		request.setAttribute("order", order);
		AddressService addressService = new AddressService();
		ShipAddress shipAddress = addressService.findAddress(addressid);
		request.setAttribute("address", shipAddress);
		request.getRequestDispatcher("/home/success.jsp").forward(request, response);
	}
	
	public AddressService getAddressService() {
		return new AddressService();
	}
}
