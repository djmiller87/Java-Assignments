<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Create a Project</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<div class="d-flex justify-content-between bd-highlight mb-2 m-5">
			<div class="m-5">
				<h2>Create a Project</h2>				
			</div>
			<div>				
				<form:form action="/projects/new" method="POST" modelAttribute="project">
					<form:input path="lead" type="hidden" value="${loggedInUser.id}"/>
					<div class="row mb-3">
						<form:label path="title" class="form-label">Title:</form:label>
						<form:errors path="title" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="title" class="form-control"/>
						</div>
					</div>					
					<div class="row mb-3">
						<form:label path="description"  class="form-label">Description:</form:label>
						<form:errors path="description" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="description" class="form-control"/>
						</div>
					</div>
					<div class="row mb-3">
						<form:label path="date" class="form-label">My Thoughts:</form:label>
						<form:errors path="date" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="date" type="date" class="form-control"/>
						</div>
					</div>					
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
					<a href="/dashboard"><button class="btn btn-secondary mt-3">Cancel</button></a>
			</div>			
		</div>
	</div>

</body>
</html>