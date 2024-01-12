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
</head>
<body>

<h2><a href="/dashboard">Dashboard</a></h2>

<h1>Edit Job</h1>

<form:form action="/jobs/edit/${job.id}" method="post" modelAttribute="job">

	<table>
	    <thead>
	    	<tr>
	            <td class="float-left">Title:</td>
	            <td class="float-left">
	            	<form:errors path="title" class="text-danger"/>
					<form:input class="input" path="title" value="${job.title}"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Description:</td>
	            <td class="float-left">
	            	<form:errors path="description" class="text-danger"/>
					<form:textarea rows="4" class="input" path="description" value="${job.description}"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Location:</td>
	            <td class="float-left">
	            	<form:errors path="location" class="text-danger"/>
					<form:input path="location" type="text" value="${job.location}"/>
	            </td>
	        </tr>
	        <tr>
	        	<td><a class="linkBtn" href="/dashboard">Cancel</a></td>
	        	<td><input class="input" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</body>
</html>