package com.sys.index.service.itf;

import com.sys.entity.User;

/**
 * 账户安全设置
 * 
 * @author lenovo
 * 
 */
public interface IModifyUserPasswordService {
	// 1. 修改用户密码
	public boolean updateUserPwd(User user);
	// 2. 添加支付密码
	// 3. 手机验证
	// 4. 邮箱验证
	// 5. 实名认证
	// 6. 安全问题
	// 7.查询用户信息,作为修改验证
	public User getUserById(String userid);

}
