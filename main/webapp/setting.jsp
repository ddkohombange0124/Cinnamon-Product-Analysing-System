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
<style type="text/css">
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:none;
}
</style>
</head>
<body style="background-color:#f0f1f2;">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>
<%@include file="all_component/navbar.jsp" %>

<div class="container">
<c:if test="${not empty userobj }">
<h3 class="text-center p-4">Hello, ${userobj.name }</h3>
</c:if>
<div class="row p-3">
<div class="col-md-6">
<a href="sell_product.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class="fa-solid fa-leaf fa-3x"></i>
</div>
<h4>Sell Old Product</h4>
</div>
</div>
</a>
</div>

<div class="col-md-6">
<a href="edit_profile.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class="fa-solid fa-pen-to-square fa-3x"></i>
</div>
<h4>Edit Profile</h4>
</div>
</div>
</a>
</div>



<div class="col-md-6 mt-3">
<a href="order.jsp">
<div class="card">
<div class="card-body text-center">
<div class=" text-danger">
<i class="fa-solid fa-box-open fa-3x"></i>
</div>
<h4>Your Order</h4>
<p>Track Your Order</p>
</div>
</div>
</a>

</div>

<div class="col-md-6 mt-3">
<a href="help_line.jsp">
<div class="card">
<div class="card-body text-center">
<div class=" text-primary">
<i class="fas fa-user-circle fa-3x"></i>
</div>
<h4>Help Center</h4>
<p>24*7 Service</p>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-3">
<a href="showgraphs.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class="fa-solid fa-chart-simple fa-3x"></i>
</div>
<h4>Show Analysis Graphs</h4>
</div>
</div>
</a>
</div>

</div>

</div>
<div style="margin-top: 150px">
<%@include file="all_component/footer.jsp" %>
</div>
</body>
</html>