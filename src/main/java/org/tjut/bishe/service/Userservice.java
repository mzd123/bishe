package org.tjut.bishe.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.tjut.bishe.bean.AdviceBean;
import org.tjut.bishe.bean.FileBean;
import org.tjut.bishe.bean.FriendBean;
import org.tjut.bishe.bean.UserBean;
import org.tjut.bishe.dao.Userdao;

@Service("userS")
public class Userservice {
	@Resource
	Userdao userD;

	/**
	 * 用户登入
	 * 
	 * @param nicheng
	 *            用户的昵称
	 * @param password
	 *            用户的密码
	 * @return 是否登入成功
	 */
	public boolean loginS(UserBean user, HttpServletRequest req) {
		UserBean userF = userD.loginD(user);
		if (userF != null && userF.getNicheng() != null && (!userF.getNicheng().equals(""))) {
			req.getSession().setAttribute("user", userF);
			req.getSession().setAttribute("src", "logined/blank.jsp");
			return true;
		}
		return false;
	}

	/**
	 * 取用户的昵称
	 * 
	 * @param req
	 * @return 用户的昵称
	 */
	public String GetusernichengbysessionS(HttpServletRequest req) {
		UserBean user = (UserBean) req.getSession().getAttribute("user");
		String nicheng = user.getNicheng();
		return nicheng;
	}

	/**
	 * 修改自己信息
	 * 
	 * @param user
	 *            要修改成的信息
	 * @return 修改是否成功
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public boolean modifymyselfS(UserBean user) {
		int i = userD.modifymyselfD(user);
		if (i > 0) {
			// 修改信息成功
			return true;
		} else {
			// 修改信息失败
			return false;
		}
	}

	/**
	 * 按条件查询我上传的文件
	 * 
	 * @param xianshi
	 *            查询的条件
	 * @return 查询结果集
	 */
	public List searchuploadS(String xianshi, HttpServletRequest req) {
		// 解析前台传过来的查询条件
		FileBean file = new FileBean();
		String time = null;
		List li = new ArrayList();
		// 从缓存中获取用户的信息
		String nicheng = GetusernichengbysessionS(req);
		file.setNicheng(nicheng);
		if (xianshi != null && (!xianshi.equals(""))) {
			String[] arr = xianshi.split(",");
			file.setLeixing(arr[0]);
			// 查询的时间
			time = arr[1];
			// 获取当前时间
			Date d = new Date();
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			String now = f.format(d);
			if (time.equals("今天")) {
				// 起始时间和终止时间都是今天
				file.setStarttime(now);
				file.setEndtime(now);
			} else if (time.equals("昨天")) {
				// 获取昨天的时间
				Date dz = new Date(new Date().getTime() - 24 * 60 * 60 * 1000);
				String yesterday = f.format(dz);
				// 起始时间和终止时间都是昨天
				file.setStarttime(yesterday);
				file.setEndtime(yesterday);
			} else if (time.equals("一周以内")) {
				// 获取一周之前的时间
				Date dw = new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000);
				String begin = f.format(dw);
				// 起始时间是一周之前
				file.setStarttime(begin);
				// 终止时间是今天
				file.setEndtime(now);
			} else if (time.equals("一月以内")) {
				// 获取一个月之前的日期
				Calendar c = Calendar.getInstance();
				c.setTime(new Date());
				c.add(Calendar.MONTH, -1);
				Date m = c.getTime();
				String mon = f.format(m);
				// 起始时间是一月之前
				file.setStarttime(mon);
				// 终止时间是今天
				file.setEndtime(now);
			}
			// 如果是，结尾，则数组就没有arr[2],为了防止空指针异常
			if (!xianshi.endsWith(",")) {
				file.setState(arr[2]);
			}
			if (time.equals("上传历史")) {
				li = userD.searchuploadD(file);
			} else {
				li = userD.searchuploadDhavestart_end_timeD(file);
			}
		} else {
			// 前台什么都没有输入
			li = userD.searchuploadD(file);
		}
		return li;
	}

	/**
	 * 删除文件
	 * 
	 * @param id
	 *            文件的id
	 * @param req
	 * @return 是否删除成功
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public boolean deletefilebyidS(Integer id, HttpServletRequest req) {
		// 删除电脑本地的文件
		// 删除文件是否成功的标识符
		boolean isF = false;
		// 从缓存中取出符合条件查询的文件集合
		List li = (List) req.getSession().getAttribute("li");
		for (int i = 0; i < li.size(); i++) {
			FileBean file = (FileBean) li.get(i);
			// 找到要删除的文件
			if (file.getFileid() == id) {
				String filename = file.getFilename();
				String fileleixng = file.getLeixing();
				String nicheng = GetusernichengbysessionS(req);
				// 获取文件路径
				String path = "F:/mytemp/bishe/" + nicheng + "/" + fileleixng + "/" + filename;
				File f = new File(path);
				// 是否删除成功
				isF = f.delete();
			}
		}
		// 删除数据库中的记录
		int i = userD.deletefilebyidD(id);
		// 数据库操作成功，并且本地也删除
		if (i > 0 && isF) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 上传文件
	 * 
	 * @param file
	 *            要上传的文件
	 * @param filename
	 *            文件的名字
	 * @param leixing
	 *            文件的类型
	 * @return 上传是否成功
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public boolean uploadS(MultipartFile file, String leixing, HttpServletRequest req, String state)
			throws IllegalStateException, IOException {
		String nicheng = GetusernichengbysessionS(req);
		String filename = file.getOriginalFilename();
		String path = "F:/mytemp/bishe/" + nicheng + "/" + leixing + "/" + filename;
		File fi = new File(path);
		if (!fi.exists()) {
			fi.mkdirs();
		}
		file.transferTo(new File(path));
		FileBean f = new FileBean();
		f.setFilename(filename);
		f.setLeixing(leixing);
		f.setNicheng(nicheng);
		f.setState(state);
		int i = userD.uploadD(f);
		if (i > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 根据id下载文件
	 * 
	 * @param id
	 *            要下载文件的id
	 * @return 下载成功后文件的该文件的状态
	 * @throws IOException
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public FileBean downfilebyidS(Integer id, HttpServletRequest req, HttpServletResponse resp, String op,
			String nicheng) {
		// 标识符，判断是否下载，排除点一下下载后没有真的下载，但是下载次数增加的bug
		boolean isF = false;
		String path = null;
		// =======================================下载文件=========================================
		FileBean file = searchfilebyidS(id);
		if (op.equals("1")) {
			String mynicheng = GetusernichengbysessionS(req);
			path = "F:/mytemp/bishe/" + mynicheng + "/" + file.getLeixing() + "/" + file.getFilename();
		} else {
			path = "F:/mytemp/bishe/" + nicheng + "/" + file.getLeixing() + "/" + file.getFilename();
		}
		System.out.println(path);
		try {
			FileInputStream in = new FileInputStream(path);
			// 定义下载的默认名字
			String name = path.substring(path.lastIndexOf("/") + 1);
			// 为了解决中文乱码和()乱码问题
			resp.setHeader("content-disposition", "attachment;filename="
					+ URLEncoder.encode(name, "UTF-8").replaceAll("%28", "(").replaceAll("%29", ")"));
			OutputStream out = resp.getOutputStream();
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
				isF = true;
			}
			// 关闭输出流
			out.close();
			// 关闭文件输入流
			in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// =======================================增加下载次数=========================================
		if (isF) {
			int i = file.getDowntimes();
			file.setDowntimes(i + 1);
			// 增加数据库中的下载次数
			int a = userD.adddowntime(file);
		}
		// 增加次数成功
		FileBean fileF = searchfilebyidS(id);
		return fileF;
	}

	/**
	 * 根据id查询文件所有信息
	 * 
	 * @param id
	 *            文件的id
	 * @return 文件对象
	 */
	public FileBean searchfilebyidS(Integer id) {
		FileBean file = userD.searchfilebyidD(id);
		return file;
	}

	/**
	 * 根据条件所搜相关公开资料和好友分享符合条件的资料
	 * 
	 * @param search
	 *            查询条件
	 * @return 符合条件的所有文件集合
	 */
	public List searchdataS(String search, HttpServletRequest req) {
		// 放查询公开资料和好友分享符合条件的资料
		List liZ = new ArrayList();
		// ===========================查询好友分享且符合条件的文件集合======================
		// =========查询好友，得到好友集合========
		String nicheng = GetusernichengbysessionS(req);
		List li = selectfriendsbymynichengS(nicheng);
		// 有好友
		if (li != null && li.size() > 0) {
			// 遍历好友
			for (int i = 0; i < li.size(); i++) {
				// 获得好友昵称
				FriendBean userH = (FriendBean) li.get(i);
				String nichengH = userH.getFnicheng();
				// ============根据好友昵称查询好友分享的资料=============
				List liH = selectfriendsharebynichengS(nichengH);
				// 好友有分享的
				if (liH != null && li.size() > 0) {
					// 遍历好友分享的资料
					for (int a = 0; a < liH.size(); a++) {
						FileBean file = (FileBean) liH.get(a);
						// 如果文件名字中包含有搜索的条件就放入liZ中
						if (search != null && (!search.equals(""))) {
							if (file.getFilename().indexOf(search) != -1) {
								liZ.add(file);
							} else {
								// 不符合就不放入liZ中
							}
						} else {
							// 没有搜索条件
							liZ.add(file);
						}
					}
				} else {
					// 好友没有分享的
				}
			}
		} else {
			// 没有好友
		}
		;
		// ============================查询符合条件的公开资料===========================
		List liG = userD.selectfilebysearchD(search);
		// 有公开符合条件的资料
		if (liG != null && liG.size() > 0) {
			for (int i = 0; i < liG.size(); i++) {
				liZ.add(liG.get(i));
			}
		} else {
			// 没有符合条件的公开资料
		}
		return liZ;
	}

	/**
	 * 根据好友昵称查询好友所有分享资料
	 * 
	 * @param nichengH
	 *            好友昵称
	 * @return 好友分享资料集合
	 */
	public List selectfriendsharebynichengS(String nichengH) {
		List li = userD.selectfriendsharebynichengD(nichengH);
		return li;
	}

	/**
	 * 根据本人昵称查询所有好友
	 * 
	 * @param nicheng
	 *            本人的昵称
	 * @return 好友集合
	 */
	public List selectfriendsbymynichengS(String nicheng) {
		List li = userD.selectfriendsbynichengD(nicheng);
		return li;
	}

	/**
	 * 根据好友昵称，模糊查询好友集合
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @return 符合条件的好友表的集合
	 */
	public List selectfriendsbyfriendnichengS(String fnicheng, HttpServletRequest req) {
		String mynicheng = GetusernichengbysessionS(req);
		FriendBean f = new FriendBean();
		f.setFnicheng(fnicheng);
		f.setNicheng(mynicheng);
		List li = userD.selectfriendsbyfriendnichengD(f);
		return li;
	}

	/**
	 * 根据用户昵称，查询用户基本信息
	 * 
	 * @param fnicheng
	 *            用户的昵称
	 * @return 用户对象
	 */
	public UserBean selectuserallmessagebynichengS(String fnicheng) {
		UserBean userF = userD.selectuserallmessagebynichengD(fnicheng);
		return userF;
	}

	/**
	 * 根据好友昵称查询好友分享资料的数目
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @return 数目
	 */
	public int selectcountsharebyfnichengS(String fnicheng) {
		int i = userD.selectcountsharebyfnichengD(fnicheng);
		return i;
	}

	/**
	 * 根据好友昵称删除好友，然后查询我的所有好友
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @param req
	 * @return 我的好友集合
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public List deletetmyfriendbynichengS(String fnicheng, HttpServletRequest req) {
		// 删除好友
		String mynicheng = GetusernichengbysessionS(req);
		FriendBean f = new FriendBean();
		f.setNicheng(mynicheng);
		f.setFnicheng(fnicheng);
		int i = userD.deletetmyfriendbynichengD(f);
		// 查询我的好友
		List li = selectfriendsbymynichengS(mynicheng);
		return li;
	}

	/**
	 * 增加我的好友，并查询我的所有好友
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @param req
	 * @return 我的所有好友集合
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public List addmyfriendS(String fnicheng, HttpServletRequest req) {
		String mynicheng = GetusernichengbysessionS(req);
		FriendBean f = new FriendBean();
		f.setFnicheng(fnicheng);
		f.setNicheng(mynicheng);
		int i = userD.addmyfriendD(f);
		// 查询我的所有好友
		// 查询我的好友
		List li = selectfriendsbymynichengS(mynicheng);
		return li;
	}

	/**
	 * 根据好友昵称查询好友分享的
	 * 
	 * @param fnicheng
	 *            好友昵称
	 * @return
	 */
	public List selectsharefilebyfriendnichengS(String fnicheng) {
		List li = userD.selectsharefilebyfriendnichengD(fnicheng);
		return li;
	}

	/**
	 * 模糊查询，昵称中由关键字的用户
	 * 
	 * @param nicheng
	 *            关键字
	 * @return 符合条件的用户集合
	 */
	public List selectuserbynichengS(String nicheng) {
		return userD.selectuserbynichengD(nicheng);
	}

	/**
	 * 增加评论建议
	 * 
	 * @param advice
	 *            评论建议
	 * @param req
	 * @return 所有评论
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	public List addadviceS(String advice, HttpServletRequest req) {
		// 获得自己的昵称
		String nicheng = GetusernichengbysessionS(req);
		AdviceBean ad = new AdviceBean();
		ad.setNicheng(nicheng);
		ad.setContent(advice);
		// 增加评论
		int i = userD.addadviceD(ad);
		// 查询所有评论
		List li = userD.selectalladviceD();
		return li;
	}

}
