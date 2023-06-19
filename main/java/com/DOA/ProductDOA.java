package com.DOA;

import java.util.List;

import com.entity.ProductDtls;

public interface ProductDOA {
	
	public boolean addProoducts(ProductDtls b);
	
	public List<ProductDtls> getAllProducts();
	
	public ProductDtls getProductById(int id);
	
	public boolean UpdateEditProducts(ProductDtls b);
	
	public boolean deleteProducts(int id);
	
	public List<ProductDtls> getNewProduct();
	
	public List<ProductDtls> getRecentProducts();
	
	public List<ProductDtls> getOldProducts();
	
	public List<ProductDtls> getAllRecentProduct();
	
	public List<ProductDtls> getAllNewProduct();
	
	public List<ProductDtls> getAllOldProduct();
	
	public List<ProductDtls> getProductBySearch(String ch);

}
