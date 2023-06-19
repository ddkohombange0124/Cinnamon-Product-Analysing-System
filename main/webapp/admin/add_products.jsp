<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: addproducts</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color:#f0f2f2">
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>

<div class="container">
<div class="row">
<div class="col-md-5 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Add Products</h4>

<c:if test="${not empty succMSG }">
<p class="text-center text-success">${succMSG }</p>
<c:remove var="succMSG" scope="session"/>
</c:if>

<c:if test="${not empty failMSG }">
<p class="text-center text-danger">${failMSG }</p>
<c:remove var="failMSG" scope="session"/>
</c:if>

<form action="../add_products" method="post" enctype="multipart/form-data">
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
  
  <div class="form-group col-md-8">
      <label for="inputState">Category</label>
      <select id="inputState" name="ctype" class="form-control">
        <option selected>Choose...</option>
        <option>cassia cinnamon</option>
         <option>ceylon cinnamon</option>
      </select>
    </div>
    
    <div class="form-group col-md-8">
      <label for="inputState">Status</label>
      <select id="inputState" name="stype" class="form-control">
        <option selected>Choose...</option>
        <option>Old product</option>
        <option>New product</option>
        <option>Recent product</option>
      </select>
    </div>
  
   <div class="form-group">
    <label for="exampleFormControlTextarea1">Description</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="desc" rows="3"></textarea>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlFile1">Image</label>
    <input type="file" name="bimg" class="form-control-file" id="exampleFormControlFile1" >
  </div>
  
  
  <button type="submit" class="btn btn-primary">Add</button>
</form>

</div>
</div>
</div>
</div>
</div>
<div style="margin-top: 70px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>