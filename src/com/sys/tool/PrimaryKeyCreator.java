/**  
 * Project Name:TeamProject  
 * File Name:PrimaryKeyCreator.java  
 * Package Name:com.sys.tool  
 * Date:2018年3月29日下午5:21:31  
 * Copyright (c) 2018,  
 *  
*/

package com.sys.tool;

import java.util.UUID;

/**
 * ClassName:PrimaryKeyCreator <br/>
 * Function: 主键生成器 <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2018年3月29日 下午5:21:31 <br/>
 * 
 * @version
 * @since JDK 1.8
 * @see
 */
public class PrimaryKeyCreator {

	private static PrimaryKeyCreator keycreator;

	public static PrimaryKeyCreator getInstance() {
		if (keycreator == null) {
			keycreator = new PrimaryKeyCreator();
		}
		return keycreator;
	}

	public String getUUID() {
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		return str;
	}
}
