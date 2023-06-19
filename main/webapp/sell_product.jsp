<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Product</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="all_component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h5 class="text-center text-primary p-1">Sell Old Product</h5>

<c:if test="${not empty succMSG }">
<p class="text-center text-success">${succMSG }</p>
<c:remove var="succMSG" scope="session"/>
</c:if>

<c:if test="${not empty failMSG }">
<p class="text-center text-danger">${failMSG }</p>
<c:remove var="failMSG" scope="session"/>
</c:if>

<form action="add_old_product" method="post" enctype="multipart/form-data">

<input type="hidden" value="${userobj.email }" name="user">

  <div class="form-group">
    <label for="exampleInputEmail1">Product Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="pname" >
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Product Grade</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="grade" >
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Price</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="price" >
    </div>
  
  <div class="form-group">
    <label for="exampleFormControlFile1">Image</label>
    <input type="file" name="bimg" class="form-control-file" id="exampleFormControlFile1" >
  </div>
  
  
  <button type="submit" class="btn btn-primary">Sell</button>
</form>

</div>
</div>
</div>
</div>
</div>
</body>
</html>