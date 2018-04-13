package com.sys.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sys.entity.Commodity;
import com.sys.entity.Sort;
import com.sys.index.service.CommodityServiceImpl;
import com.sys.index.service.SortServiceImpl;
import com.sys.index.service.itf.CommodityService;
import com.sys.index.service.itf.SortService;
import com.sys.tool.UploadUtil;

/**
 * 
 * ClassName: ManageComServlet <br/>
 * date: 2018年4月1日 下午11:47:50 <br/>
 * 
 * @version
 * @since JDK 1.8
 */
public class ManageComServlet extends HttpServlet {
	/**
	 * serialVersionUID:
	 * 
	 * @since JDK 1.8
	 */
	private static final long serialVersionUID = 1L;

	public SortService getSortService() {
		return new SortServiceImpl();
	}

	public CommodityService getCommodityService() {
		return new CommodityServiceImpl();
	}

	/**
	 * Commodity Manage
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		if ("addCom".equals(action)) {
			AddCom(request, response);
		} else if ("Updatecom".equals(action)) {
			UpdateCom(request, response);
		} else if ("Deletecom".equals(action)) {
			DeleteCom(request, response);
		} else if ("Loadcom".equals(action)) {
			LoadCom(request, response);
		} else if ("doUpdate".equals(action)) {
			doUpdateCom(request, response);
		}
	}

	/**
	 * 
	 * AddCom:(添加商品控制器). <br/>
	 *
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @since JDK 1.8
	 */
	public void AddCom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				Commodity commodity = constructCommodity(request, response);
				boolean result = getCommodityService().AddCommodity(commodity);
				out.print("<script type='text/javascript'>");
				if (result) {
					out.print("alert('添加商品成功');location='" + request.getContextPath()
							+ "/ManageComServlet?action=Loadcom'");
				} else {
					out.print("alert('添加商品失败');location='" + request.getContextPath()
							+ "/ManageComServlet?action=Loadcom'");
				}
				out.print("</script>");
			} catch (Exception e) {
				out.print("alert('上传文件发生错误!');location='" + request.getContextPath()
						+ "/ManageComServlet?action=Loadcom'");
			}
		}
	}

	/**
	 * 
	 * DeleteCom:(删除商品). <br/>
	 *
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @since JDK 1.8
	 */
	public void DeleteCom(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String comid = request.getParameter("comid");
		boolean result = getCommodityService().deleteCommodity(comid);
		out.print("<script type='text/javascript'>");
		if (result) {
			out.print("alert('删除商品成功');location='" + request.getContextPath() + "/ManageComServlet?action=Loadcom'");
		} else {
			out.print("alert('删除商品失败');location='" + request.getContextPath() + "/ManageComServlet?action=Loadcom'");
		}
		out.print("</script>");
	}

	/**
	 * 
	 * UpdateCom:(修改商品). <br/>
	 *
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @since JDK 1.8
	 */
	public void UpdateCom(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String comid = request.getParameter("comid");
		Commodity comm = getCommodityService().findCommodityById(comid);
		List<Sort> list = getSortService().findAllSort(new Sort());
		request.setAttribute("sortlist", list);
		request.setAttribute("commodity", comm);
		request.getRequestDispatcher("/Manage/Commodity_modify.jsp").forward(request, response);
	}

	/**
	 * 
	 * doUpdateCom:(修改商品执行动作). <br/>
	 *
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @since JDK 1.8
	 */
	public void doUpdateCom(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Commodity commodity;
		try {
			commodity = constructCommodity(request, response);
			boolean result = getCommodityService().updateCommodity(commodity);
			out.print("<script type='text/javascript'>");
			if (result) {
				out.print("alert('修改商品信息成功');location='" + request.getContextPath()
						+ "/ManageComServlet?action=Loadcom'");
			} else {
				out.print("alert('修改商品信息失败');location='" + request.getContextPath()
						+ "/ManageComServlet?action=Loadcom'");
			}
			out.print("</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * LoadCom:(加载商品). <br/>
	 *
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @since JDK 1.8
	 */
	public void LoadCom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Commodity> list = getCommodityService().showCommdity();
		request.setAttribute("CommodityList", list);
		request.getRequestDispatcher("/Manage/ManageCom.jsp").forward(request, response);
	}

	/**
	 * 
	 * constructCommodity:(添加商品和修改商品时从页面获取的商品信息). <br/>
	 *
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * @since JDK 1.8
	 */
	public Commodity constructCommodity(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(factory);
		fileUpload.setSizeMax(1024 * 1024 * 10);
		fileUpload.setHeaderEncoding("utf-8");
		@SuppressWarnings("unchecked")
		List<FileItem> fileItems = fileUpload.parseRequest(request);
		Iterator<FileItem> files = fileItems.iterator();
		Commodity commodity = new Commodity();
		while (files.hasNext()) {
			FileItem fileItem = files.next();
			if (fileItem.isFormField()) {
				String name = fileItem.getFieldName();
				String value = fileItem.getString("utf-8");
				if ("comid".equals(name)) {
					commodity.setComid(value);
				} else if (name.equals("sorts")) {
					String sortid = value;
					commodity.setSortid(sortid);
				} else if (name.equals("comname")) {
					String comname = value;
					commodity.setComname(comname);
				} else if (name.equals("inventory")) {
					Integer inventory = Integer.parseInt(value);
					commodity.setInventory(inventory);
				} else if (name.equals("describe")) {
					String describe = value;
					commodity.setDescribe(describe);
				} else if (name.equals("price")) {
					Float price = Float.parseFloat(value);
					commodity.setPrice(price);
				}
			} else {
				String filePath = UploadUtil.getInstance().upload(fileItem);
				commodity.setPicture(filePath);
			}
		}
		return commodity;
	}
}
