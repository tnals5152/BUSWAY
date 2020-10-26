package com.bc.model.vo;

public class UsersVO {
	String userid, pwd, nickname, name, addr,
		phone, card, email, cnt, using;

	public UsersVO() {
		super();
	}

	
	public UsersVO(String id, String pwd, String nickname, String name, String addr, String phone, String card,
			String email) {
		super();
		this.userid = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.card = card;
		this.email = email;
	}
	
	public UsersVO(String id, String pwd, String nickname, String name, String addr, String phone, String card,
			String email, String ordercnt) {
		super();
		this.userid = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.card = card;
		this.email = email;
		this.cnt = ordercnt;
	}
	
	public UsersVO(String id, String pwd, String nickname, String name, String addr, String phone, String card,
			String email, String ordercnt, String using) {
		super();
		this.userid = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.card = card;
		this.email = email;
		this.cnt = ordercnt;
		this.using = using;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCnt() {
		return cnt;
	}

	public void setcnt(String cnt) {
		this.cnt = cnt;
	}
	
	
	
	public String getUsing() {
		return using;
	}


	public void setUsing(String using) {
		this.using = using;
	}


	@Override
	public String toString() {
		return "UsersVO [userid=" + userid + ", pwd=" + pwd + ", nickname=" + nickname + ", name=" + name + ", addr="
				+ addr + ", phone=" + phone + ", card=" + card + ", email=" + email + ", cnt=" + cnt
				+ ", using=" + using + "]";
	}


	

	
	
	
}
