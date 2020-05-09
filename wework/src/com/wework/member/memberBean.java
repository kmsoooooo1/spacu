package com.wework.member;

public class memberBean {
	private int member_id;
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String gender;
	private String phone;
	private String email;
	private int point;
	private int level;
	private String reg_date;
	private boolean emailcheck;
	
	
	
	public memberBean() {
		// TODO Auto-generated constructor stub
	}
	public memberBean(int member_id, String id, String pw, String name, String birth, String gender, String phone,
			String email, int point, int level, String reg_date, boolean emailcheck) {
		this.member_id = member_id;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.point = point;
		this.level = level;
		this.reg_date = reg_date;
		this.emailcheck = emailcheck;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public boolean isEmailcheck() {
		return emailcheck;
	}
	public void setEmailcheck(boolean emailcheck) {
		this.emailcheck = emailcheck;
	}
	@Override
	public String toString() {
		return "memberBean [member_id=" + member_id + ", id=" + id + ", pw=" + pw + ", name=" + name + ", birth="
				+ birth + ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", point=" + point
				+ ", level=" + level + ", reg_date=" + reg_date + ", emailcheck=" + emailcheck + "]";
	}
}
