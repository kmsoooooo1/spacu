package com.wework.place;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class placeDAO {
	Connection conn;
	Statement stmt;
	ResultSet rs;
	String sql;
	
	public placeDAO() {
		// TODO Auto-generated constructor stub
		getConnection();
	}
	
	private void getConnection(){
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/wework");
			conn = ds.getConnection();
			stmt = conn.createStatement();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void closeDB(){
		try {
			if(conn != null)conn.close();
			if(stmt != null)stmt.close();
			if(rs != null) rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int insertPlace(placeBean pb){
		int chk = -1;
		
		sql = "insert into place values("
				+ "(select num1 from (select max(place_id) num1 from place table1) table2)+1,"
				+ pb.getLocation_id() + ",'"
				+ pb.getPlace_name() + "','"
				+ pb.getPlace_type() + "',"
				+ pb.getMinhour() + ","
				+ pb.getPerhour() + ","
				+ pb.getMaxsize() + ",now())";
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return chk;
	}
	
	public ArrayList<placeBean> getPlaceList(int location_id){
		ArrayList<placeBean> list = new ArrayList<placeBean>();
		placeBean pb = null;
		sql = "select * from place where location_id=" + location_id;
		
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				pb = new placeBean(rs.getInt("place_id"),
						rs.getInt("location_id"),
						rs.getString("place_name"),
						rs.getString("place_type"),
						rs.getInt("minhour"),
						rs.getInt("perhour"),
						rs.getInt("maxsize"),
						rs.getString("reg_date"));
				
				list.add(pb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public placeBean getPlace(int place_id){
		placeBean pb = null;
		sql = "select * from place where place_id=" + place_id;
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				pb = new placeBean(rs.getInt("place_id"),
						rs.getInt("location_id"),
						rs.getString("place_name"),
						rs.getString("place_type"),
						rs.getInt("minhour"),
						rs.getInt("perhour"),
						rs.getInt("maxsize"),
						rs.getString("reg_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pb;
	}
	
	public int deletePlace(int place_id) {
		int chk = -1;
		sql = "delete from place where place_id=" + place_id;
		
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return chk;
	}
	
	public int updatePlace(placeBean pb) {
		int chk = -1;
		sql = "update place set "
				+ "place_name='" + pb.getPlace_name() + "', "
				+ "place_type='" + pb.getPlace_type() + "', "
				+ "minhour=" + pb.getMinhour() + ", "
				+ "perhour=" + pb.getPerhour() + ", "
				+ "maxsize=" + pb.getMaxsize() + " "
				+ "where place_id=" + pb.getPlace_id();
		System.out.println(sql);
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
	}
	
	
}
