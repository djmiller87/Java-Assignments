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
<title>New Product</title>
</head>
<body class="text-secondary bg-dark">
	<div class="container bd-highlight">
		<div>
			<h1>New Product</h1>
		</div>
		<div>
			<a href="/">Home</a>
		</div>
		<div>
			<div>				
				<form:form action="/product/create" method="POST" modelAttribute="product">
					<div class="row mb-3">
						<form:label path="name" class="form-label">Name:</form:label>
						<form:errors path="name" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="name" class="form-control"/>
						</div>
					</div>					
					<div class="row mb-3">
						<form:label path="description" class="form-label">Description:</form:label>
						<form:errors path="description" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:textarea path="description" class="form-control"/>
						</div>
					</div>					
					<div class="row mb-3">
						<form:label path="price"  class="form-label">Price:</form:label>
						<form:errors path="price" class="text-danger m-1"></form:errors>
						<div class="col-sm-10">
							<form:input path="price" class="form-control"/>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>