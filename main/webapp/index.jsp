<%@page import="com.entity.User"%>
<%@page import="com.DOA.ProductDOAImple"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.ProductDtls"%>
<%@page import="com.DOA.ProductDOA"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html> 
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebuy: index</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.back-img{
background: url("img/slider2_2000x_new.jpg");
height:70vh;
width:100%;
background-repeat:no-repeat;
background-size:cover;
}
.crd-ho:hover{
}

.fade-in-text {
  font-family: Arial;
  font-size: 20px;
  animation: fadeIn 5s;
  -webkit-animation: fadeIn 5s;
  -moz-animation: fadeIn 5s;
  -o-animation: fadeIn 5s;
  -ms-animation: fadeIn 5s;
}

@keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}

@-moz-keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}

@-webkit-keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}

@-o-keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}

@-ms-keyframes fadeIn {
  0% { opacity: 0; }
  100% { opacity: 1; }
}

h2{
font-family:Times New Roman;
font-size:300%;
}


</style>
</head>
<body style="background-color:#f2f7f7;">

<%User u=(User)session.getAttribute("userobj"); %>

<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid back-img">
<h2 class="text-center p-2 text-black ">Cinnamon Products Analyzing System</h2>
</div> 

<h3 class="elementor-heading-title elementor-size-default text-center p-3"> <i class="fa-regular fa-star"></i>..........* Our Products *..........<i class="fa-regular fa-star"></i></h3><br>
<div class="fade-in-text">

  <p style="width: 100%;padding: 30px;background: LightCyan; margine-left:20px;">We have experienced continuous losses during the last 6-7 years due to our traditional production process, there are more waste in the production process. So, this year again we changed our strategy and are determined to take the risk to minimize the losses we had. Therefore, in this project we are looking forward to fine tuning those decisions implemented during production process. We have identified the main cause of off cuts generated in the cinnamon sticks cutting process.

<br><br>NLC initiated various techniques and processes to reduce this waste in various ways. But we have to take cognizance of the ligly grave finally understood impact is very high on the sales perspective. Thus to check and validity of above, we started the project called Enhancing Productivity through minimizing wastage in the cinnamon sticks cutting process.</p>
</div>

<!-- start recent product -->
<hr>
<div class="container" >
<h3 class="text-center p-2">Recent Product</h3>
<div class="row">
<%
ProductDOAImple doa2=new ProductDOAImple(DBConnect.getConn());
List<ProductDtls> list2=doa2.getRecentProducts();
for(ProductDtls b:list2)
{%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="product/<%=b.getImage() %>" style="width:200px; height:200px" class="img-thumblin">
<p><%=b.getProductname() %></p>
<p>
<%
if(b.getStatus().equals("Recent product"))
{%>
Status:<%=b.getStatus()%></p>
<div class="row">

<a href="view_product.jsp?pid=<%=b.getProductid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
</div>	
<%}else{%>
Status:<%=b.getStatus()%></p>
	<div class="row">
	
	<%if(u==null)
	{%>
	<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
	<%}else
	{%>
		<a href="cart?pid=<%=b.getProductid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
	<%}
	%>
	

<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
</div>
<%}
%>


</div></div></div>
<%}
%>



</div>
<div class="text-center mt-1">
<a href="all_recent_product.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>
<hr>

<!--  recent product end -->

<!-- start new product -->

<div class="container" >
<h3 class="text-center">New Product</h3>
<div class="row">



<%
ProductDOAImple doa=new ProductDOAImple(DBConnect.getConn());
List<ProductDtls> list=doa.getNewProduct();
for(ProductDtls b:list)
{%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="product/<%=b.getImage()%>" style="width:200px; height:200px" class="img-thumblin">
<p><%=b.getProductname()%> </p>
<div class="row">

<%if(u==null)
	{%>
	<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
	<%}else
	{%>
		<a href="cart?pid=<%=b.getProductid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
	<%}
	%>

<a href="view_product.jsp?pid=<%=b.getProductid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
</div>
</div></div>
</div>
<%}
%>




</div>
<div class="text-center mt-1">
<a href="all_new_product.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>

<hr>

<!--  new product end -->

<!-- start old product -->

<div class="container" >
<h3 class="text-center">Old Product</h3>
<div class="row">
<%
ProductDOAImple doa3=new ProductDOAImple(DBConnect.getConn());
List<ProductDtls> list3=doa2.getOldProducts();
for(ProductDtls b:list3)
{%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img alt="" src="product/<%=b.getImage() %>" style="width:200px; height:200px" class="img-thumblin">
<p><%=b.getProductname() %></p>
<p><%=b.getProductgrade() %></p>
<p>Status:<%=b.getStatus()%></p>
<div class="row">

<a href="view_product.jsp?pid=<%=b.getProductid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %></a>
</div>	
</div></div></div>
<%}
%>
</div>
<div class="text-center mt-1">
<a href="all_old_product.jsp" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>

<!--  old product end -->

 

<%@include file="all_component/footer.jsp"%>>
</body>
</html>