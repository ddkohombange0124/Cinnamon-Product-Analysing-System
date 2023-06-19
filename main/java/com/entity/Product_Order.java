package com.entity;

public class Product_Order {
	
	private int id;
	private String orderid;
	private String username;
	private String email;
	private String phono;
	private String fulladd;
	private String paymentType;
	private String productName;
	private String price;
	private String productGrade;
	
	
	
	public Product_Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getProductGrade() {
		return productGrade;
	}



	public void setProductGrade(String productGrade) {
		this.productGrade = productGrade;
	}



	public String getOrderid() {
		return orderid;
	}



	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhono() {
		return phono;
	}
	public void setPhono(String phono) {
		this.phono = phono;
	}
	public String getFulladd() {
		return fulladd;
	}
	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	@Override
	public String toString() {
		return "Product_Order [id=" + id + ", username=" + username + ", email=" + email + ", phono=" + phono
				+ ", fulladd=" + fulladd + ", paymentType=" + paymentType + "]";
	}
	
	
	
	
	

}
