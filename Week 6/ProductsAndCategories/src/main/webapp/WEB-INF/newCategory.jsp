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
<title>New Category</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<div>
			<h1>New Category</h1>
		</div>
		<div>
			<a href="/">Home</a>
		</div>
		<div>
			<div>				
				<form:form action="/category/create" method="POST" modelAttribute="category">
					<div class="row mb-3">
						<form:label path="name" class="form-label">Name:</form:label>
						<form:errors path="name" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="name" class="form-control"/>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>