<%@page import="java.util.ArrayList"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Jobs"%>
    <%@page import="java.util.List"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User : Single Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

		 	<c:if test="${empty userobj }">
			<c:redirect url = "login.jsp"/>
			</c:if> 
			
					
	<%@include file="all_component/navbar.jsp" %>
	<div class="container"></div>
	<div class="row"></div>
	<div class="col-md-12"></div>
	
	<h5 class="text-center text-primary">All Jobs</h5>
	
	<%
	String loc = request.getParameter("loc");
	String cat = request.getParameter("cat");
	String msg = "";
	
	JobDAO dao = new JobDAO(DBConnect.getconn());
	List<Jobs> list = null;
	if("lo". equals(loc) && "ca".equals(cat))
	{
		list = new ArrayList<Jobs>();
		msg = "Job not Available";
	} 
	else if ("lo".equals(loc) || "ca".equals(cat))
	{
			list = dao.getJobsORLocationAndCate(cat, loc);
	} 
	else
	{
			list = dao.getJobsAndLocationAndCate(cat, loc);
	}
	if(list.isEmpty()) {
	%>
	<h4 class="text-center text-danger">Job Not Available</h4>
	<%
	}
	
	if(list!=null) {
		for(Jobs j: list){
	%>
	
	<div class="card mt-2">
			<div class="card-body">
			<div class="text-center text-primary">
			<i class="far fa-clipboard fa-2x">
			</i>
			</div>
			
			<h6><%=j.getTitle() %></h6>
			<p><%=j.getDescription() %></p>
			
			<br>
			<div class="form-row">
			<div class="form-group col-md-3">
			<input type="text" class="form-control form-control-sm"
			value="Location: <%=j.getLocation()%>" readonly>
			</div>
			<div class="form-group col-md-3">
			<input type="text" class="form-control form-control-sm"
			value="Category: <%=j.getCategory() %>" readonly>			
			</div>			
			</div>
			
		<h6>
		Publish Date:
		<%=j.getPdate().toString()%></h6>
		<div class= "text-center">
		
		<a href="one_view.jsp?id=<%=j.getId()%>"
			class="btn btn-sm bg-success text-white">View more</a>
		
		
		</div>
			
	</div>
	
	</div>
	
	<% 
	}
	} else {
	%>
	<h4 class="text-center text-danger"><%=msg%></h4>
	<%
	}
	%>
</body>
</html>	