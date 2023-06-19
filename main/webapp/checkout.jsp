<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DOA.CartDOAImple"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart page</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f2f7f7;">
<%@include file="all_component/navbar.jsp" %>
<c:if test="${empty userobj }"><c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty succMSG }"><div class="alert alert-success" role="alert">
 ${succMSG}</div>
 <c:remove var="succMSG" scope="session" /></c:if>

<c:if test="${not empty failedMSG }"><div class="alert alert-danger" role="alert">
 ${failedMSG}</div>
 <c:remove var="failedMSG" scope="session" /></c:if>

<div class="container">
<div class="row p-2">
<div class="col-md-6">
<div class="card bg-white">
<div class="card-body">
<h3 class="text-center text-success">Your selected item</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Product Name</th>
      <th scope="col">Product Grade</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  
  CartDOAImple doa=new CartDOAImple(DBConnect.getConn());
  List<Cart> cart=doa.getProductByUser(u.getId());
  Double totalPrica=0.00;
  for (Cart c : cart){
	  totalPrica= c.getTotal_prica();
  %>
	 <tr>
      <th scope="row"><%=c.getProduct_name() %></th>
      <td><%=c.getProduct_grade() %></td>
      <td><%=c.getPrice() %></td>
      <td><a href="remove_product?pid=<%=c.getPid() %>&&uid=<%=c.getUserId() %> &&cid=<%=c.getCid() %>" 
      class="btn btn-sm btn-danger">Remove</a></td>
    </tr> 
  <%}
  %> 
  <tr>
  <td>Total Price</td>
  <td></td>
  <td></td>
  <td><%=totalPrica %></td>
  </tr>
  </tbody>
</table>
</div>
</div>
</div>
<div class="col-md-6">
<div class="card">
<div class="card-body">
<h3 class="text-center text-success">Your Details For Order</h3>
<form action="order" method="post">
<input type="hidden" value="${userobj.id }" name="id">
<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4" name="username" value="${userobj.name}" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" name="email" value="${userobj.email }" required>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Phone Number</label>
      <input type="number" class="form-control" id="inputEmail4" name="phon0" value="${userobj.phono }"required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Address</label>
      <input type="text" class="form-control" id="inputPassword4" name="address" required>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Land Mark</label>
      <input type="text" class="form-control" id="inputEmail4" name="landmark" required >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">City</label>
      <input type="text" class="form-control" id="inputPassword4" name="city" required>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">State</label>
      <input type="text" class="form-control" id="inputEmail4" name="state"required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Zip</label>
      <input type="text" class="form-control" id="inputPassword4" name="zip" required>
    </div>
  </div>
  <div class="form-group">
  <label>Payment Mode</label>
  <select class="form-control" name="payment">
  <option value="noselect">---Select---</option>
  <option value="COD">Cash On Delivery</option>
  </select>
  </div>
  <div class="text-center">
  <button class="btn btn-warning">Order Now</button>
  <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
  </div>
</form>

</div>
</div>
</div>
</div>
</div>
</body>
</html>