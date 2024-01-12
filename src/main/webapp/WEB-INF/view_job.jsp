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
<title>Job Details</title>
</head>
<body>
<div>
<a href="/dashboard">Back</a>
<a href="/logout">Logout</a>
</div>
<h2>${job.title}</h2>


        <section>
        <p>  ${job.description} </p>
        <p> Location: ${job.location} </p>
        <p> Posted by: ${job.lead.firstName} ${job.lead.lastName}</p>
        <p> Posted on: ${job.createdAt}</p>
        </section>


<c:if test = "${job.lead.id==userId}">
    <h2><a href="/jobs/delete/${job.id}">Delete Job</a></h2>
</c:if>
</body>
</html>