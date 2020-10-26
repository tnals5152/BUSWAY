package com.bc.model.vo;

public class OrderedToppingVO {
	String idx, suborder_idx, name, quan, orderdate;

	public OrderedToppingVO() {
		super();
	}

	public OrderedToppingVO(String idx, String suborder_idx, String name, String quan, String orderdate) {
		super();
		this.idx = idx;
		this.suborder_idx = suborder_idx;
		this.name = name;
		this.quan = quan;
		this.orderdate = orderdate;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getSuborder_idx() {
		return suborder_idx;
	}

	public void setSuborder_idx(String suborder_idx) {
		this.suborder_idx = suborder_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQuan() {
		return quan;
	}

	public void setQuan(String quan) {
		this.quan = quan;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		return "OrderedToppingVO [idx=" + idx + ", suborder_idx=" + suborder_idx + ", name=" + name + ", quan=" + quan
				+ ", orderdate=" + orderdate + "]";
	}
	
	
	
	
}
