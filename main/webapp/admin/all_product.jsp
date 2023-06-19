<%@page import="com.DOA.ProductDOAImple"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.ProductDtls"%>
<%@page import="com.DOA.ProductDOA"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin: All Products</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>
<h3 class="text-center">hello admin</h3>

<c:if test="${not empty succMSG }">
<h5 class="text-center text-success">${succMSG }</h5>
<c:remove var="succMSG" scope="session"/>
</c:if>

<c:if test="${not empty failMSG }">
<h5 class="text-center text-danger">${failMSG }</h5>
<c:remove var="failMSG" scope="session"/>
</c:if>

<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Product Name</th>
      <th scope="col">Product Grade</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Status</th>
      <th scope="col">Description</th>
       <th scope="col">Image</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  ProductDOAImple doa= new ProductDOAImple(DBConnect.getConn());
  List<ProductDtls> list = doa.getAllProducts();
  for(ProductDtls b : list) {
  %>
	   <tr>
      <td><%=b.getProductid()%></td>
      <td><%=b.getProductname()%></td>
      <td><%=b.getProductgrade()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getCategory()%></td>
      <td><%=b.getStatus()%></td>
      <td><%=b.getDescription()%></td>
      <td><img src="../product/<%=b.getImage()%>"
      style="width:50px; height:50px;"></td>
     
      <td>
      <a href="edit_products.jsp?id=<%=b.getProductid()%>" class="btn btn-sm btn-primary">Edit</a>
      <a href="../delete?id=<%=b.getProductid()%>" class="btn btn-sm btn-danger">Delete</a>
      </td>
      
    </tr>
  <%
  }
  %>
  
  </tbody>
</table>
<div style="margin-top: 290px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>