package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.User;
import com.sys.index.service.TipService;

public class TipServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		TipService ts=new TipService();
		//拿到session的userid,根据他的ID去查找他的购物车,再查出数量
		User user=(User) session.getAttribute("user");
		
		int count=ts.getShopCountByUserId(user.getUserid());
		
		out.print(count);
		out.flush();
		out.close();
	}

}
