package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.CartDOAImple;
import com.DOA.ProductDOAImple;
import com.entity.Cart;
import com.entity.ProductDtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int pid=Integer.parseInt(req.getParameter("pid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			ProductDOAImple doa=new ProductDOAImple(DBConnect.getConn());
			ProductDtls b=doa.getProductById(pid);
			
			Cart c=new Cart();
			c.setPid(pid);
			c.setUserId(uid);
			c.setProduct_name(b.getProductname());
			c.setProduct_grade(b.getProductgrade());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_prica(Double.parseDouble(b.getPrice()));
			
			CartDOAImple doa2=new CartDOAImple(DBConnect.getConn());
			boolean f=doa2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("addCart", "Product added to cart");
				resp.sendRedirect("all_new_product.jsp");
				
			}else
			{
				session.setAttribute("failed", "Something went wrong on server !");
				resp.sendRedirect("all_new_product.jsp");
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	
	}
	

}
