package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.Comment;
import com.sys.entity.Commodity;
import com.sys.entity.User;
import com.sys.index.service.CommodityServiceImpl;
import com.sys.index.service.PersonCommentImpl;
import com.sys.index.service.itf.CommodityService;
import com.sys.index.service.itf.PersonCommentInt;

public class PersonCommentServlet extends HttpServlet {

	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 * 
	 * @since JDK 1.8
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset:utf-8");
		String action = request.getParameter("action");
		if ("loadCommentByperson".equals(action)) {
			loadCommentByperson(request, response);
		} else if ("addComment".equals(action)) {
			addComment(request, response);
		} else if ("doAddComment".equals(action)) {
			doAddComment(request, response);
		}
	}

	public void loadCommentByperson(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = "";
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		userid = user.getUserid();
		PersonCommentInt commentservice = new PersonCommentImpl();
		List<Comment> commentlist = commentservice.findCommentListByUser(userid);
		request.setAttribute("commentlist", commentlist);
		request.getRequestDispatcher("/person/comment.jsp").forward(request, response);
	}

	public void addComment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String comid = request.getParameter("comid");
		CommodityService commodityService = new CommodityServiceImpl();
		Commodity commodity = commodityService.findCommodityById(comid);
		request.setAttribute("commodity", commodity);
		request.getRequestDispatcher("/person/commentlist.jsp").forward(request, response);
	}

	public void doAddComment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String userid = user.getUserid();
		//String username = user.getNickname();
		String content = request.getParameter("content");
		String comid = request.getParameter("comid");
		CommodityService commodityService = new CommodityServiceImpl();
		Commodity comm = commodityService.findCommodityById(comid);
		request.setAttribute("commodity", comm);
		Comment comment = new Comment(content,userid, comid,user.getNickname());
		PersonCommentInt commentservice = new PersonCommentImpl();
		int result = commentservice.SubmitComment(comment);
		out.print("<script type='text/javascript'>");
		if (result > 0) {
			out.print("alert('评论成功！');location='" + request.getContextPath() + "/person/commentlist.jsp'");
		} else {
			out.print("alert('评论失败！');location='" + request.getContextPath() + "/person/commentlist.jsp'");
		}
		out.print("</script>");
	}
}
