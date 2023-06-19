package com.DOA;

import java.util.List;

import com.entity.Cart;
import com.entity.ProductDtls;

public interface CartDOA {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getProductByUser(int userId);
	
	public boolean deleteProduct(int pid,int uid,int cid);

}
