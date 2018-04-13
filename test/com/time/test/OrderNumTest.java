/**  
 * Project Name:TeamProject  
 * File Name:OrderNumTest.java  
 * Package Name:com.time.test  
 * Date:2018年3月29日上午10:57:50  
 * Copyright (c) 2018,  
 *  
*/

package com.time.test;
/**  
 * ClassName:OrderNumTest <br/>  
 * Function: TODO ADD FUNCTION. <br/>  
 * Reason:   TODO ADD REASON. <br/>  
 * Date:     2018年3月29日 上午10:57:50 <br/>  
 * @version    
 * @since    JDK 1.8  
 * @see        
 */

import org.junit.Test;

import com.sys.tool.MakeOrderNum;
import com.sys.tool.PrimaryKeyCreator;

public class OrderNumTest {
	@Test
	public void orderNumTest() {
		MakeOrderNum m = new MakeOrderNum();
		String a = m.makeOrderNum();
		System.out.println(a);
	}
	
	@Test
	public void uuidTest() {
		int i = 0;
		while(i < 10) {
			String primarykey = PrimaryKeyCreator.getInstance().getUUID();
			System.out.println(primarykey);
			System.out.println(primarykey.length());
			i++;
		}
	}
}
