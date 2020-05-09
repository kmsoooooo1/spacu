package com.wework.reservation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class reservDAO {

	Connection conn;
	Statement stmt;
	ResultSet rs;
	String sql;
	
	public reservDAO() {
		// TODO Auto-generated constructor stub
		getConnection();
	}
	private void getConnection() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/wework");
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			System.out.println("연결 성공!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void closeDB() {
		try {
			if(conn!=null)conn.close();
			if(stmt!=null)stmt.close();
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int insertReserv(reservDTO dto) {
		int chk = -1;
		
		sql = "insert into reserv values ((select num from (select coalesce(max(reserv_id),0) num from reserv innertable) outertable)+1,"
				+ dto.getMember_id() + ","
				+ dto.getPlace_id() + ",'"
				+ dto.getDate() + "','"
				+ dto.getStarttime() + "',"
				+ dto.getPeople() + ","
				+ dto.getUsetime() + ","
				+ dto.getCost() + ",'"
				+ dto.getComment() + "', '"
				+ dto.getStatus() + "')";
		System.out.println(sql);
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
	}
	
	public reservDTO Reserv(String sql) {
		reservDTO dto = null;
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				dto = new reservDTO();
				dto.setReserv_id(rs.getInt("reserv_id"));
				dto.setMember_id(rs.getInt("member_id"));
				dto.setPlace_id(rs.getInt("place_id"));
				dto.setDate(rs.getString("date"));
				dto.setStarttime(rs.getString("starttime"));
				dto.setPeople(rs.getInt("people"));
				dto.setUsetime(rs.getInt("usetime"));
				dto.setCost(rs.getInt("cost"));
				dto.setComment(rs.getString("comment"));
				dto.setStatus(rs.getString("status"));
				
				System.out.println(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public reservDTO getReserv(int member_id) {
		sql = "select * from reserv where member_id=" + member_id;
		return Reserv(sql);
	}
	
	
}
