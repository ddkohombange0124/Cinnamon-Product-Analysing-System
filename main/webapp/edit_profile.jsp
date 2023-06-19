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
<body style="background-color:#f0f1f2;">
<%@include file="all_component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-primary">Edit Profile</h4>

<c:if test="${not empty failedMsg }">
<h5 class="text-center text-danger">${failedMSG }</h5>
<c:remove var="failedMSG" scope="session"/>
</c:if>

<c:if test="${not empty succMSG }">
<h5 class="text-center text-success">${succMSG }</h5>
<c:remove var="succMSG" scope="session"/>
</c:if>

<form action="update_profile" method="post">
<input type="hidden" value="${userobj.id }" name="id">
  <div class="form-group">
    <label for="exampleInputEmail1">Full name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name }" placeholder="Enter full name">
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email" value="${userobj.email }" placeholder="Enter email">
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Tel No.</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phono" value="${userobj.phono }" placeholder="Enter telephone number">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password" placeholder="Password">
  </div>
  
  <button type="submit" class="btn btn-primary">Update</button>
</form>

</div>
</div>
</div>
</div>
</div>

</body>
</html>