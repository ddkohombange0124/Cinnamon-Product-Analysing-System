<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>All New Product</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.crd-ho:hover{
background-color:#fcf7f7;
}
</style>
</head>
<body>
<%User u=(User)session.getAttribute("userobj"); %>
<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid">
<div class="row p-3">
<%
ProductDOAImple doa=new ProductDOAImple(DBConnect.getConn());
List<ProductDtls> list=doa.getAllOldProduct();
for(ProductDtls b:list)
{%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="product/<%=b.getImage()%>" style="width:200px; height:200px" class="img-thumblin">
<p><%=b.getProductname()%> </p>

<p>
<%
if(b.getStatus().equals("Old product"))
{%>
Status:<%=b.getStatus()%></p>
<div class="row">

<a href="view_product.jsp?pid=<%=b.getProductid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
</div>	
<%}else{%>
	<div class="row">

<%if(u==null)
	{%>
	<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
	<%}else
	{%>
		<a href="cart?pid=<%=b.getProductid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
	<%}
	%>


<a href="view_product.jsp?pid=<%=b.getProductid() %>" class="btn btn-success btn-sm ml-5">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
</div>
<%}
%>
</div></div>
</div>
<%}
%>

</div>
</div>
</body>
</html>