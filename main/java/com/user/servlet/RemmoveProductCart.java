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

@WebServlet("/remove_product")
public class RemmoveProductCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid=Integer.parseInt(req.getParameter("pid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		
		CartDOAImple doa =new CartDOAImple(DBConnect.getConn());
		boolean f=doa.deleteProduct(pid,uid,cid);
		HttpSession session = req.getSession();
		
		if(f)
		{
			session.setAttribute("succMSG", "product removed from cart");
			resp.sendRedirect("checkout.jsp");
		}
		else {
			session.setAttribute("failedMSG", "something wrong on server");
			resp.sendRedirect("checkout.jsp");
			
		}
	}
	
	

}
