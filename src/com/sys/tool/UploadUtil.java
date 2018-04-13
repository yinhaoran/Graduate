/**  
 * Project Name:TeamProject  
 * File Name:UploadUtil.java  
 * Package Name:com.sys.tool  
 * Date:2018年4月1日下午10:14:52  
 * Copyright (c) 2018,  
 *  
*/

package com.sys.tool;

import java.io.File;
import java.util.Date;
import org.apache.commons.fileupload.FileItem;

/**
 * ClassName:UploadUtil <br/>
 * Function: 上传文件工具类 <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2018年4月1日 下午10:14:52 <br/>
 * 
 * @version
 * @since JDK 1.8
 * @see
 */
public class UploadUtil {
	
	private static UploadUtil uploadUtil;
	
	public String upload(FileItem fileItem) throws Exception {
		String newFilePath = null;
		try {
			String fileName = fileItem.getName();
			String suffix = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = new Date().getTime() + suffix;
			newFilePath = "/image/" + newFileName;
			File file = new File(IStaticData.FILEPATH + newFileName);
			fileItem.write(file);
			fileItem.delete();
		} catch (Exception e) {
			throw new Exception("上传文件错误");
		}
		return newFilePath;
	}
	
	public static UploadUtil getInstance() {
		if (uploadUtil == null) {
			uploadUtil = new UploadUtil();
		}
		return uploadUtil;
	}
}
