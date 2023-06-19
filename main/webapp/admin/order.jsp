<%@page import="com.entity.Product_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.ProductOrderImple"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>
<%@include file="navbar.jsp" %>
<h3 class="text-center">hello admin</h3>

<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Product Name</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  ProductOrderImple doa=new ProductOrderImple(DBConnect.getConn());
  List<Product_Order> blist=doa.getAllOrder();
  
  for(Product_Order b:blist)
  {
	 %>
	  <tr>
      <th scope="row"><%=b.getOrderid() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladd() %></td>
      <td><%=b.getPhono() %></td>
      <td><%=b.getProductName() %></td>
      <td><%=b.getProductGrade() %></td>
       <td><%=b.getPrice() %></td>
       <td><%=b.getPaymentType() %></td>
    </tr>
	 <%
	  
  }
  %>
  
   
  </tbody>
</table>
<div style="margin-top:310px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>