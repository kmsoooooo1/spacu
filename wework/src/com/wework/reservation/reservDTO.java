package com.wework.reservation;

import java.util.Date;
import java.sql.Time;

public class reservDTO {
	private int reserv_id;
	private int member_id;
	private int place_id;
	private String date;
	private String starttime;
	private int people;
	private int usetime;
	private int cost;
	private String comment;
	private String status;
	
	public reservDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public reservDTO(int reserv_id, int member_id, int place_id, String date,
			String starttime, int people, int usetime,
			int cost, String comment, String status) {
		this.reserv_id = reserv_id;
		this.member_id = member_id;
		this.place_id = place_id;
		this.date = date;
		this.starttime = starttime;
		this.people = people;
		this.usetime = usetime;
		this.cost = cost;
		this.comment = comment;
		this.status = status;
	}
	public int getReserv_id() {
		return reserv_id;
	}
	public void setReserv_id(int reserv_id) {
		this.reserv_id = reserv_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getPlace_id() {
		return place_id;
	}
	public void setPlace_id(int place_id) {
		this.place_id = place_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getUsetime() {
		return usetime;
	}
	public void setUsetime(int usetime) {
		this.usetime = usetime;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "reservDTO [reserv_id=" + reserv_id + ", member_id=" + member_id + ", place_id=" + place_id + ", date="
				+ date + ", starttime=" + starttime + ", people=" + people + ", usetime=" + usetime + ", cost=" + cost
				+ ", comment=" + comment + ", status=" + status + "]";
	}	
}
