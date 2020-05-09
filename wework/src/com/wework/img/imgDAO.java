package com.wework.img;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class imgDAO {

	Connection conn;
	Statement stmt;
	ResultSet rs;
	String sql;
		
	public imgDAO() {
		// TODO Auto-generated constructor stub
		getConnection();
	}
	private void getConnection(){
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/wework");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			System.out.println("연결 성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void closeDB(){
		try {
			if(conn!=null)conn.close();
			if(stmt!=null)stmt.close();
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int insertImg(imgBean ib){
		int chk = -1;
		sql = "insert into images values((select num from (select coalesce(max(img_id),0) num from images innertable) outertable)+1,"
				+ ib.getLocation_id() + ","
				+ ib.getPlace_id() + ",'"
				+ ib.getImg_src() + "')";
		System.out.println(sql);
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
	}
	
	public int insertImgList(List<imgBean> list){
		int chk = -1;
		for(imgBean ib : list){
			chk = insertImg(ib);
			if(chk<1){
				return -1;
			}
		}
		return chk;
	}
	public imgBean getImg(String sql){
		imgBean ib = null;
		
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				ib = new imgBean(rs.getInt("img_id"),
						rs.getInt("location_id"),
						rs.getInt("place_id"),
						rs.getString("img_src"));
				
				System.out.println(ib);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ib;
	}
	
	public imgBean getMainImg(int location_id, int place_id){
		sql = "select * from images where location_id=" + location_id + " and place_id=" + place_id +" order by img_id desc limit 0,1";
		
		return getImg(sql);
	}
	public List<imgBean> getListImg(String sql){
		List<imgBean> list = new ArrayList<imgBean>();
		imgBean ib = null;
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				ib = new imgBean(rs.getInt("img_id"), rs.getInt("location_id"), rs.getInt("place_id") , rs.getString("img_src"));
				list.add(ib);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public  List<imgBean> getList(){
		sql = "select * from images";
		return getListImg(sql);
	}
	public List<imgBean> getList(int location_id, int place_id){
		sql = "select * from images where location_id=" + location_id + " and place_id=" + place_id;
		return getListImg(sql);
	}
	
	public int deleteImg(int img_id){
		int chk = -1;
		
		sql = "delete from images where img_id=" + img_id;
		
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return chk;
	}
	
}
