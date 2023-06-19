package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.UserDOAimple;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phono=req.getParameter("phono");
			String password=req.getParameter("password");
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhono(phono);
			
			HttpSession session =req.getSession();
			UserDOAimple doa=new UserDOAimple(DBConnect.getConn());
			boolean f=doa.CheckPassword(id, password);
			
			if(f) {
				
				boolean f2=doa.UpdateProfile(us);
				
				if(f2) {
					
					session.setAttribute("succMSG", "Profile updated success..");
					resp.sendRedirect("edit_profile.jsp");
					
				}
				else {
					
					session.setAttribute("failedMsg", "something wrong on server");
					resp.sendRedirect("edit_profile.jsp");
					
				}
				
			}
			else {
				
				session.setAttribute("failedMsg", "password incorrect");
				resp.sendRedirect("edit_profile.jsp");
				
			}
			
		}
		catch(Exception e)
		
		{
			e.printStackTrace();
		}
	}
	
	

}
