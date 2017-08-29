package org.tjut.bishe.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.tjut.bishe.bean.UserBean;
import org.tjut.bishe.dao.Commondao;
import org.tjut.bishe.dao.Userdao;

@Service("commonS")
public class Commonservice {
	@Resource
	Commondao commonD;
	@Resource
	Userdao userD;

	/**
	 * 查询昵称是否被使用
	 * 
	 * @param user
	 *            使用该昵称的用户
	 * @return 使用该昵称的用户
	 */
	public UserBean beforelogin_ishavenichengS(UserBean user) {
		UserBean userF = commonD.beforelogin_ishavenichengD(user);
		return userF;
	}

	/**
	 * 注册用户
	 * 
	 * @param user
	 *            用户
	 * @return 是否注册成功
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public int beforelogin_registerS(UserBean user) {
		int i = commonD.beforelogin_registerD(user);
		return i;
	}

	/**
	 * 查询用户所有的评论
	 * 
	 * @return 所有的评论
	 */
	public List selectalladvice() {
		List li = userD.selectalladviceD();
		return li;
	}

}
