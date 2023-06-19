package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.ProductDOAImple;
import com.entity.ProductDtls;

@WebServlet("/edit_products")
public class EditProductsServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String productname=req.getParameter("pname");
			String productgrade=req.getParameter("grade");
			String price = req.getParameter("price");
			String status=req.getParameter("stype");
			
			ProductDtls b= new ProductDtls();
			b.setProductid(id);
			b.setProductname(productname);
			b.setProductgrade(productgrade);
			b.setPrice(price);
			b.setStatus(status);
			
			ProductDOAImple doa=new ProductDOAImple(DBConnect.getConn());
			boolean f=doa.UpdateEditProducts(b);
			
			HttpSession session =req.getSession();
			
			if(f) {
				session.setAttribute("succMSG", "Product updated successfully..");
				resp.sendRedirect("admin/all_product.jsp");
				
			}else {
				session.setAttribute("failMSG", "Something went wrong !");
				resp.sendRedirect("admin/all_product.jsp");
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	

}
