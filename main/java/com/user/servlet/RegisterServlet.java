package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.UserDOAimple;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phono=req.getParameter("phono");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			
			//System.out.println(name+""+email+""+phono+""+password+""+check);
			
			User us= new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhono(phono);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check!= null) {
			UserDOAimple doa= new UserDOAimple(DBConnect.getConn());
			boolean f2=doa.checkUser(email);
			
			if(f2) {
				
				boolean f=doa.userRegister(us);
				
				if(f) {
					//System.out.println("Register success....");
					
					session.setAttribute("succMSG", "registration success..");
					resp.sendRedirect("register.jsp");
				}
					

				else {
					//System.out.println("something went wrong !");
					session.setAttribute("failedMSG", "something went wrong !");
					resp.sendRedirect("register.jsp");
				}
				
			}
			else {
				session.setAttribute("failedMSG", "user already exist. try another email id");
				resp.sendRedirect("register.jsp");
				
			}
		
		}
		
			else {
				//System.out.println("please check agree & terms condition");
				session.setAttribute("failedMSG", "please check agree & terms condition");
				resp.sendRedirect("register.jsp");
			}
		
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
		
	}
	
	
	


