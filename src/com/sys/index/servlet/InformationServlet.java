package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.User;
import com.sys.index.service.PersonService;

public class InformationServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if ("show".equals(action)) {
			//User user = (User) session.getAttribute("user");
			request.getRequestDispatcher("/person/information.jsp").forward(request, response);
		} else if ("savePerson".equals(action)) {
			String birthday = request.getParameter("birthday");
			String email = request.getParameter("email");
			String realname = request.getParameter("realname");
			String nickname = request.getParameter("nickname");
			String sex = request.getParameter("radio10");
			String telephone = request.getParameter("telephone");
			User user = (User) session.getAttribute("user");
			user.setBirthday(birthday);
			user.setEmail(email);
			user.setRealname(realname);
			user.setNickname(nickname);
			user.setSex(sex);
			user.setTelephone(telephone);
			PersonService ps = new PersonService();
			boolean flag = ps.updateUser(user);
			if (flag) {
				out.print("<script>alert('修改成功'),window.location='InformationServlet?action=show';</script>");
			} else {
				out.print("<script>alert('修改失败')</script>");
			}
		}
		out.flush();
		out.close();
	}

}
