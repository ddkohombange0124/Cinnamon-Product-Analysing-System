package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnect;
import com.DOA.ProductDOAImple;
import com.entity.ProductDtls;

@WebServlet("/add_products")
@MultipartConfig
public class productadd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String productname=req.getParameter("pname");
			String productgrade=req.getParameter("grade");
			String price = req.getParameter("price");
			String category=req.getParameter("ctype");
			String status=req.getParameter("stype");
			String description=req.getParameter("desc");
			Part part=req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			ProductDtls b = new ProductDtls(productname, productgrade, price, category, status, description, fileName);
			ProductDOAImple doa=new ProductDOAImple(DBConnect.getConn());
			
			
			
			boolean f=doa.addProoducts(b);
			HttpSession session = req.getSession();
			
			if(f) {
				
				String path = getServletContext().getRealPath("") + "product";
				File file = new File(path);
				part.write(path + File.separator + fileName);
				
				session.setAttribute("succMSG", "product added successfully");
				resp.sendRedirect("admin/add_products.jsp");
				
			}
			else {
				
				session.setAttribute("failMSG", "something went wrong");
				resp.sendRedirect("admin/add_products.jsp");
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	
		
	}
	

}
