package com.bc.model.vo;

public class CartVO_only {
	String idx, bread_size, roasting, basic_idx, userid, store_code, cnt, one_total;

	
	public CartVO_only() {
		
	}
	
	

	public CartVO_only(String idx, String bread_size, String roasting, String basic_idx, String userid,
			String store_code, String cnt, String one_total) {
		super();
		this.idx = idx;
		this.bread_size = bread_size;
		this.roasting = roasting;
		this.basic_idx = basic_idx;
		this.userid = userid;
		this.store_code = store_code;
		this.cnt = cnt;
		this.one_total = one_total;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getBread_size() {
		return bread_size;
	}

	public void setBread_size(String bread_size) {
		this.bread_size = bread_size;
	}

	public String getRoasting() {
		return roasting;
	}

	public void setRoasting(String roasting) {
		this.roasting = roasting;
	}

	public String getBasic_idx() {
		return basic_idx;
	}

	public void setBasic_idx(String basic_idx) {
		this.basic_idx = basic_idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getStore_code() {
		return store_code;
	}

	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getOne_total() {
		return one_total;
	}

	public void setOne_total(String one_total) {
		this.one_total = one_total;
	}
	@Override
	public String toString() {
		return "CartVO_only [idx=" + idx + ", bread_size=" + bread_size + ", roasting=" + roasting + ", basic_idx="
				+ basic_idx + ", userid=" + userid + ", store_code=" + store_code + ", cnt=" + cnt + ", one_total="
				+ one_total + "]";
	}
	
}
