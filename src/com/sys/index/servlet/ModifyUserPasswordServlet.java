package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sys.entity.User;
import com.sys.index.service.ModifyUserPasswordServiceImpl;
import com.sys.index.service.itf.IModifyUserPasswordService;


public class ModifyUserPasswordServlet extends HttpServlet {

	/**  
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).  
	 * @since JDK 1.8  
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置服务器端以UTF-8编码进行输出
		request.setCharacterEncoding("UTF-8");
		// 设置浏览器以UTF-8编码进行接收,解决中文乱码问题
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		//  获取保存正在页面的用户
		User user = (User) session.getAttribute("user");
		// 1  获取页面用户密码
		IModifyUserPasswordService modifyUserPwd = new ModifyUserPasswordServiceImpl();	
		if ("modifypwd".equals(action)) {
			String pwd = request.getParameter("newpassword");
			System.out.println(pwd);
			user.setPassword(pwd);
			boolean result = modifyUserPwd.updateUserPwd(user);
				if (result) {
					// 3-2-1 修改成功
					out.print("<script>alert(' 修改成功！');location='"+request.getContextPath()+"/person/password.jsp'</script>");
				} else {
					// 3-2-1 修改失败
					out.print("<script>alert(' 修改失败！');location='"+request.getContextPath()+"/person/password.jsp'</script>");
				}		
			}
	}

}
