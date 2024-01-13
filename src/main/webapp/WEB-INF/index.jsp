<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Chore Tracker</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-4">
<h2>Welcome to Chore Tracker</h2>
<div class="row mt-4">
<div class="col-md-6 mx-auto">
<form:form action="/register" method="post" modelAttribute="newUser">
	<table>
		<thead>
	    	<tr>
	            <td colspan="2"> <h4> Register :</h4></td>
	        </tr>
	    </thead>
	    <thead>
	    	<tr>
	            <td class="form-label">First Name:</td>
	            <td >
	            	<form:errors path="firstName" class="text-danger"/>
					<form:input  class="form-control"  path="firstName"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="form-label">Last Name:</td>
	            <td >
	            	<form:errors path="lastName" class="text-danger"/>
					<form:input  class="form-control"  path="lastName"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="form-label">Email:</td>
	            <td >
	            	<form:errors path="email" class="text-danger"/>
					<form:input  class="form-control"  path="email"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="form-label">Password:</td>
	            <td >
	            	<form:errors path="password" class="text-danger"/>
					<form:input type="password"  class="form-control"  path="password"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="form-label">Confirm PW:</td>
	            <td >
	            	<form:errors path="confirm" class="text-danger"/>
					<form:input type="password"  class="form-control"  path="confirm"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input   class="btn btn-success"  type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</div>

<div class="col-md-6 mx-auto">
<form:form action="/login" method="post" modelAttribute="newLogin">

	<table>
		<thead>
	    	<tr>
	            <td colspan="2"><h4> Log In :</h4></td>
	        </tr>
	    </thead>
	    <thead>
	        <tr>
	            <td class="form-label">Email:</td>
	            <td >
	            	<form:errors path="email" class="text-danger"/>
					<form:input class="form-control" path="email"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="form-label">Password:</td>
	            <td>
	            	<form:errors path="password" class="text-danger"/>
					<form:input  class="form-control"  type="password" path="password"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input  class="btn btn-success"  type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
</div>
</div>
</div>
</body>
</html>