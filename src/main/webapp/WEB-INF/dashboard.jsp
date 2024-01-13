<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Chore Tracker Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>

<body  class="text-center">

<div class="container mt-4">
	<div class="d-flex justify-content-between" >
		<p >
			 Welcome,<strong> ${user.firstName} ! </strong></strong><a href="/logout">LogOut</a>
		</p>

		<a href="/addJob">Add a Job</a>
	</div>
<div class="row">
<div class="col-md-6 mx-auto">
	<table  class="text-center table table-bordered" >
		<thead>
			<tr>
				<th>Job</th>
				<th>Location</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="job" items="${jobs}">
				<c:if test="${ job.join.id == null}">
					<tr>
						<td>${job.title}</td>
						<td>${job.location}</td>
						<td class="d-flex"><a href="/view/${job.id}" class="btn btn-info ms-1">View</a> <a
							href="/jobs/${job.id}/join" class="btn btn-success ms-1">Add</a> <c:if
								test="${user==job.lead}">
								<a href="/edit/${job.id}" class="btn btn-warning ms-1">Edit</a>
								<form action="/jobs/delete/${job.id}" method="post">
									<input type="hidden" name="_method" value="delete"> <input
										type="submit" value="Cancel" class="btn btn-danger ms-1">
								</form>
							</c:if></td>

					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>

	
	 <div class="col-md-6 mx-auto">
	<table  class="text-left table table-bordered">
		<thead>
			<tr>
				<th colspan="2">My Jobs</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="job" items="${jobs}">
				<c:if test="${user.id==job.join.id}">
					<tr>
						<td>${job.title}</td>
						<td class="d-flex">
						<a href="/view/${job.id}" class="btn btn-info ms-1">View</a>
							<form action="/jobs/delete/${job.id}" method="post">
								<input type="hidden" name="_method" value="delete"> <input
									type="submit" value="Done" class="btn btn-danger ms-1">
							</form>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		
		</tbody>
	</table>
</div>
</div>
</div>
</body>
</html>