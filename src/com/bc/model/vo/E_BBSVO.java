package com.bc.model.vo;

public class E_BBSVO {
	private String e_idx, title, start_date, end_date, content, views, imgpath, code;

	public E_BBSVO() {	}

	public E_BBSVO(String e_idx, String title, String start_date, String end_date, String content, String views,
			String imgpath, String code) {
		super();
		this.e_idx = e_idx;
		this.title = title;
		this.start_date = start_date;
		this.end_date = end_date;
		this.content = content;
		this.views = views;
		this.imgpath = imgpath;
		this.code = code;
	}

	public String getE_idx() {
		return e_idx;
	}

	public void setE_idx(String e_idx) {
		this.e_idx = e_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
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
		return "E_BBSVO [e_idx=" + e_idx + ", title=" + title + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", content=" + content + ", views=" + views + ", imgpath=" + imgpath + ", code=" + code + "]";
	}
	
	
	
}
