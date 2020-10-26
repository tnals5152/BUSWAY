package com.bc.model.vo;

public class N_BBSVO {
	private String n_idx, title, regdate, content, views, imgpath, code;

	public N_BBSVO() {	}

	public N_BBSVO(String n_idx, String title, String regdate, String content, String views, String imgpath, String code) {
		super();
		this.n_idx = n_idx;
		this.title = title;
		this.regdate = regdate;
		this.content = content;
		this.views = views;
		this.imgpath = imgpath;
		this.code = code;
	}

	public String getN_idx() {
		return n_idx;
	}

	public void setN_idx(String n_idx) {
		this.n_idx = n_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "N_BBSVO [n_idx=" + n_idx + ", title=" + title + ", regdate=" + regdate + ", content=" + content + ", views="
				+ views + ", imgpath=" + imgpath + ", code=" + code + "]";
	}
	
	
}
