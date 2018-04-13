package com.sys.index.service;

import com.sys.dao.UserDao;
import com.sys.entity.User;
import com.sys.impl.UserImpl;

public class PersonService {
	/**
	 * 
	 * updateUser:(更改用户个人信息). <br/>  
	 *
	 * @param user
	 * @return  
	 * @since JDK 1.8
	 */
	public boolean updateUser(User user){
		UserDao userDao = new UserImpl();
		int row = userDao.updateUser(user);
		if(row>0) {
			return true;
		}
		return false;
	}
}
