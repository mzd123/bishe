package org.tjut.bishe.dao;

import java.util.List;

import org.tjut.bishe.bean.AdviceBean;
import org.tjut.bishe.bean.FileBean;
import org.tjut.bishe.bean.FriendBean;
import org.tjut.bishe.bean.UserBean;

public interface Userdao {
	// 用户登入
	UserBean loginD(UserBean user);

	// 用户修改自己信息
	int modifymyselfD(UserBean user);

	// 根据条件查询自己上传的文件，查询历史记录的
	List searchuploadD(FileBean file);

	// 根据条件查询自己上传的文件,有开始时间和结束时间
	List searchuploadDhavestart_end_timeD(FileBean file);

	// 根据id删除文件
	int deletefilebyidD(Integer id);

	// 上传文件
	int uploadD(FileBean f);

	// 根据文件id查询文件所有信息
	FileBean searchfilebyidD(Integer id);

	// 增加下载次数
	int adddowntime(FileBean file);

	// 根据本人昵称查询好友
	List selectfriendsbynichengD(String nicheng);

	// 根据好友昵称查询好友所有分享的资料
	List selectfriendsharebynichengD(String nichengH);

	// 根据条件查询公开的资料
	List selectfilebysearchD(String search);

	// 根据我的昵称和好友的昵称--模糊--查询符合条件的好友的集合
	List selectfriendsbyfriendnichengD(FriendBean f);

	// 根据用户昵称查询用户基本信息
	UserBean selectuserallmessagebynichengD(String fnicheng);

	// 根据好友昵称查询好友分享资料的数目
	int selectcountsharebyfnichengD(String fnicheng);

	// 根据好友昵称删除我的好友
	int deletetmyfriendbynichengD(FriendBean f);

	// 增加我的好友
	int addmyfriendD(FriendBean f);

	// 根据昵称查询好友分享的
	List selectsharefilebyfriendnichengD(String fnicheng);

	// 根据昵称关键字模糊查询用户
	List selectuserbynichengD(String nicheng);

	// 增加评论
	int addadviceD(AdviceBean ad);

	// 查询所有评论
	List selectalladviceD();

}
