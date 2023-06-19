<%@page import="com.DOA.ProductDOAImple"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.ProductDtls"%>
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

<div class="container">
<div class="row">
<div class="col-md-5 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Edit Products</h4>



<%
int id=Integer.parseInt(request.getParameter("id"));

ProductDOAImple doa= new ProductDOAImple(DBConnect.getConn());
ProductDtls b=doa.getProductById(id);

%>

<form action="../edit_products" method="post" >
<input type="hidden" name="id" value="<%=b.getProductid() %>">
  <div class="form-group">
    <label for="exampleInputEmail1">Product Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="pname" value="<%=b.getProductname()%>" >
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Product Grade</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="grade" value="<%=b.getProductgrade()%>">
    
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Price</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="price" value="<%=b.getPrice()%>" >
    </div>
  
  <div class="form-group col-md-8">
      <label for="inputState">Category</label>
      <select id="inputState" name="ctype" class="form-control">
        <%if("cassia cinnamon".equals(b.getCategory()))
        	{
        	%> <option>cassia cinnamon</option>
        	<option>ceylon cinnamon</option><%
        	}
        else{
        	%> <option>ceylon cinnamon</option>
        	<option>cassia cinnamon</option><%
        }
        	%>
       
        
      </select>
    </div>
    
    <div class="form-group col-md-8">
      <label for="inputState">Status</label>
      <select id="inputState" name="stype" class="form-control" >
       <%if("cassia cinnamon".equals(b.getStatus()))
        	{
        	%> <option>Old product</option>
        	<option>New product</option><%
        	}
        else{
        	%> <option>New product</option>
        	<option>Old product</option><%
        }
        	%>
        
      </select>
    </div>
  
   <div class="form-group">
    <label for="exampleFormControlTextarea1">Description</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="desc" rows="3" ></textarea>
  </div>
  
  
  <button type="submit" class="btn btn-primary">Update</button>
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