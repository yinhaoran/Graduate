package com.sys.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sys.entity.Sort;
import com.sys.index.service.SortServiceImpl;
import com.sys.index.service.itf.SortService;

public class ManageCategoreServlet extends HttpServlet {
	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;
	SortService sortservice = new SortServiceImpl();

	/**
	 * 分类管理
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String action = request.getParameter("action");
		if ("Addcom".equals(action)) {
			Addcom(request, response);
		} else if ("LoadCategore".equals(action)) {
			LoadCategore(request, response);
		} else if ("addCategory".equals(action)) {
			AddCategory(request, response);
		} else if ("DeleteCategory".equals(action)) {
			DeleteCategory(request, response);
		}
	}

	public void Addcom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Sort sort = new Sort();
		List<Sort> sortlist = sortservice.findAllSort(sort);
		request.setAttribute("sortlist", sortlist);
		request.getRequestDispatcher("/Manage/AddCom.jsp").forward(request, response);

	}

	public void LoadCategore(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Sort sort = new Sort();
		List<Sort> sortlist = sortservice.findAllSort(sort);
		request.setAttribute("sortlist", sortlist);
		request.getRequestDispatcher("/Manage/ManageCategore.jsp").forward(request, response);
	}

	public void AddCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String sortname = request.getParameter("comname");
		Sort sort = new Sort();
		sort.setSortname(sortname);
		boolean flag = sortservice.addSorts(sort);
		out.print("<script type='text/javascript'>");
		if (flag) {
			out.print("alert('添加成功！');location='" + request.getContextPath() + "/Manage/addCategory.jsp'");
		} else {
			out.print("alert('添加失败！');location='" + request.getContextPath() + "/Manage/addCategory.jsp'");
		}
		out.print("</script>");
	}

	public void DeleteCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String Categoreid = request.getParameter("sortid");
		boolean flag = sortservice.deleteSorts(Categoreid);
		out.print("<script type='text/javascript'>");
		if (flag) {
			out.print("alert('删除成功！');location='" + request.getContextPath()
					+ "/ManageCategoreServlet?action=LoadCategore'");
		} else {
			out.print("alert('删除失败！');location='" + request.getContextPath()
					+ "/ManageCategoreServlet?action=LoadCategore'");
		}
		out.print("</script>");
	}
}
