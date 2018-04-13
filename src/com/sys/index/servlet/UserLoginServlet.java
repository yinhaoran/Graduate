package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.User;
import com.sys.index.service.UserService;

public class UserLoginServlet extends HttpServlet {

	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset:utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		UserService userService = new UserService();
		String action = request.getParameter("action");
		if ("login".equals(action)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			User user;
			try {
				user = userService.validateLogin(username, password);
				session.setAttribute("user", user);
				out.print("<script>location='" + request.getContextPath() + "/CommodityListServlet'</script>");
			} catch (Exception e) {
				out.print("<script>alert('用户名或密码错误！');location='" + request.getContextPath()
				+ "/home/login.jsp'</script>");
			}
		} else if ("logout".equals(action)) {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/CommodityListServlet");
		} else if ("register".equals(action)) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User user = new User();
			user.setEmail(email);
			user.setPassword(password);
			boolean flag = userService.addUser(user);
			if (flag) {
				out.print("<script>alert('注册成功！');location='" + request.getContextPath() + "/home/login.jsp'</script>");
			} else {
				out.print("<script>alert('注册失败！');location='" + request.getContextPath()
						+ "/home/register.jsp'</script>");
			}
		} else if ("checkEmail".equals(action)) {
			String email = request.getParameter("email");
			//semail = new String(email.getBytes("iso-8859-1"), "UTF-8");
			boolean result = userService.checkEmail(email);
			out.print(result);
		}
		out.flush();
		out.close();
	}
}
