package com.customer;

public class Customer {

	private int id;
	private String uname;
	private String upwd;
	private String uemail;
	private String umobile;
	
	public Customer(int id, String uname, String upwd, String uemail, String umobile) {
		super();
		this.id = id;
		this.uname = uname;
		this.upwd = upwd;
		this.uemail = uemail;
		this.umobile = umobile;
		
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public String getUemail() {
		return uemail;
	}
	public String getUmobile() {
		return umobile;
	}
	
	
}