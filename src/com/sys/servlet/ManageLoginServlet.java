package com.sys.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.User;
import com.sys.index.service.UserService;

public class ManageLoginServlet extends HttpServlet {

	/**
	 * serialVersionUID:TODO(管理员登录控制器).
	 * 
	 * @since JDK 1.8
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 用户登录
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if ("login".equals(action)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			UserService loginService = new UserService();
			User user = null;
			try {
				user = loginService.validateLogin(username, password);
				if (user != null) {
					if ("1".equals(user.getSign())) {
						session.setAttribute("admin", user);
						out.print("<script>location='" + request.getContextPath()
								+ "/ManageUserServlet?action=list'</script>");
					} else {
						out.print("<script>alert('身份验证错误,此用户不是管理员');location='" + request.getContextPath()
								+ "/Manage/login.jsp'</script>");
					}
				} else {
					out.print("<script>alert('密码错误！');location='" + request.getContextPath()
							+ "/Manage/login.jsp'</script>");
				}
			} catch (Exception e) {
				out.print("<script>alert('" + e.getMessage() + "');location='" + request.getContextPath()
						+ "/Manage/login.jsp'</script>");
			}
		} else if ("logout".equals(action)) {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/Manage/login.jsp");
		}
		out.flush();
		out.close();
	}
}
