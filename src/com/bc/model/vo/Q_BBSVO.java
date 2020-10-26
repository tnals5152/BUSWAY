package com.bc.model.vo;

public class Q_BBSVO {
	private String q_idx, imgpath, title, content, regdate, userid;
	private int views;
	public Q_BBSVO() {	}
	public Q_BBSVO(String q_idx, String imgpath, String title, String content, String regdate, String userid,
			int views) {
		super();
		this.q_idx = q_idx;
		this.imgpath = imgpath;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.userid = userid;
		this.views = views;
	}
	public String getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "Q_BBSVO [q_idx=" + q_idx + ", imgpath=" + imgpath + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", userid=" + userid + ", views=" + views + "]";
	}
	
}
