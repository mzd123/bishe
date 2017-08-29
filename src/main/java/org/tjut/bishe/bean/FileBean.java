package org.tjut.bishe.bean;

public class FileBean {
	private Integer fileid;
	private String filename;
	private String leixing;
	private String uploadtime;
	private String state;
	private String nicheng;
	// 下载次数
	private int downtimes;
	private String starttime;
	private String endtime;

	public int getDowntimes() {
		return downtimes;
	}

	public void setDowntimes(int downtimes) {
		this.downtimes = downtimes;
	}

	public Integer getFileid() {
		return fileid;
	}

	public void setFileid(Integer fileid) {
		this.fileid = fileid;
	}

	public String getNicheng() {
		return nicheng;
	}

	public void setNicheng(String nicheng) {
		this.nicheng = nicheng;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getLeixing() {
		return leixing;
	}

	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}

	public String getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(String uploadtime) {
		this.uploadtime = uploadtime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public FileBean(Integer fileid, String filename, String leixing, String uploadtime, String state, String nicheng,
			int downtimes) {
		super();
		this.fileid = fileid;
		this.filename = filename;
		this.leixing = leixing;
		this.uploadtime = uploadtime;
		this.state = state;
		this.nicheng = nicheng;
		this.downtimes = downtimes;
	}

	public FileBean() {
		super();
	}

	@Override
	public String toString() {
		return "FileBean [fileid=" + fileid + ", filename=" + filename + ", leixing=" + leixing + ", uploadtime="
				+ uploadtime + ", state=" + state + ", nicheng=" + nicheng + "]";
	}

}
