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
<title>New Book</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<div class="d-flex justify-content-between bd-highlight mb-2 m-5">
			<div class="m-5">
				<h2>Add a Book to Your Shelf!</h2>
				<a href="/dashboard">back to the shelves</a>
			</div>
			<div>				
				<form:form action="/book/new" method="POST" modelAttribute="book">
					<form:input path="user" type="hidden" value="${loggedInUser.id}"/>
					<div class="row mb-3">
						<form:label path="title" class="form-label">Title:</form:label>
						<form:errors path="title" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="title" class="form-control"/>
						</div>
					</div>					
					<div class="row mb-3">
						<form:label path="author"  class="form-label">Author:</form:label>
						<form:errors path="author" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="author" class="form-control"/>
						</div>
					</div>
					<div class="row mb-3">
						<form:label path="thoughts" class="form-label">My Thoughts:</form:label>
						<form:errors path="thoughts" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:textarea path="thoughts" type="password" class="form-control"/>
						</div>
					</div>					
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>			
		</div>
	</div>

</body>
</html>