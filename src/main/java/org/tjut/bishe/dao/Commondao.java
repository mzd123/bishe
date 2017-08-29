package org.tjut.bishe.dao;

import org.tjut.bishe.bean.UserBean;

public interface Commondao {
	// 查询昵称是否被使用
	UserBean beforelogin_ishavenichengD(UserBean user);

	// 注册用户
	int beforelogin_registerD(UserBean user);
}
