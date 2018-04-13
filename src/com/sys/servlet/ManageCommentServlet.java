package com.sys.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sys.entity.Comment;
import com.sys.index.service.CommentService;

public class ManageCommentServlet extends HttpServlet {

	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
		if("list".equals(action)){
			CommentService cs=new CommentService();
			List<Comment> list=cs.findCommentList();
			request.setAttribute("commentlist", list);
			request.getRequestDispatcher("/Manage/ManageComment.jsp").forward(request, response);
		}else if("delete".equals(action)){
			String commentid=request.getParameter("commentid");
			CommentService cs=new CommentService();
			boolean flag = cs.deleteComment(commentid);
			if(flag){
				request.getRequestDispatcher("ManageCommentServlet?action=list").forward(request, response);
			}
		}
		out.flush();
		out.close();
	}

}
