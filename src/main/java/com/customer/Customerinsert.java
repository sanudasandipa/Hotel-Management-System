package com.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistartionServlet
 */
@WebServlet("/Customerinsert")
public class Customerinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
			 {
				
				String uname = request.getParameter("name");
				String uemail = request.getParameter("email");
				String upwd = request.getParameter("pass");
				String Reupwd = request.getParameter("re_pass");
				String umobile = request.getParameter("contact");
				
				RequestDispatcher dispatcher = null;
				Connection con = null;
				
				
				if(uname == null || uname.equals("")){
					request.setAttribute("status", "invalidName");
					dispatcher =request.getRequestDispatcher("customerinsert.jsp");
					dispatcher.forward(request, response);
					
				}
				if(uemail == null || uemail.equals("")){
					request.setAttribute("status", "invalidEmail");
					dispatcher =request.getRequestDispatcher("customerinsert.jsp");
					dispatcher.forward(request, response);
					
				}
				if(upwd == null || upwd.equals("")){
					request.setAttribute("status", "invalidPassword");
					dispatcher =request.getRequestDispatcher("customerinsert.jsp");
					dispatcher.forward(request, response);
					
				}else if(!upwd.equals(Reupwd)) {
					request.setAttribute("status", "invalidConformPassword");
					dispatcher =request.getRequestDispatcher("customerinsert.jsp");
					dispatcher.forward(request, response);
					
				}
				
				if(umobile == null || umobile.equals("")){
					request.setAttribute("status", "invalidContact");
					dispatcher =request.getRequestDispatcher("customerinsert.jsp");
					dispatcher.forward(request, response);
					
				}else if (umobile.length()>10) {
					request.setAttribute("status", "invalidNumber");
					dispatcher =request.getRequestDispatcher("customerinsert.jsp");
					dispatcher.forward(request, response);
					
				}
				
				
				
				
				
				try {
					 Class.forName("com.mysql.cj.jdbc.Driver");
					  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","Kavidu36@");
					 PreparedStatement pst = con.prepareStatement("insert into users(uname,upwd,uemail,umobile) values(?,?,?,?) ");
					 pst.setString(1, uname);
					 pst.setString(2, upwd);
					 pst.setString(3, uemail);
					 pst.setString(4, umobile);
					 
					 int rowCount= pst.executeUpdate();
					 dispatcher = request.getRequestDispatcher("login.jsp");
					 
					 if( rowCount>0){
						  request.setAttribute("status", "success"); 
					 }else {
						 request.setAttribute("status", "failed");
					 } 
					 dispatcher.forward(request, response);
					 
				}catch(Exception e) {
					
					e.printStackTrace();	
				}finally {
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		
		
	}

}
