package com.zr.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.zr.model.User;
import com.zr.util.JDBCUtil;

public class Select_userService {
	public static int count=0;
	/**
	 * 保存用户信息
	 * @param uname  
	 * @return
	 */
	 public List<User>  selectnotice(String username,String name )
	{
		 List<User> users = new ArrayList<User>();
		 try {
			
				String sql = "select * from  user where username='"+username+"' or name='"+ name+"' ";
				Connection  con = JDBCUtil.getConnection();
				PreparedStatement  pst = con.prepareStatement(sql);
				ResultSet  rs = pst.executeQuery();
				
				while(rs.next()) {
					User user=new User();
					user.setid(rs.getInt("id"));
					user.setusername(rs.getString("username"));
					user.setname(rs.getString("name"));
					user.setpassword(rs.getString("password"));
					user.setstate(rs.getInt("state"));
					users.add(user);
					
					
				
					}
				
				
				
				
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return users;
		 
	}
	
	
	
	public List<User>  selectnotice(int pagess,int rowss ){
		
		int c=(pagess-1)*rowss;
		
		
		List<User> users = new ArrayList<User>();
		List<User> users1 = new ArrayList<User>();
		try {
			//String sql = "select * from  user limit (page-1)*rowss,rowss";
			//String sql = "select * from  user limit '"+c+"',10";
			String sql = "select * from  user limit "+c+","+ rowss+"";
			Connection  con = JDBCUtil.getConnection();
			PreparedStatement  pst = con.prepareStatement(sql);
			ResultSet  rs = pst.executeQuery();
			
			while(rs.next()) {
				User user=new User();
				user.setid(rs.getInt("id"));
				user.setusername(rs.getString("username"));
				user.setname(rs.getString("name"));
				user.setpassword(rs.getString("password"));
				user.setstate(rs.getInt("state"));
				users.add(user);
				
				
			
				}
			
			String sql1 = "select * from  user";
			Connection  con1 = JDBCUtil.getConnection();
			PreparedStatement  pst1 = con1.prepareStatement(sql1);
			ResultSet  rs1 = pst1.executeQuery();
			
			while(rs1.next()) {
				count++;
				/*User user1=new User();
				user1.setusername(rs1.getString("username"));
				user1.setname(rs1.getString("name"));
				user1.setpassword(rs1.getString("password"));
				user1.setstate(rs1.getInt("state"));
				users1.add(user1);*/
				
				
				
			
				}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return users;
	}
}
