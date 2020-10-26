package com.bc.model.vo;

public class CommVO {
	private String c_idx, q_idx, store_code, content, c_regdate;

	public CommVO() {	}

	public CommVO(String c_idx, String q_idx, String store_code, String content, String c_regdate) {
		super();
		this.c_idx = c_idx;
		this.q_idx = q_idx;
		this.store_code = store_code;
		this.content = content;
		this.c_regdate = c_regdate;
	}

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getQ_idx() {
		return q_idx;
	}

	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}

	public String getStore_code() {
		return store_code;
	}

	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}

	@Override
	public String toString() {
		return "CommVO [c_idx=" + c_idx + ", q_idx=" + q_idx + ", store_code=" + store_code + ", content=" + content
				+ ", c_regdate=" + c_regdate + "]";
	}

	
	
}
