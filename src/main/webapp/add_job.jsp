<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

		<c:if test="${userobj.role ne 'admin' }">
			<c:redirect url="login.jsp"></c:redirect>
			</c:if>

<%@include file="all_component/navbar.jsp" %>
<div class="container p-2">
<div class="col-md-10 offset-md-1">
<div class="card">
<div class="card-body">
<div class="text-center text-success">
<i class="fas fa-user-friends fa-3x"></i>
	 <c:if test="${not empty succMsg }">
	<div class="alert alert-success" role="alert">${succMsg}</div>
	<c:remove var="succMsg" />
    </c:if>  
    <h5> Add Jobs</h5>
    </div>
    <form action="add_job" method="post">
<div class="form-group">
<label>Enter company name</label> <input type="text" name="title"
 class="form-control">
</div>
<div class="form-row">
	<div class="form-group col-md-4">
	<label>Location</label> <select name="location"
	class="custom-select " id="inlineFormCustomSelectPref">
	<option selected>Choose...</option>
	<option value="Mumbai">Mumbai</option>
	<option value="Ahmedabad">Ahmedabad</option>
	<option value="Kolkata">Kolkata</option>
	<option value="Delhi">Delhi</option>
	<option value="Bangalore">Bangalore</option>
	<option value="Chennai">Chennai</option>
	<option value="Hyderabad">Hyderabad</option>
	</select>
	</div>
</div>
<div class="form-group col-md-4">
	<label>Category</label> <select class="custom-select "
	id="inlineFormCustomSelectPref" name="category">
	<option selected>Choose...</option>
	<option value="IT">IT</option>
	<option value="Developer">Developer</option>
	<option value="Civil Engineer">Civil Engineer</option>
	<option value="Teacher">Teacher</option>
	<option value="Doctor">Doctor</option>
	</select>
</div>
	<div class="form-group col-md-4">
	<label>Status</label> <select class="form-control " name="status">
	<option class="Active" value="Active">Active</option>
		<option class="Inactive" value="Inactive">Inactive</option>
	</select>
</div>
	<div class="form-group col-md-4">
	<label> Enter Description</label>
	<textarea rows="10" cols="10" name="desc" class="form-control"></textarea>
</div>
<button class="btn btn-success">Publish Job</button>
</form>
</div>
</div>
</div>
</div>
</body>
</html>