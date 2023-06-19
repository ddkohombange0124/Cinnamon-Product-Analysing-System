package com.DOA;

import java.util.List;

import com.entity.Product_Order;

public interface ProductOrderDOA {

	
	
	public boolean saveOrder(List<Product_Order> b);
	
	public List<Product_Order> getProduct(String email);
	
	public List<Product_Order> getAllOrder();
}
