package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.User;

public class UserIndexServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset:utf-8");
		String action = request.getParameter("action");
		if("loadPerson".equals(action)){
			loadPerson(request, response);
		}
	}
	public void loadPerson(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		User user = (User) session.getAttribute("user");
		if(user != null){
			request.getRequestDispatcher("/person/index.jsp").forward(request, response);
		}else{
			out.print("<script type='text/javascript'>");
			out.print("alert('您还未登录,请登录');location='"+request.getContextPath()+"/home/login.jsp'");
			out.print("</script>");	
		}
	
	}
}
