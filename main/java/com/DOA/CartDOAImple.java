package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import com.entity.Cart;
import com.entity.ProductDtls;

public class CartDOAImple implements CartDOA {
	
	private Connection conn;
	
	public CartDOAImple(Connection conn)
	{
		this.conn=conn;
	}
	
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String sql="insert into cart(pid,uid,product_name,product_grade,price,total_price)values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getProduct_name());
			ps.setString(4, c.getProduct_grade());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotal_prica());
			
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

	public List<Cart> getProductByUser(int userId) {
		List<Cart> list= new ArrayList<Cart>();
		Cart c=null;
		double totalPrica=0;
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ps.setInt(1, userId);
			
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setProduct_name(rs.getString(4));
				c.setProduct_grade(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrica = totalPrica+rs.getDouble(7);
				c.setTotal_prica(totalPrica);
				
				list.add(c);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteProduct(int pid,int uid,int cid) {
		boolean f=false;
		
		
		try {
			String sql="delete from cart where pid=? and uid=? and cid=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1,pid);
			ps.setInt(2,uid);
			ps.setInt(3,cid);
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
		}
		catch(SQLException e){
			e.printStackTrace();
			
		}
		
		return f;
	}

	public boolean deleteProduct(int pid, int uid) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}
