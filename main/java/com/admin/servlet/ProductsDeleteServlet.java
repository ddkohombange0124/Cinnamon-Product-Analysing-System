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

@WebServlet("/delete")
public class ProductsDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			ProductDOAImple doa= new ProductDOAImple(DBConnect.getConn());
			boolean f=doa.deleteProducts(id);
			
HttpSession session =req.getSession();
			
			if(f) {
				session.setAttribute("succMSG", "Product deleted successfully..");
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
