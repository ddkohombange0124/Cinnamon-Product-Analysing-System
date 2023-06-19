package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ProductDtls;

public class ProductDOAImple implements ProductDOA {
	
	private Connection conn;
	
	

	public ProductDOAImple(Connection conn) {
		super();
		this.conn = conn;
	}



	public boolean addProoducts(ProductDtls b) {
		boolean f=false;
		try {
			
			String sql="insert into product_dts(product_name,product_grade,price,category,status,description,image) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getProductname());
			ps.setString(2, b.getProductgrade());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getDescription());
			ps.setString(7, b.getImage());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}



	public List<ProductDtls> getAllProducts() {
		
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b = null;
		
		try {
			
			String sql = "select * from product_dts";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				b= new ProductDtls();
				b.setProductid(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setProductgrade(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setDescription(rs.getString(7));
				b.setImage(rs.getString(8));
				list.add(b);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		return list;
	}



	public ProductDtls getProductById(int id) {
		ProductDtls b=null;
		
		try {
			String sql="select * from product_dts where product_id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1,id);
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next())
			{
				b=new ProductDtls();
				b.setProductid(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setProductgrade(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setDescription(rs.getString(7));
				b.setImage(rs.getString(8));
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		return b;
	}



	public boolean UpdateEditProducts(ProductDtls b) {
		boolean f= false;
		try {
			String sql="update product_dts set product_name=?,product_grade=?,price=?,status=? where product_id=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, b.getProductname());
            ps.setString(2, b.getProductgrade());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getProductid());
            
            int i=ps.executeUpdate();
            if(i==1) {
            	f=true;
            }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
	}



	public boolean deleteProducts(int id) {
		boolean f=false;
		try {
			String sql="delete from product_dts where product_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return f;
	}



	public List<ProductDtls> getNewProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b=null;
		
		try {
			String sql="select * from product_dts  where category=? order by product_id DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "ceylon cinnamon");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new ProductDtls();
				b.setProductid(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setProductgrade(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setDescription(rs.getString(7));
				b.setImage(rs.getString(8));
				list.add(b);
				i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}



	public List<ProductDtls> getRecentProducts() {
		
		
			List<ProductDtls> list = new ArrayList<ProductDtls>();
			ProductDtls b=null;
			
			try {
				String sql="select * from product_dts  where status=? order by product_id DESC ";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, "Recent product");
				ResultSet rs=ps.executeQuery();
				int i=1;
				while(rs.next() && i<=4)
				{
					b=new ProductDtls();
					b.setProductid(rs.getInt(1));
					b.setProductname(rs.getString(2));
					b.setProductgrade(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setCategory(rs.getString(5));
					b.setStatus(rs.getString(6));
					b.setDescription(rs.getString(7));
					b.setImage(rs.getString(8));
					list.add(b);
					i++;
				}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
		
	}



	public List<ProductDtls> getOldProducts() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b=null;
		
		try {
			String sql="select * from product_dts  where status=? order by product_id DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old product");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new ProductDtls();
				b.setProductid(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setProductgrade(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setDescription(rs.getString(7));
				b.setImage(rs.getString(8));
				list.add(b);
				i++;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}



	public List<ProductDtls> getAllRecentProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b=null;
		
		try {
			String sql="select * from product_dts  where status=? order by product_id DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Recent product");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new ProductDtls();
				b.setProductid(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setProductgrade(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setDescription(rs.getString(7));
				b.setImage(rs.getString(8));
				list.add(b);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}



	public List<ProductDtls> getAllNewProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b=null;
		
		try {
			String sql="select * from product_dts  where category=? order by product_id DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "ceylon cinnamon");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new ProductDtls();
				b.setProductid(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setProductgrade(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setDescription(rs.getString(7));
				b.setImage(rs.getString(8));
				list.add(b);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}



	public List<ProductDtls> getAllOldProduct() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b=null;
		
		try {
			String sql="select * from product_dts  where status=? order by product_id DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old product");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new ProductDtls();
				b.setProductid(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setProductgrade(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setDescription(rs.getString(7));
				b.setImage(rs.getString(8));
				list.add(b);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}



	public List<ProductDtls> getProductBySearch(String ch) {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls b=null;
		
		try {
			String sql="select * from product_dts  where product_name like ? or product_grade like ? or category like ? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new ProductDtls();
				b.setProductid(rs.getInt(1));
				b.setProductname(rs.getString(2));
				b.setProductgrade(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setDescription(rs.getString(7));
				b.setImage(rs.getString(8));
				list.add(b);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	

}
