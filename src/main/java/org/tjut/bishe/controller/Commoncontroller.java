package org.tjut.bishe.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tjut.bishe.bean.UserBean;
import org.tjut.bishe.service.Commonservice;
import org.tjut.bishe.service.Userservice;

@Controller
public class Commoncontroller {
	@Resource
	Commonservice commonS;

	/**
	 * 利用ajax查询昵称是否已经被使用
	 * 
	 * @param nicheng
	 *            被查询的昵称
	 * @return 使用该昵称的用户
	 */
	@ResponseBody
	@RequestMapping("beforelogin_ishavenicheng.do")
	public UserBean beforelogin_ishavenicheng(String nicheng) {
		System.out.println(nicheng);
		UserBean user = new UserBean();
		user.setNicheng(nicheng);
		UserBean userF = commonS.beforelogin_ishavenichengS(user);
		return userF;
	}

	@RequestMapping("beforelogin_register.do")
	public String beforelogin_register(String nicheng, String email, String password) {
		UserBean user = new UserBean();
		user.setNicheng(nicheng);
		user.setPassword(password);
		user.setEmail(email);
		int i = commonS.beforelogin_registerS(user);
		return "login";
	}

	/**
	 * 查询用户所有的评论
	 * 
	 * @return 所有的评论
	 */
	@RequestMapping("selectalladvice_beforelogin.do")
	public String selectalladvice_beforelongin(HttpServletRequest req) {
		List li = commonS.selectalladvice();
		req.getSession().setAttribute("lia", li);
		return "adviceshow";
	}
}
