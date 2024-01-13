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
<title>View Job</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-4">

<div class="d-flex justify-content-between align-items-center mb-4">
<h2>${job.title}</h2>
<div>
<a href="/dashboard" class="ms-4">Back</a>
<a href="/logout" class="ms-4">Logout</a>
</div>
</div>




        <section class="border border-dark mb-4">
        <p>  ${job.description} </p>
        <p> <strong> Location: </strong> ${job.location} </p>
        <p> <strong>Posted by: </strong> ${job.lead.firstName} ${job.lead.lastName}</p>
        <p> <strong> Posted on:</strong> <fmt:formatDate value="${job.createdAt}" pattern="MMMM dd, yyyy" /></p>
        </section>


<c:if test = "${user.id==job.join.id}">
<a href="/jobs/${job.id}/join" class="btn btn-success ms-1">Add to My Jobs</a> 
</c:if>
</div>
</body>
</html>