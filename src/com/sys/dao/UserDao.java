package com.sys.dao;

import java.util.List;

import com.sys.entity.User;

/**
 * 
 * ClassName: UserDao <br/>
 * Function: TODO 用户信息DAO <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2018年3月28日 下午4:48:53 <br/>
 * 
 * @version
 * @since JDK 1.8
 */
public interface UserDao {
	/**
	 * 
	 * addUser:(添加用户). <br/>
	 *
	 * @param user
	 * @return
	 * @since JDK 1.8
	 */
	public int addUser(User user);

	public int updateUser(User user);

	public int deleteUser(String userid);

	public List<User> findAllUser(User user);

	public User getUserById(String userid);
}
