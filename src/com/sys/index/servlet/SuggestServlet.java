package com.sys.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sys.entity.Commodity;
import com.sys.index.service.CommodityListService;

public class SuggestServlet extends HttpServlet {


	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		CommodityListService cls=new CommodityListService();
		
		//json是用get方法传输数据,,获取时应用post方法
		String comname=	new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
		
		
		//模糊查询商品提示
		List<Commodity> list=cls.commodity(comname);
		JSONArray array=new JSONArray();
		for (Commodity commodity : list) {
			JSONObject obj =new JSONObject();
			obj.put("id",commodity.getComid() );
			obj.put("comname", commodity.getComname());
			
			array.add(obj);
		}
		
		out.print(array.toString());
		out.flush();
		out.close();
	}

}
