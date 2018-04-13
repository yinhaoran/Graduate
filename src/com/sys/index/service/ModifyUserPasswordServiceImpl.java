package com.sys.index.service;

import com.sys.dao.UserDao;
import com.sys.entity.User;
import com.sys.impl.UserImpl;
import com.sys.index.service.itf.IModifyUserPasswordService;

/**
 * 账户安全设置
 * 
 * @author lenovo
 * 
 */
public class ModifyUserPasswordServiceImpl implements IModifyUserPasswordService {
	UserDao userDao = new UserImpl();

	// 1. 修改用户密码
	public boolean updateUserPwd(User user) {
		int row = userDao.updateUser(user);
		if(row > 0) {
			return true;
		}
		return false;
	}

	// 7.查询用户信息
	public User getUserById(String userid) {
		return userDao.getUserById(userid);
	}
}
