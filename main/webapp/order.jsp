<%@page import="com.entity.Product_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.ProductOrderImple"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp" %>
<div class="container p-1">
<h3 class="text-center text-primary">Your Order</h3>
<table class="table table-striped mt-3">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Product Name</th>
      <th scope="col">Grade</th>
      <th scope="col">Payment Type</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>
  <%
  
  User u=(User)session.getAttribute("userobj");
  ProductOrderImple doa = new ProductOrderImple(DBConnect.getConn());
  List<Product_Order> blist=doa.getProduct(u.getEmail());
  
  for(Product_Order b:blist)
  {%>
	 <tr>
      <th scope="row"><%=b.getOrderid() %></th>
      <td><%=b.getUsername() %></td>
      <td><%=b.getProductName() %></td>
      <td><%=b.getProductGrade() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
    </tr> 
  <%}
  
  
  %>
    
  </tbody>
</table>
</div>
</body>
</html>