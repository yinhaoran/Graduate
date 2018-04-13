package com.sys.index.service;

import java.util.List;

import com.sys.dao.UserDao;
import com.sys.entity.User;
import com.sys.impl.UserImpl;

public class UserService {

	public List<User> findUser() {
		List<User> list = getUserDao().findAllUser(new User());
		return list;
	}

	public boolean deleteUser(String userid) {
		int row = getUserDao().deleteUser(userid);
		if(row > 0) {
			return true;
		}
		return false;
	}

	public User getUserById(String userid) {
		User user = getUserDao().getUserById(userid);
		return user;
	}

	public boolean updateUser(User user) {
		int row = getUserDao().updateUser(user);
		if(row > 0) {
			return true;
		}
		return false;
	}
	
	public User validateLogin(String email, String password) throws Exception {
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		List<User> list = getUserDao().findAllUser(user);
		if (list.size() == 0 || list == null) {
			throw new Exception("用户不存在或密码错误");
		} else if (list.size() > 0 && !isManageLogin(list.get(0))) {
			throw new Exception("用户身份不是管理员");
		}
		return list.get(0);
	}

	public boolean isManageLogin(User user) {
		String sign = user.getSign();
		if ("0".equals(sign)) {
			return false;
		}
		return true;
	}
	
	public boolean addUser(User user) {
		int row = getUserDao().addUser(user);
		if(row > 0) {
			return true;
		}
		return false;
	}
	
	private UserDao getUserDao() {
		UserDao userDao = new UserImpl();
		return userDao;
	}
	
	public boolean checkEmail(String email) {
		User user = new User();
		user.setEmail(email);
		List<User> userList = getUserDao().findAllUser(user);
		if(userList != null && userList.size() > 0) {
			return false;
		}
		if(email.endsWith(".com")) {
			return true;
		}
		return false;
	}
}
