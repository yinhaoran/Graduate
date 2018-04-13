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
		//�ж��ϴ����Ƿ�Ϊmultipart/form-data����
		if(ServletFileUpload.isMultipartContent(request))
		{
			try {
				//1. ����DiskFileItemFactory�������û�������С����ʱ�ļ�Ŀ¼
				DiskFileItemFactory factory = new DiskFileItemFactory();
				//2. ����ServletFileUpload���󣬲������ϴ��ļ��Ĵ�С���ơ�
				ServletFileUpload fileUpload = new ServletFileUpload(factory);
				fileUpload.setSizeMax(1024*1024*10);//���ֽ�Ϊ��λ  10M 1024byte = 1kb   1024kb = 1M
				fileUpload.setHeaderEncoding("utf-8");
				//3. ����ServletFileUpload.parseRequest��������request���󣬵õ�һ�������������ϴ����ݵ�List����
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				Iterator<FileItem> files = fileItems.iterator();
				//4. ����list��ÿ����һ��FileItem���󣬵�����isFormField�����ж��Ƿ����ϴ��ļ�
				while(files.hasNext())
				{
					FileItem fileItem = files.next();//�����������
					//true ��ͨ���� 
					if(fileItem.isFormField())
					{
						String name = fileItem.getFieldName();//name����ֵ
						String value = fileItem.getString("utf-8");//value����ֵ
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
					// false type="file"����
					else
					{
						String fileName = fileItem.getName();//Hydrangeas.jpg
						
						String suffix = fileName.substring(fileName.lastIndexOf("."));
						System.out.println("��չ����" + suffix);
						
						String newFileName = new Date().getTime() + suffix;
						System.out.println("���ļ����ƣ�" + newFileName);
						
						File file = new File(request.getSession().getServletContext().getRealPath("image")+"/"+newFileName);
						System.out.println("���ļ�����·����" + file.getAbsolutePath());
						/*
						 *	�������ݿ�·����  image\1469416442968.jpg
						 */
						
						//5. ����FileItem��write()������д���ļ�
						fileItem.write(file);
						
						//6. ����FileItem��delete()������ɾ����ʱ�ļ�
						fileItem.delete();
					}
				}
			}  catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
