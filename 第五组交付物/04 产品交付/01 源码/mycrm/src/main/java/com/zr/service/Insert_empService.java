package com.zr.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.zr.util.JDBCUtil;

public class Insert_empService {
	/**
	 * 保存用户信息
	 * @param uname  
	 * @return
	 */
	public boolean saveUserByUserName(String ename,String eid,String esex,String ejob,String etelphone,String edepartment){
		boolean  flag = false;
		try {
			String sql = "INSERT INTO employee (ename,eid,esex,ejob,etelphone,edepartment) VALUES ('"+ename+"','"+eid+"','"+esex+"','"+ejob+"','"+etelphone+"','"+edepartment+"')";
		//	String sql = "INSERT INTO user (username,name,password,state) VALUES (?)";
			Connection  con = JDBCUtil.getConnection();
			PreparedStatement  pst = con.prepareStatement(sql);
			
			
			int i = pst.executeUpdate();
			if(i>=0){
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  flag;
	}
}
