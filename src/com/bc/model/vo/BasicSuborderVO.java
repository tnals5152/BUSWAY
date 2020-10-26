package com.bc.model.vo;

public class BasicSuborderVO {
	
	private String  roasting, userid, store_code;
	private int idx, bread_size, basic_idx, cnt, one_total, b_idx, b_sale;
	 
	  
	private int quant; //장바구니 상품 수량
	private int totalprice; //수량별 금액(판매가 * 수량)
	private int salePrice;
	
	
	public int getPercent() {//세일가
		
		salePrice = one_total - (one_total * (b_sale / 100));
		return salePrice;
	};
	
	public BasicSuborderVO() {
		
	}
	
	public int getQuant() {
		return quant;
	}
	
	public void setQuent(int quant) {
		this.quant = quant;
		totalprice = salePrice * quant;
	}
	
	
	public int getTotalprice() {
		return totalprice;
	}
	
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	////////////////////////////////////////////////////////////////////////////////

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

	

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public int getB_sale() {
		return b_sale;
	}

	public void setB_sale(int b_sale) {
		this.b_sale = b_sale;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public void setQuant(int quant) {
		this.quant = quant;
	}

	@Override
	public String toString() {
		return "BasicSuborderVO [id=" + userid + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
