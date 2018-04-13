package com.sys.servlet;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//判断上传表单是否为multipart/form-data类型
		if(ServletFileUpload.isMultipartContent(request))
		{
			try {
				//1. 创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录
				DiskFileItemFactory factory = new DiskFileItemFactory();
				//2. 创建ServletFileUpload对象，并设置上传文件的大小限制。
				ServletFileUpload fileUpload = new ServletFileUpload(factory);
				fileUpload.setSizeMax(1024*1024*10);//以字节为单位  10M 1024byte = 1kb   1024kb = 1M
				fileUpload.setHeaderEncoding("utf-8");
				//3. 调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				Iterator<FileItem> files = fileItems.iterator();
				//4. 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件
				while(files.hasNext())
				{
					FileItem fileItem = files.next();//单个表单域对象
					//true 普通表单域 
					if(fileItem.isFormField())
					{
						String name = fileItem.getFieldName();//name属性值
						String value = fileItem.getString("utf-8");//value属性值
						if(name.equals("sorts")){
							Integer sortid = Integer.parseInt(value);
							
						}else if(name.equals("comname")){
							String comname = value;
							
						}else if(name.equals("inventory")){
							String inventory = value;
							
						}else if(name.equals("describe")){
							String describe = value;
							
						}
						System.out.println(name +" :" + value);
					}
					// false type="file"表单域
					else
					{
						String fileName = fileItem.getName();//Hydrangeas.jpg
						
						String suffix = fileName.substring(fileName.lastIndexOf("."));
						System.out.println("扩展名：" + suffix);
						
						String newFileName = new Date().getTime() + suffix;
						System.out.println("新文件名称：" + newFileName);
						
						File file = new File(request.getSession().getServletContext().getRealPath("image")+"/"+newFileName);
						System.out.println("新文件保存路径：" + file.getAbsolutePath());
						/*
						 *	保存数据库路径：  image\1469416442968.jpg
						 */
						
						//5. 调用FileItem的write()方法，写入文件
						fileItem.write(file);
						
						//6. 调用FileItem的delete()方法，删除临时文件
						fileItem.delete();
					}
				}
			}  catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
