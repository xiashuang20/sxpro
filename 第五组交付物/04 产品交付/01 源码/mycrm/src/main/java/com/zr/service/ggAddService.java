
	package com.zr.service;

	import java.sql.Connection;
import java.sql.PreparedStatement;

import com.zr.util.JDBCUtil;

	public class ggAddService {
		/**
		 * 保存用户信息
		 * @param uname  
		 * @return
		 */
		public boolean saveById(String gg_name,String gg_content,String gg_time,String gg_person){
			boolean  flag = false;
			try {
				String sql = "INSERT INTO gg (gg_name,gg_content,gg_time,gg_person) VALUES ('"+gg_name+"','"+gg_content+"',+'"+gg_time+"','"+gg_person+"')";
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
