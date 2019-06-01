package com.zr.controller;

import com.zr.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.zr.service.Select_userService;

import com.zr.util.JDBCUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Select_userController extends  HttpServlet{
	
	Select_userService  select_userService   = new Select_userService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException{
		  //有一个服务可以获取所有学生的信息
		//分页操作
		String rows = req.getParameter("rows") ;
		String page = req.getParameter("page") ;
		
		String username = req.getParameter("username") ;
		String name = req.getParameter("name") ;
		//System.out.println(username);
	//	System.out.println(name);
		req.setCharacterEncoding("UTF-8");
		//设置返回类型
		resp.setContentType("text/html; charset=utf-8");
		
		
		
		int count1;
	            int rowss = Integer.parseInt(rows) ;
	            
	            int pagess = Integer.parseInt(page) ;
	            List<User>  users;
	            
	            
	            if(name!=null || username!=null) {
	    			
	            	   users = select_userService.selectnotice(username, name);
	            	   
	    		}
	            else {
	              users = select_userService.selectnotice(pagess, rowss);
	              
	            }
	            
	           // String json_list = new StudentService().getPageJSON(pagess, rowss) ;
	            //返回数据
	            
	            count1=com.zr.service.Select_userService.count;
	            com.zr.service.Select_userService.count=0;
	        //    System.out.println("count1");
	   //    System.out.println(count1);
		
		
		
		
		
		//List<Student>  students = studentService.selectStudnet();
		//List<User>  users = select_userService.selectnotice();
		 // JSONObject JSONArray  方便的对java对象进行转换
		JSONArray j = JSONArray.fromObject(users);
		System.out.println(j);
		//-----------------
		JSONArray j1  =  new JSONArray();
		//-----------------
//		JSONObject  j2 = JSONObject.fromObject(students);
//		System.out.println(j2);
//		JSONObject  j3 = new JSONObject();
//		j3.put("total", 3);
//		j3.put("students", students);
//		System.out.println(j3);
		Map  m = new HashMap();
		m.put("total", count1);
		m.put("rows", users);
		JSONObject  j2  = JSONObject.fromObject(m);
		try {
			PrintWriter pw = resp.getWriter();
			pw.write(j2.toString());
			pw.flush();
			pw.close();
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
