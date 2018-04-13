package com.sys.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sys.entity.User;
import com.sys.index.service.UserService;

public class ManageUserServlet extends HttpServlet {
	/**
	 * 用户管理
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if ("delete".equals(action)) {
			UserService us = new UserService();
			String userid = request.getParameter("userid");
			boolean flag = us.deleteUser(userid);
			if(flag == true) {
				out.print("<script>alert('删除用户成功')</script>");
			}else {
				out.print("<script>alert('删除用户失败')</script>");
			}
			request.getRequestDispatcher("ManageUserServlet?action=list").forward(request, response);
		} else if ("list".equals(action)) {
			UserService us = new UserService();
			List<User> list = us.findUser();
			request.setAttribute("userlist", list);
			request.getRequestDispatcher("/Manage/ManageUser.jsp").forward(request, response);
		} else if ("update".equals(action)) {
			String userid = request.getParameter("userid");
			UserService us = new UserService();
			User user = us.getUserById(userid);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/Manage/User_modify.jsp").forward(request, response);
		} else if ("doUpdate".equals(action)) {
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String realname = request.getParameter("realname");
			String email = request.getParameter("email");
			String sex = request.getParameter("sex");
			String telephone = request.getParameter("telephone");
			String birthday = request.getParameter("birthday");
			String status = request.getParameter("status");
			String idnumber = request.getParameter("idnumber");
			String sign = null;
			if ("普通会员".equals(status)) {
				sign = "0";
			} else {
				sign = "1";
			}
			UserService us = new UserService();
			User user = new User(userid, password, email, realname, username, idnumber, sex, telephone, birthday, sign);
			boolean flag = us.updateUser(user);
			if (flag) {
				out.print("<script>alert('用户信息修改成功')</script>");
				request.getRequestDispatcher("ManageUserServlet?action=list").forward(request, response);
			} else {
				out.print("<script>alert('用户信息修改失败')</script>");
			}
		}
	}

}
