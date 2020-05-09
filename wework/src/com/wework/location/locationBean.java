package com.wework.location;

public class locationBean {
	private int location_id;
	private String location_region;
	private String location_name;
	private String phone;
	private String postnum;
	private String newaddr;
	private String oldaddr;
	private String detail;
	private String worktime;
	private String holyday;
	private String location_exp;
	private String text;
	private String reg_date;
	
	public locationBean() {
		// TODO Auto-generated constructor stub
	}

	
	
	public locationBean(int location_id, String location_region, String location_name, String phone, String postnum,
			String newaddr, String oldaddr, String detail, String worktime, String holyday, String location_exp,
			String text, String reg_date) {
		super();
		this.location_id = location_id;
		this.location_region = location_region;
		this.location_name = location_name;
		this.phone = phone;
		this.postnum = postnum;
		this.newaddr = newaddr;
		this.oldaddr = oldaddr;
		this.detail = detail;
		this.worktime = worktime;
		this.holyday = holyday;
		this.location_exp = location_exp;
		this.text = text;
		this.reg_date = reg_date;
	}



	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public String getLocation_region() {
		return location_region;
	}
	public void setLocation_region(String location_region) {
		this.location_region = location_region;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPostnum() {
		return postnum;
	}


	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}


	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getNewaddr() {
		return newaddr;
	}
	public void setNewaddr(String newaddr) {
		this.newaddr = newaddr;
	}
	public String getOldaddr() {
		return oldaddr;
	}
	public void setOldaddr(String oldaddr) {
		this.oldaddr = oldaddr;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getWorktime() {
		return worktime;
	}
	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}
	public String getHolyday() {
		return holyday;
	}
	public void setHolyday(String holyday) {
		this.holyday = holyday;
	}
	public String getLocation_exp() {
		return location_exp;
	}
	public void setLocation_exp(String location_exp) {
		this.location_exp = location_exp;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "locationBean [location_id=" + location_id + ", location_region=" + location_region + ", location_name="
				+ location_name + ", phone=" + phone + ", postnum=" + postnum + ", newaddr=" + newaddr + ", oldaddr="
				+ oldaddr + ", detail=" + detail + ", worktime=" + worktime + ", holyday=" + holyday + ", location_exp="
				+ location_exp + ", text=" + text + ", reg_date=" + reg_date + "]";
	}
}
