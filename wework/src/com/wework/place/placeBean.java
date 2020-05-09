package com.wework.place;

public class placeBean {
	private int place_id;
	private int location_id;
	private String place_name;
	private String place_type;
	private int minhour;
	private int perhour;
	private int maxsize;
	private String reg_date;
	
	public placeBean() {
		// TODO Auto-generated constructor stub
	}
	public placeBean(int place_id, int location_id, String place_name, String place_type, int minhour, int perhour,
			int maxsize, String reg_date) {
		super();
		this.place_id = place_id;
		this.location_id = location_id;
		this.place_name = place_name;
		this.place_type = place_type;
		this.minhour = minhour;
		this.perhour = perhour;
		this.maxsize = maxsize;
		this.reg_date = reg_date;
	}



	public int getPlace_id() {
		return place_id;
	}
	public void setPlace_id(int place_id) {
		this.place_id = place_id;
	}
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public String getPlace_type() {
		return place_type;
	}
	public void setPlace_type(String place_type) {
		this.place_type = place_type;
	}
	public int getPerhour() {
		return perhour;
	}
	public void setPerhour(int perhour) {
		this.perhour = perhour;
	}
	public int getMaxsize() {
		return maxsize;
	}
	public void setMaxsize(int maxsize) {
		this.maxsize = maxsize;
	}

	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public int getMinhour() {
		return minhour;
	}
	public void setMinhour(int minhour) {
		this.minhour = minhour;
	}


	@Override
	public String toString() {
		return "placeBean [place_id=" + place_id + ", location_id=" + location_id + ", place_name=" + place_name
				+ ", place_type=" + place_type + ", minhour=" + minhour + ", perhour=" + perhour + ", maxsize="
				+ maxsize + ", reg_date=" + reg_date + "]";
	}

	
}
