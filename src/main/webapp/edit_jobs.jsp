<%@page import="com.entity.Jobs"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Jobs</title>
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
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	JobDAO dao = new JobDAO(DBConnect.getconn());
	Jobs j = dao.getJobById(id);
	%>  
    <h5> Edit Jobs</h5>
    </div>      
    <form action="update" method="post">
    <input type="hidden" value="<%=j.getId()%>" name="id">
<div class="form-group">
<label>Enter title</label> <input type="text" name="title"
 class="form-control" value="<%=j.getTitle() %>">
</div>
<div class="form-row">
	<div class="form-group col-md-4">
	<label>Location</label> <select name="location"
	class="custom-select " id="inlineFormCustomSelectPref">
	<option value="<%=j.getLocation() %>"><%=j.getLocation() %></option>
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
	<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
	<option value="IT">IT</option>
	<option value="Developer">Developer</option>
	<option value="Civil Engineer">Civil Engineer</option>
	<option value="Teacher">Teacher</option>
	<option value="Doctor">Doctor</option>		
	</select>
</div>
	<div class="form-group col-md-4">
	<label>Status</label> <select class="form-control " name="status">
		<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus() %></option>
	<option class="Active" value="Active">Active</option>
		<option class="Inactive" value="Inactive">Inactive</option>		
	</select>	
</div>
	<div class="form-group col-md-4">
	<label> Enter Description</label>
	<textarea rows="10" cols="10" name="desc"  class="form-control"><%=j.getDescription() %></textarea>
</div>
<button class="btn btn-success">Update Job</button>
</form>
</div>
</div>
</div>
</div>
</body>
</html>