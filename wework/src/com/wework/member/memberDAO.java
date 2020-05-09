package com.wework.member;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	String sql;
	Connection conn;
	Statement stmt;
	ResultSet rs;
	
	public memberDAO() {
		// TODO Auto-generated constructor stub
		getConnection();
	}
	private void getConnection(){
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/wework");
			
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			System.out.println("DB연결 성공!");
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
	
	public void insertMember(memberBean mb){
		
		sql = "select max(member_id) from member";
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				mb.setMember_id(rs.getInt("max(member_id)")+1);
			}else{
				mb.setMember_id(1);
			}
			
			sql = "insert into member values("
					+ mb.getMember_id() +  ", '"
					+ mb.getId() + "','"
					+ mb.getPw() + "','"
					+ mb.getName() + "','"
					+ mb.getBirth() + "','"
					+ mb.getGender() + "','"
					+ mb.getPhone() + "','"
					+ mb.getEmail() +"',"
					+ mb.getPoint() + ","
					+ mb.getLevel() + ","
					+ "now(),"
					+ mb.isEmailcheck() + ")";
			
			stmt.executeUpdate(sql);
			System.out.println("회원가입 완료!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int idCheck(String id, String pw){
		int chk = -1;
		System.out.println(id);
		sql = "select pw from member where id='" + id + "'";
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				chk = 0;
				if(pw != null && pw.equals(rs.getString("pw"))){
					chk = 1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chk;
	}
	
	public int deleteMember(String id){
		int chk = -1;
		sql = "delete from member where id='" + id + "'";
		try {
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return chk;
	}
	
	//	updateMember(id, pw)
	
	public int updateMember(memberBean mb) {
		
		int chk = -1;
		sql = "update member set "
				+ "id='" + mb.getId() + "', "
				+ "pw='" + mb.getPw() + "', "
				+ "name = '" + mb.getName() + "', "
				+ "birth='" + mb.getBirth() + "', "
				+ "gender='" + mb.getGender() + "', "
				+ "phone='" + mb.getPhone() + "', "
				+ "email='"+mb.getEmail() + "', "
				+ "level=" + mb.getLevel() + ", "
				+ "point="+mb.getPoint() + " where member_id=" + mb.getMember_id();
		try {
			System.out.println(sql);
			chk = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return chk;
	}
	
	
	//	updateMember(id, pw)
	//	getMember(id, pw)
	
	public memberBean getMember(String id) {
		memberBean mb = null;
		sql = "select * from member where id='" + id + "'";
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				mb = new memberBean(rs.getInt("member_id"),
						rs.getString("id"),
						rs.getString("pw"),
						rs.getString("name"),
						rs.getString("birth"),
						rs.getString("gender"),
						rs.getString("phone"),
						rs.getString("email"),
						rs.getInt("point"),
						rs.getInt("level"),
						rs.getString("reg_date"),
						rs.getBoolean("emailcheck"));
				
				
				System.out.println("멤버빈 생성 완료");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("멤버빈 생성 실패");
			e.printStackTrace();
		}
		return mb;
	}
	//	getMember(id, pw)
	
	//	getPhone(phone)
	
	public int getPhone(String phone) {
		int chk = 0;
		
		sql = "select member_id from member where phone='" + phone + "'";
		System.out.println(sql);
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
	//	getPhone(phone)
	
	public String[] loginPro(String id) {
		String[] arr = null;
		
		sql = "select id, level from member where id='" + id + "'";
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				arr = new String[2];
				arr[0] = rs.getString("id");
				arr[1] = String.valueOf(rs.getInt("level"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
	
	public List<memberBean> MemberList(){
		List<memberBean> list = new ArrayList<memberBean>();
		memberBean mb = null;
		sql = "select * from member";
		
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				mb = new memberBean(rs.getInt("member_id"),
						rs.getString("id"),
						rs.getString("pw"),
						rs.getString("name"),
						rs.getString("birth"),
						rs.getString("gender"),
						rs.getString("phone"),
						rs.getString("email"),
						rs.getInt("point"),
						rs.getInt("level"),
						rs.getString("reg_date"),
						rs.getBoolean("emailcheck"));
				
				System.out.println(mb);
				list.add(mb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int getMember_id(String id) {
		int member_id = 0;
		sql = "select member_id from member where id='" + id + "'";
		
		try {
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				member_id = rs.getInt("member_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member_id;
	}
	
}
