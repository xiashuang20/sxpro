package com.zr.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.zr.model.Dep;
import com.zr.util.JDBCUtil;

public class Select_depService {
	public static int count = 0;

	/**
	 * 保存用户信息
	 * 
	 * @param uname
	 * @return
	 */
	public List<Dep> selectnotice(String dname, String dinfo) {
		List<Dep> dep = new ArrayList<Dep>();
		try {

			String sql = "select * from  department where dname='" + dname + "' or name='" + dinfo + "' ";
			Connection con = JDBCUtil.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Dep dep1 = new Dep();
				dep1.setId(rs.getInt("id"));

				dep1.setDname(rs.getString("dname"));
				dep1.setDinfo(rs.getString("dinfo"));

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dep;

	}

	public List<Dep> selectnotice(int pagess, int rowss) {

		int c = (pagess - 1) * rowss;

		List<Dep> users = new ArrayList<Dep>();
		List<Dep> users1 = new ArrayList<Dep>();
		try {
			// String sql = "select * from user limit (page-1)*rowss,rowss";
			// String sql = "select * from user limit '"+c+"',10";
			String sql = "select * from  department limit " + c + "," + rowss + "";
			Connection con = JDBCUtil.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Dep user = new Dep();
				user.setId(rs.getInt("id"));
				user.setDname(rs.getString("dname"));
				user.setDinfo(rs.getString("dinfo"));
				
				users.add(user);

			}

			String sql1 = "select * from  department";
			Connection con1 = JDBCUtil.getConnection();
			PreparedStatement pst1 = con1.prepareStatement(sql1);
			ResultSet rs1 = pst1.executeQuery();

			while (rs1.next()) {
				count++;
				/*
				 * User user1=new User(); user1.setusername(rs1.getString("username"));
				 * user1.setname(rs1.getString("name"));
				 * user1.setpassword(rs1.getString("password"));
				 * user1.setstate(rs1.getInt("state")); users1.add(user1);
				 */

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return users;
	}
}
