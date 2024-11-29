<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img{
background: url("img/admin_img.png");
width: 70%;
height: 90vh;
background-repeat: no-repeat;
background-size: cover;
}
</style>

</head>
<body style="background-color: #f0f1f2;">

			<c:if test="${userobj.role ne 'admin' }">
			<c:redirect url="login.jsp"></c:redirect>
			</c:if>

<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid back-img">
	<div class="text-center">
	<h1 class= "text-black p-4">Welcome admin</h1>
</div>	
	
</div>
</body>
</html>