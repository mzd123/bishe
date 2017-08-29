package org.tjut.bishe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.tjut.bishe.bean.FileBean;
import org.tjut.bishe.bean.UserBean;
import org.tjut.bishe.service.Userservice;

@Controller
public class Usercontroller {
	@Resource
	Userservice userS;

	/**
	 * 用户登入
	 * 
	 * @param nicheng
	 *            用户的昵称
	 * @param password
	 *            用户的密码
	 * @return 页面
	 */
	@RequestMapping("login.do")
	public String login(String nicheng, String password, HttpServletRequest req) {
		UserBean user = new UserBean();
		user.setNicheng(nicheng);
		user.setPassword(password);
		boolean isF = userS.loginS(user, req);
		if (isF) {
			return "logined/logined";
		}
		return "zhuce";
	}

	/**
	 * 修改自己信息
	 * 
	 * @param nicheng
	 *            昵称
	 * @param password
	 *            密码
	 * @param email
	 *            邮箱
	 * @param qianming
	 *            签名
	 * @param out
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("modifymyself.do")
	public void modifymyself(String nicheng, String password, String email, String qianming, PrintWriter out,
			HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserBean user = new UserBean(nicheng, email, password, qianming);
		boolean isF = userS.modifymyselfS(user);
		if (isF) {
			out.write("<script language=javascript>window.parent.location.href='login.jsp'</script>");
		} else {
			req.getRequestDispatcher("logined/personal.jsp").forward(req, resp);
		}
	}

	/**
	 * 搜索我上传的文件
	 * 
	 * @param xianshi
	 *            查询条件
	 * @param req
	 * @return 页面
	 */
	@RequestMapping("searchupload.do")
	public String searchupload(String xianshi, HttpServletRequest req) {
		// 等会删除成功后有用
		req.getSession().setAttribute("xianshi", xianshi);
		List li = userS.searchuploadS(xianshi, req);
		req.getSession().setAttribute("liM", li);
		return "logined/searchupload";
	}

	/**
	 * 根据id删除文件
	 * 
	 * @param id
	 *            要删除文件的id
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("deletefilebyid.do")
	public void deletefilebyid(Integer id, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		boolean isF = userS.deletefilebyidS(id, req);
		if (isF) {
			String str = (String) req.getSession().getAttribute("xianshi");
			req.getRequestDispatcher("searchupload.do?xianshi=" + str).forward(req, resp);
		} else {
			req.getRequestDispatcher("logined/searchupload.jsp").forward(req, resp);
		}
	}

	/**
	 * 文件下载
	 * 
	 * @param id
	 *            要下载的文件的id
	 * @throws IOException
	 */
	@RequestMapping("downfilebyid.do")
	public String downfilebyid(Integer id, HttpServletRequest req, HttpServletResponse resp, String op, String nicheng)
			throws IOException {
		FileBean file = userS.downfilebyidS(id, req, resp, op, nicheng);
		List li = new ArrayList();
		li.add(file);
		// 下载的是自己上传的文件
		if (op.equals("1")) {
			req.getSession().setAttribute("li", li);
			return "logined/searchupload";
		} else {
			// 下载的是公开资料和好友分享符合条件的资料op=2
			req.getSession().setAttribute("liS", li);
			if (op.equals("2")) {
				return "logined/searchdata";
			} else {
				// op=3,展示好友分享的资料
				return "logined/friendfileshow";
			}

		}
	}

	/**
	 * 文件上传
	 * 
	 * @param file
	 *            上传的文件
	 * @param filename
	 *            文件的名字
	 * @param leixing
	 *            文件的类型
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping("upload.do")
	public String upload(@RequestParam("file") MultipartFile file, String leixing, String state, HttpServletRequest req)
			throws IllegalStateException, IOException {
		boolean isF = userS.uploadS(file, leixing, req, state);
		if (isF) {
			return "logined/blank";
		} else {
			return "logined/upload";
		}
	}

	/**
	 * 根据条件所搜相关公开资料和好友分享符合条件的资料
	 * 
	 * @param search
	 *            查询的条件
	 * @param req
	 * @return 显式页面
	 */
	@RequestMapping("serachdata.do")
	public String serachdata(String search, HttpServletRequest req) {
		List li = userS.searchdataS(search, req);
		req.getSession().setAttribute("liS", li);
		return "logined/searchdata";
	}

	/**
	 * 根据昵称模糊查询好友
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @return 页面
	 */
	@RequestMapping("selectmyfriendbynicheng.do")
	public String selectmyfriendbynicheng(String op, String fnicheng, HttpServletRequest req) {
		List li = userS.selectfriendsbyfriendnichengS(fnicheng, req);
		req.getSession().setAttribute("li", li);
		if (op.equals("1")) {
			// 搜索的请求，返回搜索页面
			return "logined/myfriends";
		} else {
			UserBean userF = userS.selectuserallmessagebynichengS(fnicheng);
			req.getSession().setAttribute("userF", userF);
			// 查询好友分享资料的数目
			int i = userS.selectcountsharebyfnichengS(fnicheng);
			req.getSession().setAttribute("i", i);
			// 点击查看好友详细信息
			return "logined/friendspersonal";
		}
	}

	/**
	 * 根据昵称查询用户所有信息
	 * 
	 * @param nicheng
	 *            用户昵称
	 * @param req
	 * @return 页面
	 */
	@RequestMapping("selectuserallbynicheng.do")
	public String selectuserallbynicheng(String nicheng, HttpServletRequest req) {
		List li = userS.selectuserbynichengS(nicheng);
		req.getSession().setAttribute("li", li);
		UserBean userF = userS.selectuserallmessagebynichengS(nicheng);
		req.getSession().setAttribute("userF", userF);
		// 查询好友分享资料的数目
		int i = userS.selectcountsharebyfnichengS(nicheng);
		req.getSession().setAttribute("i", i);
		return "logined/user_add";
	}

	/**
	 * 模糊查询，昵称中由关键字的用户
	 * 
	 * @param nicheng
	 *            关键字
	 * @return 页面
	 */
	@RequestMapping("selectuserbynicheng.do")
	public String selectuserbynicheng(String nicheng, HttpServletRequest req) {
		List li = userS.selectuserbynichengS(nicheng);
		req.getSession().setAttribute("li", li);
		return "logined/addmyfriend";
	}

	/**
	 * 根据好友昵称删除好友
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @param req
	 * @return 页面
	 */
	@RequestMapping("deletetmyfriendbynicheng.do")
	public String deletetmyfriendbynicheng(String fnicheng, HttpServletRequest req) {
		List li = userS.deletetmyfriendbynichengS(fnicheng, req);
		req.getSession().setAttribute("li", li);
		return "logined/myfriends";
	}

	/**
	 * 增加我的好友
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @param req
	 * @return 页面
	 */
	@RequestMapping("addmyfriend.do")
	public String addmyfriend(String fnicheng, HttpServletRequest req) {
		List li = userS.addmyfriendS(fnicheng, req);
		req.getSession().setAttribute("li", li);
		return "logined/myfriends";
	}

	/**
	 * 根据好友昵称查询好友的分享资料
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @param req
	 * @return 页面
	 */
	@RequestMapping("selectsharefilebyfriendnicheng.do")
	public String selectsharefilebyfriendnicheng(String fnicheng, HttpServletRequest req) {
		List li = userS.selectsharefilebyfriendnichengS(fnicheng);
		req.getSession().setAttribute("liS", li);
		return "logined/friendfileshow";
	}

	/**
	 * 增加评论建议
	 * 
	 * @param advice
	 *            评论建议
	 * @param req
	 * @return 页面
	 */
	@RequestMapping("addadvice.do")
	public String addadvice(String advice, HttpServletRequest req) {
		List li = userS.addadviceS(advice, req);
		req.getSession().setAttribute("lia", li);
		return "logined/adviceshow";
	}
}
