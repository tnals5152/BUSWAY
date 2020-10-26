package com.bc.model.vo;

public class ShopVO {
	//DB에 있는 데이터
	private String idx, menuname, menusort, p_img, p_content;
	private int sale, price15, price30;
	
	//수량, 수량별 금액(판매가 * 수량)
	private int quant; //장바구니에 담긴 수량
	private int totalprice; //수량별 금액(판매가 * 수량)
	
	//할인율 조회 메소드
	public int getPercent() {
		double percent = (price15 - sale) * 100 / price15;
		return (int) percent;
	}
	
	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public String getMenusort() {
		return menusort;
	}

	public void setMenusort(String menusort) {
		this.menusort = menusort;
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

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public void setQuant(int quant) {
		this.quant = quant;
	}

	public int getQuant() {
		return quant;
	}

	@Override
	public String toString() {
		return "ShopVO [idx=" + idx + ", menuname=" + menuname + ", sale=" + sale + ", menusort=" + menusort
				+ ", price15=" + price15 + ", price30=" + price30 + ", p_img=" + p_img + ", p_content=" + p_content
				+ ", quant=" + quant + ", totalprice=" + totalprice + "]";
	}
	
//	public void setQuant(int quant) {
//		this.quant = quant;
//		//수량이 변경되면 수량별금액(totalprice) 계산후 변경처리
//		totalprice = p_saleprice * quant;
//	}


}
