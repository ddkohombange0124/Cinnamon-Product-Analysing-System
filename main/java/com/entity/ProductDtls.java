package com.entity;

public class ProductDtls {
	
	private int productid;
	private String productname;
	private String productgrade;
	private String price;
	private String category;
	private String status;
	private String description;
	private String image;
	
	public ProductDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProductDtls(String productname, String productgrade, String price, String category, String status,
			String description, String image) {
		super();
		this.productname = productname;
		this.productgrade = productgrade;
		this.price = price;
		this.category = category;
		this.status = status;
		this.description = description;
		this.image = image;
	}
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProductgrade() {
		return productgrade;
	}
	public void setProductgrade(String productgrade) {
		this.productgrade = productgrade;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "ProductDtls [productid=" + productid + ", productname=" + productname + ", productgrade=" + productgrade
				+ ", price=" + price + ", category=" + category + ", status=" + status + ", description=" + description
				+ ", image=" + image + "]";
	}
	

}
