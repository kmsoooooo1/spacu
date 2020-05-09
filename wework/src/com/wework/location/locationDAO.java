package com.wework.location;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class locationDAO {
	
	Connection conn;
	Statement stmt;
	ResultSet rs;
	String sql;
	
	public locationDAO() {
		// TODO Auto-generated constructor stub
		getConnection();
	}
	
	private void getConnection(){
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/wework");
			
			conn = ds.getConnection();
			stmt = conn.createStatement();
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void closeDB(){
		try {
			if(conn != null)conn.close();
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//	insertLocation()
	
	public int insertLocation(locationBean lb){
		int chk = 0;
		sql = "select max(location_id) from locations";
		
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				lb.setLocation_id(rs.getInt("max(location_id)")+1);
			}else{
				lb.setLocation_id(1);
			}
			sql = "insert into locations values("
					+ lb.getLocation_id()+ ", '"
					+ lb.getLocation_region() + "', '"
					+ lb.getLocation_name() + "', '"
					+ lb.getPhone() + "', '"
					+ lb.getPostnum() + "', '"
					+ lb.getNewaddr() + "', '"
					+ lb.getOldaddr() + "', '"
					+ lb.getDetail() + "', '"
					+ lb.getWorktime() + "','"
					+ lb.getHolyday() + "','"
					+ lb.getLocation_exp() + "','"
					+ lb.getText() + "',"
					+ "now())";
			System.out.println(sql);
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return chk;
	}
	
	//	insertLocation()
	//	updateLocation()
	
	public int updateLocation(locationBean lb){
		
		int chk = -1;
		
		sql = "update locations set "
				+ "location_region='" + lb.getLocation_region() + "', "
				+ "location_name='" + lb.getLocation_name() + "', "
				+ "phone='" + lb.getPhone() + "', "
				+ "postnum='" + lb.getPostnum() + "', "
				+ "newaddr='" +lb.getNewaddr() + "', " 
				+ "oldaddr='" +lb.getOldaddr() + "', " 
				+ "detail='" +lb.getDetail() + "', "
				+ "worktime='" + lb.getWorktime() + "', "
				+ "holyday='" + lb.getHolyday() + "', "
				+ "location_exp='" + lb.getLocation_exp() + "', "
				+ "text='" + lb.getText() + "' " 
				+ "where location_id=" + lb.getLocation_id();
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
	}
	//	updateLocation()
	
	//	deleteLocation()
	
	public int deleteLocation(int location_id){
		int chk = -1;
		sql = "delete from locations where location_id=" + location_id;
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
	}
	//	deleteLocation()
	//	getLocation()
	
	public locationBean getLocation(int location_id){
		locationBean lb = null;
		sql = "select * from locations where location_id=" + location_id;
		
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				lb = new locationBean(rs.getInt("location_id"),
						rs.getString("location_region"),
						rs.getString("location_name"),
						rs.getString("phone"),
						rs.getString("postnum"),
						rs.getString("newaddr"),
						rs.getString("oldaddr"),
						rs.getString("detail"),
						rs.getString("worktime"),
						rs.getString("holyday"),
						rs.getString("location_exp"),
						rs.getString("text"),
						rs.getString("reg_date"));
				
				System.out.println(lb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lb;		
	}
	//	getLocation()
	
	//	getLocationList
	
	public ArrayList<locationBean> addList(String sql){
		ArrayList<locationBean> list = new ArrayList<locationBean>();
		locationBean lb = null;
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				lb = new locationBean(rs.getInt("location_id"),
						rs.getString("location_region"),
						rs.getString("location_name"),
						rs.getString("phone"),
						rs.getString("postnum"),
						rs.getString("newaddr"),
						rs.getString("oldaddr"),
						rs.getString("detail"),
						rs.getString("worktime"),
						rs.getString("holyday"),
						rs.getString("location_exp"),
						rs.getString("text"),
						rs.getString("reg_date"));
				list.add(lb);
				System.out.println(lb);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<locationBean> getLocationList(int page, int size){
		sql = "select * from locations order by location_id desc limit " + (page*size) +"," + size;
		return addList(sql);
	}
	
	public ArrayList<locationBean> getLocationList(String region){
		sql = "select * from locations where location_region='"+ region +"' order by location_id desc";
		return addList(sql);
	}
	
	public ArrayList<locationBean> getLocationList(int page, int size, String region){
		sql = "select * from locations where location_region='" + region +"' order by location_id desc limit " + (page*size) +"," + size;
		return addList(sql);
	}
	
	//	getLocationList
	
	
	//	getCount()
	
	private int sqlCount(String sql){
		int cnt = 0;
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				cnt = rs.getInt("count(location_id)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int getCount(){
		sql = "select count(location_id) from locations";
		return sqlCount(sql);
	}
	
	public int getCount(String region){
		sql = "select count(location_id) from locations where location_region='" + region + "'";
		return sqlCount(sql);
	}
	
	
	
	//	getCount()
	
	public ResultSet getSQL(String sql){
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int locationCheck(String location_name) {
		int chk = -1;
		
		sql = "select location_id from locations where "
				+ "location_name='" + location_name + "'";
		
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				chk = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
	}
	
	public ArrayList<locationBean> getRegionList(String location_region){
		ArrayList<locationBean> list = new ArrayList<locationBean>();
		locationBean lb = null;
		sql = "select * from locations where location_region='" + location_region + "' order by location_id desc";
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				lb = new locationBean(rs.getInt("location_id"),
						rs.getString("location_region"),
						rs.getString("location_name"),
						rs.getString("phone"),
						rs.getString("postnum"),
						rs.getString("newaddr"),
						rs.getString("oldaddr"),
						rs.getString("detail"),
						rs.getString("worktime"),
						rs.getString("holyday"),
						rs.getString("location_exp"),
						rs.getString("text"),
						rs.getString("reg_date"));
				list.add(lb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
