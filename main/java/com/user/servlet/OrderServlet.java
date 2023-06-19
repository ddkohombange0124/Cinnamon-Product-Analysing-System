package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DOA.CartDOAImple;
import com.DOA.ProductOrderImple;
import com.entity.Cart;
import com.entity.ProductDtls;
import com.entity.Product_Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phono=req.getParameter("phono");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String zip=req.getParameter("zip");
			String paymentType=req.getParameter("payment");
			
			String fulladd=address+","+landmark+","+city+","+state+","+zip;
			
			//System.out.println(name+" "+email+" "+phono+" "+fulladd+" "+paymentType);
			
			CartDOAImple doa= new CartDOAImple(DBConnect.getConn());
			List<Cart> blist = doa.getProductByUser(id);
			
			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add item");
				resp.sendRedirect("checkout.jsp");
				
			}else
			{
				ProductOrderImple doa2= new ProductOrderImple(DBConnect.getConn());
				Product_Order o=null;
				
				
				ArrayList<Product_Order> orderList=new ArrayList<Product_Order>();
				Random r=new Random();
				for(Cart c:blist)
				{
					
					o=new Product_Order();
					o.setOrderid("PRODUCT-ORD-00"+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhono(phono);
					o.setFulladd(fulladd);
					o.setProductName(c.getProduct_name());
					o.setProductGrade(c.getProduct_grade());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					
					
				}
				
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedMSG", "please choose payment method");
					resp.sendRedirect("checkout.jsp");
				}
				else {
					boolean f=doa2.saveOrder(orderList);
					
					if(f) {
						resp.sendRedirect("order_success.jsp");
						
					}
					else {
						
						session.setAttribute("failedMSG", "your order failed");
						resp.sendRedirect("checkout.jsp");
					}
					
				}
				
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	

}
