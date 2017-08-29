package org.tjut.bishe.bean;

public class UserBean {
	private String nicheng;
	private String email;
	private String password;
	private String qianming;

	public String getNicheng() {
		return nicheng;
	}

	public void setNicheng(String nicheng) {
		this.nicheng = nicheng;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQianming() {
		return qianming;
	}

	public void setQianming(String qianming) {
		this.qianming = qianming;
	}

	public UserBean(String nicheng, String email, String password, String qianming) {
		super();
		this.nicheng = nicheng;
		this.email = email;
		this.password = password;
		this.qianming = qianming;
	}

	public UserBean() {
		super();
	}

}
