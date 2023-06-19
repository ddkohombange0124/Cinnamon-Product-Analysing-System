<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
    <%@page import="com.DOA.ProductDOAImple"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.ProductDtls"%>
<%@page import="com.DOA.ProductDOA"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>

<%
int pid=Integer.parseInt(request.getParameter("pid"));
ProductDOAImple doa=new ProductDOAImple(DBConnect.getConn());
ProductDtls b=doa.getProductById(pid);
%>

<div class="container p-3">
<div class="row">
<div class="col-md-6 text-center p-5 border bg-white">
<img src="product/<%=b.getImage() %>" style="height:150px ; width:150px"><br>

<h4>Product Name: <span class="text-success"><%=b.getProductname() %> </span></h4>
<h4>Product Grade: <span class="text-success"><%=b.getProductgrade() %></span></h4>
<h4>Status: <span class="text-success"><%=b.getStatus() %></span></h4>
<h4>Description:</h4><h6> <span class="text-success"><%=b.getDescription() %></span></h6>
</div>
<div class="col-md-6 text-center p-5 border bg-white">
<h2><%=b.getProductname() %></h2>

<%
if("Old product".equals(b.getStatus())){
	%>
	<h5 class="text-primary">Contact to seller</h5>
	<h5 class="text-primary"><i class="fa-solid fa-phone-volume"></i> : (+94)7689888889</h5>
	<h5 class="text-primary"><i class="fa-solid fa-envelope"></i> : admin@gmail.com</h5>
	<%
}
%>

<div class="row">
<div class="col-md-4 text-danger text-center p-2"><i class="fa-solid fa-money-bill-1-wave fa-2x"></i><p>Cash On Delivery</p></div>
<div class="col-md-4 text-danger text-center p-2"><i class="fa-solid fa-rotate-left fa-2x"></i><p>Return Available</p></div>
<div class="col-md-4 text-danger text-center p-2"><i class="fa-solid fa-truck fa-2x"></i><p>Free Shipping</p></div>
</div>

<%
if("Old product".equals(b.getStatus())){
	%>
	<div class=" text-center p-3">
<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i> Continue Shopping</a> <a href="" class="btn btn-danger"> <i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice() %></a>
</div>
	<%
}else{
	%>
	<div class=" text-center p-3">
<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a href="" class="btn btn-danger"> <i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice() %></a>
</div>
	<% 
}
%>


</div>
</div>
</div>
</body>
</html>