package com.customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs   = null;
	

	public static boolean validate(String uemail, String upwd){
		
		//ArrayList<Customer> cus = new ArrayList<>();
		
		//create database connection
		
		//validate
		
		try {
			
			con = DBConnect.getConnection();
			stmt =con.createStatement();
			
			
			
			String sql = "select * from users where uemail='"+uemail+"' and upwd = '"+upwd+"'  ";
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				isSuccess= true;
				
			/*	int id= rs.getInt(1);
				String name = rs.getString(2);
				String pwd1 = rs.getString(3);
				String email = rs.getString(4);
				String mobile = rs.getString(5);
				
				
				Customer c = new Customer(id,name,pwd1,email,mobile);
				
				cus.add(c);
				*/
			}else {
				isSuccess = false;
				
			}
			
			
		}
		 catch(Exception e){
			 
			 e.printStackTrace();
		 }
		
		
		return isSuccess;
		
	}
	
	
	public static List<Customer> getCustomer(String umail){
		
		ArrayList<Customer>customer = new ArrayList<>();
		
		try {
			con= DBConnect.getConnection();
			stmt=con.createStatement();
			String sql = "select* from users where uemail= '"+umail+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String uname = rs.getString(2);
				String upwd = rs.getString(3);
				String uemail = rs.getString(4);
				String umobile = rs.getString(5);
				
			Customer cus = new Customer( id,  uname,  upwd,  uemail,  umobile);
			
			customer.add(cus);
			
			
			}
			
			
			
			}
			
		catch(Exception e){
			 
		 
		 }
		
		return customer;
		
	}
	
	
	public static boolean insertcustomer(String uname, String upwd, String uemail, String umobile) {
		
		boolean isSuccess = false;
		
		//create database connection
				
				try { 
					con = DBConnect.getConnection();
					stmt =con.createStatement();
				
				
					
				String sql = "insert into customer values(0, '"+uname+"', '"+upwd+"', '"+uemail+"', '"+umobile+"' )";
				
				int rs = stmt.executeUpdate(sql);
					
				
				if(rs>0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}
				
				
				
				}
				catch(Exception e){
			 
			 e.printStackTrace();
		 }
		
		
		return isSuccess;
		
	}
	
	
	public static boolean updatecustomer(String id, String name, String password, String email, String phone) {
		
		try {
			
			con= DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "update users set uname= '"+name+"', upwd= '"+password+"', uemail= '"+email+"', umobile='"+phone+"'" 
			           + "where id= '"+id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
			
		}
		catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		
		return isSuccess;
		
	}
	
	
	public static List<Customer> getCustomerDetails(String Id){
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList<Customer> cus = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from users where id= '"+convertedID+"'";
			rs= stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String uname = rs.getString(2);
				String upwd = rs.getString(3);
				String uemail = rs.getString(4);
				String umobile = rs.getString(5);
				
				
				Customer c = new Customer(id,uname,upwd,uemail,umobile);
				cus.add(c);
				
			}
			
			
		}
		
		catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		
		return cus;
		
	}
	
	public static boolean deleteCustomer(String id) {
		
		int convId = Integer.parseInt(id);
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql ="delete from users where id= '"+convId+"'";
			int r = stmt.executeUpdate(sql);
			
			if(r>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
			
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	
	
}
