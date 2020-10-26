package com.bc.model.vo;

public class StuffVO {
	private String sort, name, price, image;

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "StuffVO [sort=" + sort + ", name=" + name + ", price=" + price + ", image=" + image + "]";
	}
	
	
}
