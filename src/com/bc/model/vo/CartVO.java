package com.bc.model.vo;

public class CartVO {
	private String roasting, userid, store_code;
	private int bread_size, basic_idx, cnt, one_total;
	private String menuname, menusort, p_img, p_content;
	private int idx, sale, price15, price30;
	
	private int salePrice;
	private int sizePrice;
	
	public int getPercent15() {//세일가
		
		salePrice = price15 - (one_total * (sale / 100));
		return salePrice;
	};
	
	public int getPercent30() {
		salePrice = price30 - (one_total * (sale / 100));
		return salePrice;
		
	}
	
	
	
	
	public CartVO() {
		
	}


	public int salePricesetting() {
		one_total = one_total - (one_total * sale / 100);
		return one_total;
	}

	public String getRoasting() {
		return roasting;
	}

	public void setRoasting(String roasting) {
		this.roasting = roasting;
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



	public int getBread_size() {
		return bread_size;
	}

	public void setBread_size(int bread_size) {
		this.bread_size = bread_size;
	}

	public int getBasic_idx() {
		return basic_idx;
	}

	public void setBasic_idx(int basic_idx) {
		this.basic_idx = basic_idx;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getOne_total() {
		return one_total;
	}

	public void setOne_total(int one_total) {
		this.one_total = one_total;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public String getMenusort() {
		return menusort;
	}

	public void setMenusort(String menusort) {
		this.menusort = menusort;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public int getPrice15() {
		return price15;
	}

	public void setPrice15(int price15) {
		this.price15 = price15;
	}

	public int getPrice30() {
		return price30;
	}

	public void setPrice30(int price30) {
		this.price30 = price30;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	@Override
	public String toString() {
		return "CartVO [roasting=" + roasting + ", userid=" + userid + ", store_code=" + store_code
				+ ", bread_size=" + bread_size + ", basic_idx=" + basic_idx + ", cnt=" + cnt + ", one_total="
				+ one_total + ", menuname=" + menuname + ", menusort=" + menusort + ", p_img=" + p_img + ", p_content="
				+ p_content + ", idx=" + idx + ", sale=" + sale + ", price15=" + price15 + ", price30=" + price30
				+ ", salePrice=" + salePrice + "]";
	}
	
	
	
	
	
	
	
	
}
