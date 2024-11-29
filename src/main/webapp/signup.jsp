<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup Page</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_component/navbar.jsp" %>
	
	<div class="container-fluid"></div>
	<div class="row p-4"></div>
	<div class="col-md-4 offset-md-4"></div>
	<div class="card"></div>
	<div class="card-body"></div>
	<div class = "text-center">
	<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
	<h5>Registration</h5>
	</div>
								 <c:if test="${not empty succMsg }">
											<h4 class="text-center text-success">${succMsg}</h4>
											<c:remove var="succMsg" />
											</c:if> 

<form action="add_user" method="post">
<div class="form-group">
<label>Enter full name</label> <input type="text"
required="required" class="form-control"
id = "exampleInputEmail1" aria-describedby="emailHelp"
name="name">
</div>

<div class="form-group">
<label>Enter Qualification</label> <input type="text"
required="required" class="form-control"
id = "exampleInputEmail1" aria-describedby="emailHelp"
name="qua">
</div>
		
		<div class="form-group">
    <label for="exampleInputEmail1">Enter Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="ps">
  </div>
  
  <button type="submit" class="btn btn-primary">Register</button>
</form>

</body>
</html>