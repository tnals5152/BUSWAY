package com.bc.model.vo;

public class SuborderVO {
	String idx, bread_size, roasting, basic_idx, id,
		store_code, cnt, one_total, orderidx,
		all_total, p_img, menuname;

	public SuborderVO() {
		super();
	}

	

	



	public SuborderVO(String idx, String bread_size, String roasting, String basic_idx, String id, String store_code,
			String cnt, String one_total, String orderidx, String all_total, String p_img, String menuname) {
		super();
		this.idx = idx;
		this.bread_size = bread_size;
		this.roasting = roasting;
		this.basic_idx = basic_idx;
		this.id = id;
		this.store_code = store_code;
		this.cnt = cnt;
		this.one_total = one_total;
		this.orderidx = orderidx;
		this.all_total = all_total;
		this.p_img = p_img;
		this.menuname = menuname;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getOrderidx() {
		return orderidx;
	}

	public void setOrderidx(String orderidx) {
		this.orderidx = orderidx;
	}



	public String getAll_total() {
		return all_total;
	}



	public void setAll_total(String all_total) {
		this.all_total = all_total;
	}



	public String getP_img() {
		return p_img;
	}



	public void setP_img(String p_img) {
		this.p_img = p_img;
	}



	public String getMenuname() {
		return menuname;
	}







	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}







	@Override
	public String toString() {
		return "SuborderVO [idx=" + idx + ", bread_size=" + bread_size + ", roasting=" + roasting + ", basic_idx="
				+ basic_idx + ", id=" + id + ", store_code=" + store_code + ", cnt=" + cnt + ", one_total=" + one_total
				+ ", orderidx=" + orderidx + ", all_total=" + all_total + ", p_img=" + p_img + ", menuname=" + menuname
				+ "]";
	}







	
	
	
	
	
}
