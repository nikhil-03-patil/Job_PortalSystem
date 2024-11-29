package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {

	private Connection conn;
	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addUser(User u)
	{
		boolean f= false;
		try {
			
			String sql = "insert into user(email, name, password, qualification, role) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getName());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQualification());
			//ps.setString(5, u.getRole());
			ps.setString(5, "user");
			
			int i = ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			
		}
		return f;
		
	}
	
	
	public User login(String em, String psw)
	{
		
		User u = null;
		try {
			String sql = "select * from user where email=? and password=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
				u.setRole(rs.getString(6));
				
			}
		} catch (Exception e) {
			
		}
				return u;
		
	}
}
