package com.bc.model.vo;

public class StoreVO {
	String code;
	String pwd;
	String name;
	String addr;
	String shop_number;
	String email;
	
	
	
	
	public StoreVO() {
		super();
	}




	public StoreVO(String code, String pwd, String name, String addr, String shop_number, String email) {
		super();
		this.code = code;
		this.pwd = pwd;
		this.name = name;
		this.addr = addr;
		this.shop_number = shop_number;
		this.email = email;
	}




	public String getCode() {
		return code;
	}




	public void setCode(String code) {
		this.code = code;
	}




	public String getPwd() {
		return pwd;
	}




	public void setPwd(String pwd) {
		this.pwd = pwd;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getAddr() {
		return addr;
	}




	public void setAddr(String addr) {
		this.addr = addr;
	}




	public String getShop_number() {
		return shop_number;
	}




	public void setShop_number(String shop_number) {
		this.shop_number = shop_number;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	@Override
	public String toString() {
		return "StoreVO [code=" + code + ", pwd=" + pwd + ", name=" + name + ", addr=" + addr + ", shop_number="
				+ shop_number + ", email=" + email + "]";
	}
	
	
	
	
	
}
