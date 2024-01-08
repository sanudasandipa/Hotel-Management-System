package com.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();	
		response.setContentType("text/html");
		
		String uemail = request.getParameter("uid");
		String upwd = request.getParameter("pass");
		boolean isTrue;
		
		isTrue = CustomerDBUtil.validate(uemail, upwd);
		
		if(isTrue == true) {
			
			List<Customer>cusDetails = CustomerDBUtil.getCustomer(uemail);
			request.setAttribute("cusDetails", cusDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
			
		}else {
			
			out.println("<script type = 'text/javascript'>");
			out.println("alert('Your Username or Password is incorrect');");
			out.println("location='login.jsp'");
			out.println("</script>");
			
			
		}
		
		
	}

}
	