package com.bc.model.vo;

public class CartToppingVO {
	private int idx, cart_idx, quan; 
	private String name, orderdate;
	
	public CartToppingVO (){
		}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}

	public int getQuan() {
		return quan;
	}

	public void setQuan(int quan) {
		this.quan = quan;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		return "CartToppingVO [idx=" + idx + ", cart_idx=" + cart_idx + ", quan=" + quan + ", name=" + name
				+ ", orderdate=" + orderdate + "]";
	}
	
	
}
	
	
			
	
