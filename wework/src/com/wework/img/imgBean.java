package com.wework.img;

public class imgBean {
	private int img_id;
	private int location_id;
	private int place_id;
	private String img_src;
	
	public imgBean(int img_id, int location_id, int place_id, String img_src) {
		super();
		this.img_id = img_id;
		this.location_id = location_id;
		this.place_id = place_id;
		this.img_src = img_src;
	}
	public imgBean() {
		// TODO Auto-generated constructor stub
	}
	
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public int getPlace_id() {
		return place_id;
	}
	public void setPlace_id(int place_id) {
		this.place_id = place_id;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	@Override
	public String toString() {
		return "imgBean [img_id=" + img_id + ", location_id=" + location_id + ", place_id=" + place_id + ", img_src="
				+ img_src + "]";
	}
	
}
