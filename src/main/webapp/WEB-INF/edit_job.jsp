<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Edit Job</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container mt-4">

<div class="d-flex justify-content-between align-items-center mb-4">
<h2>Edit Your Job Posting</h2>
<a href="/logout">Logout</a>
</div>


<form:form action="/edit/${job.id}" method="post" modelAttribute="job">

	<table>
	    <thead>
	    	<tr>
	            <td class="form-label">Title:</td>
	            <td>
	            	<form:errors path="title" class="text-danger"/>
					<form:input class="form-control" path="title" value="${job.title}"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="form-label">Description:</td>
	            <td >
	            	<form:errors path="description" class="text-danger"/>
					<form:textarea rows="4" class="form-control" path="description" value="${job.description}"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="form-label">Location:</td>
	            <td>
	            	<form:errors path="location" class="text-danger"/>
					<form:input class="form-control" path="location" type="text" value="${job.location}"/>
	            </td>
	        </tr>
	        <tr class="mt-4">
	        	<td><a class="btn btn-danger ms-1" href="/dashboard">Cancel</a></td>
	        	<td><input class="btn btn-success ms-1" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</div>
</body>
</html>